// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Undefined predicate reference check.
//!
//! In Synalog a body reference to a name that is not defined anywhere is *not*
//! an error by itself: the compiler silently treats it as an external database
//! table (a "table alias", see `compiler::universe`). That is exactly what makes
//! a misspelled predicate name dangerous — `Custmer(id:)` does not fail to
//! compile, it quietly reads from a phantom `custmer` table and returns nothing.
//!
//! This check flags such references and, when a defined predicate is close
//! enough by edit distance, proposes it ("did you mean ...?").
//!
//! ## What is checked
//!
//! Only *predicate references* (`{"predicate": {...}}` in a body) whose name is
//! written in the predicate convention (an initial uppercase letter). Two kinds
//! of names are deliberately left alone:
//!   * **Lowercase references** — these are raw database tables, referenced by
//!     their database name in the `# Tables` section (`Table(c:) :- table(c:)`).
//!   * **Function calls** (`{"call": {...}}`) — any unknown function name is
//!     emitted as an uppercased SQL function (`Coalesce` → `COALESCE`), so an
//!     undefined call name is a legitimate SQL passthrough, not a typo we can
//!     diagnose.
//!
//! Built-in library predicates (`Today`, `Now`, `Num`, ...) and built-in
//! functions/operators synthesized by desugaring (`IsNull` from negation,
//! `Constraint`, `MagicalEntangle`, ...) are never flagged.

use std::collections::{BTreeSet, HashSet};
use std::sync::OnceLock;

use crate::compiler::dialects;
use crate::compiler::expr_translate::ExprTranslator;
use crate::errors::VerifyError;
use crate::parser::Json;

use super::reserved::reserved_predicate_names;

/// Undefined predicate reference error (one per offending name).
#[derive(Debug, Clone)]
pub struct UndefinedError {
    /// The undefined predicate name as written.
    pub predicate: String,
    /// Closest defined name, if one is near enough to be a likely typo.
    pub suggestion: Option<String>,
    /// Source text of the rule the reference appears in.
    pub rule: String,
}

impl std::fmt::Display for UndefinedError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match &self.suggestion {
            Some(s) => write!(
                f,
                "Undefined predicate '{}': not defined and not a built-in — did you mean '{}'?",
                self.predicate, s
            ),
            None => write!(
                f,
                "Undefined predicate '{}': not defined and not a built-in",
                self.predicate
            ),
        }
    }
}

impl std::error::Error for UndefinedError {}

impl From<UndefinedError> for VerifyError {
    fn from(e: UndefinedError) -> Self {
        VerifyError::UndefinedPredicate {
            predicate: e.predicate,
            suggestion: e.suggestion,
            rule: e.rule,
        }
    }
}

impl From<UndefinedError> for crate::errors::SynalogError {
    fn from(e: UndefinedError) -> Self {
        crate::errors::SynalogError::Verify(e.into())
    }
}

/// Names that must never be flagged: every dialect's built-in functions and
/// operators (`Substr`, `Range`, `IsNull`, `Constraint`, `MagicalEntangle`, …).
/// Unioned over all dialects like the reserved-name check, so a dialect-specific
/// built-in is never mistaken for a user predicate.
///
/// Public because embedders resolve references themselves: a host that stores
/// predicates outside a `.l` file (and so cannot rely on this check) still has
/// to tell a function call apart from a relational reference, and rebuilding
/// the list by hand guarantees it drifts.
pub fn builtin_function_names() -> &'static HashSet<String> {
    static BUILTINS: OnceLock<HashSet<String>> = OnceLock::new();
    BUILTINS.get_or_init(|| {
        let mut names = HashSet::new();
        for engine in dialects::SUPPORTED_ENGINES {
            if let Ok(dialect) = dialects::get(engine) {
                names.extend(ExprTranslator::basis_functions(dialect.as_ref()));
            }
        }
        names
    })
}

/// True if `name` is written in the predicate convention (initial uppercase
/// ASCII letter). Lowercase names are raw database tables; operator names
/// (`>`, `==`, `++?`, `!`) and annotations (`@OrderBy`) are not predicates.
fn looks_like_predicate(name: &str) -> bool {
    name.chars().next().is_some_and(|c| c.is_ascii_uppercase())
}

/// Collect the names of all predicates defined in this program (every rule head,
/// including those merged in from imports).
fn defined_predicates(rules: &[&Json]) -> HashSet<String> {
    let mut defined = HashSet::new();
    for rule in rules {
        let name = rule.as_object()["head"].as_object()["predicate_name"].as_str();
        if !name.starts_with('@') {
            defined.insert(name.to_string());
        }
    }
    defined
}

/// Levenshtein edit distance between two strings, computed over characters.
fn levenshtein(a: &str, b: &str) -> usize {
    let a: Vec<char> = a.chars().collect();
    let b: Vec<char> = b.chars().collect();
    if a.is_empty() {
        return b.len();
    }
    if b.is_empty() {
        return a.len();
    }
    // Single-row DP: prev[j] is the distance for the previous `a` prefix.
    let mut prev: Vec<usize> = (0..=b.len()).collect();
    for (i, &ca) in a.iter().enumerate() {
        let mut diag = prev[0]; // prev[j-1] before it is overwritten
        prev[0] = i + 1;
        for (j, &cb) in b.iter().enumerate() {
            let cost = if ca == cb { 0 } else { 1 };
            let candidate = (prev[j] + 1).min(prev[j + 1] + 1).min(diag + cost);
            diag = prev[j + 1];
            prev[j + 1] = candidate;
        }
    }
    prev[b.len()]
}

/// Find the closest candidate to `name` within a length-scaled threshold.
/// Longer names tolerate more typos; very short names require an exact-ish match.
fn closest_match<'a>(name: &str, candidates: &'a HashSet<String>) -> Option<&'a String> {
    let max_dist = (name.chars().count() / 3).max(1);
    let mut best: Option<(&String, usize)> = None;
    for cand in candidates {
        let dist = levenshtein(name, cand);
        if dist == 0 || dist > max_dist {
            continue;
        }
        if best.is_none_or(|(_, b)| dist < b) {
            best = Some((cand, dist));
        }
    }
    best.map(|(c, _)| c)
}

/// Run the undefined-reference check over all rules.
pub fn check_undefined(rules: &[&Json]) -> Vec<UndefinedError> {
    let defined = defined_predicates(rules);
    let builtins = builtin_function_names();
    let reserved = reserved_predicate_names();

    // Candidates we are willing to suggest: predicates the user could reference
    // in predicate position — their own definitions and built-in library
    // predicates (`Today`, `Now`, `Num`, ...). Plain SQL functions are excluded;
    // suggesting `SUBSTR` for a relational typo would be noise.
    let mut candidates = defined.clone();
    candidates.extend(reserved.iter().cloned());

    let mut errors = Vec::new();
    let mut seen = HashSet::new();

    for rule in rules {
        let rule_txt = rule_text(rule);
        if let Some(body) = rule.as_object().get("body") {
            let mut refs = BTreeSet::new();
            collect_body_refs(body, &mut refs);
            for name in refs {
                if !looks_like_predicate(&name)
                    || defined.contains(&name)
                    || builtins.contains(&name)
                    || reserved.contains(&name)
                {
                    continue;
                }
                if !seen.insert(name.clone()) {
                    continue;
                }
                let suggestion = closest_match(&name, &candidates).cloned();
                errors.push(UndefinedError {
                    predicate: name,
                    suggestion,
                    rule: rule_txt.clone(),
                });
            }
        }
    }

    errors
}

/// Source text of a rule for error context.
fn rule_text(rule: &Json) -> String {
    rule.as_object()
        .get("full_text")
        .map(|j| j.as_str().to_string())
        .unwrap_or_else(|| "<unknown>".to_string())
}

/// Collect predicate-reference names from a rule body. Mirrors the body walk in
/// `arity`/`recursion`: descends into conjunctions, disjunction branches, and
/// the bodies of aggregating `combine` subqueries. Function `call` names are
/// intentionally not collected.
fn collect_body_refs(body: &Json, out: &mut BTreeSet<String>) {
    let obj = body.as_object();
    if let Some(conj) = obj.get("conjunction") {
        if let Some(conjuncts) = conj.as_object().get("conjunct") {
            for c in conjuncts.as_array() {
                collect_conjunct_refs(c, out);
            }
        }
    }
}

fn collect_conjunct_refs(conjunct: &Json, out: &mut BTreeSet<String>) {
    let obj = conjunct.as_object();

    if let Some(pred) = obj.get("predicate") {
        let name = pred.as_object()["predicate_name"].as_str();
        out.insert(name.to_string());
        // A negation `~P(...)` is `IsNull(combine ...)`: P is in the argument.
        collect_expr_refs(pred, out);
        return;
    }

    if let Some(disj) = obj.get("disjunction") {
        if let Some(branches) = disj.as_object().get("disjunct") {
            for branch in branches.as_array() {
                collect_body_refs(branch, out);
            }
        }
    }

    if let Some(unif) = obj.get("unification") {
        let u = unif.as_object();
        if let Some(rhs) = u.get("right_hand_side") {
            collect_expr_refs(rhs, out);
        }
        if let Some(lhs) = u.get("left_hand_side") {
            collect_expr_refs(lhs, out);
        }
    }
}

/// Descend into expressions only far enough to reach predicate references that
/// live inside aggregating `combine` subqueries. Plain `call` function names are
/// not collected (they are SQL passthroughs, not relational references).
fn collect_expr_refs(expr: &Json, out: &mut BTreeSet<String>) {
    match expr {
        Json::Object(obj) => {
            if let Some(combine) = obj.get("combine") {
                if let Some(body) = combine.as_object().get("body") {
                    collect_body_refs(body, out);
                }
                return;
            }
            for (_, value) in obj.iter() {
                collect_expr_refs(value, out);
            }
        }
        Json::Array(items) => items.iter().for_each(|item| collect_expr_refs(item, out)),
        _ => {}
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::parser::parse_file;

    fn parse(code: &str) -> Json {
        parse_file(code, None, &[]).unwrap()
    }

    fn check(code: &str) -> Vec<UndefinedError> {
        let parsed = parse(code);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let normal: Vec<&Json> = rules
            .into_iter()
            .filter(|r| {
                !r.as_object()["head"].as_object()["predicate_name"]
                    .as_str()
                    .starts_with('@')
            })
            .collect();
        check_undefined(&normal)
    }

    #[test]
    fn test_defined_reference_ok() {
        let errors = check(
            r#"
            Customer(id:, name:) :- customers(id:, name:);
            Greeting(id:, name:) :- Customer(id:, name:);
        "#,
        );
        assert!(errors.is_empty(), "{:?}", errors);
    }

    #[test]
    fn test_lowercase_table_not_flagged() {
        // The raw db table `customers` in the Tables section is not a predicate.
        let errors = check(r#"Customer(id:, name:) :- customers(id:, name:);"#);
        assert!(errors.is_empty(), "{:?}", errors);
    }

    #[test]
    fn test_undefined_with_suggestion() {
        let errors = check(
            r#"
            Customer(id:, name:) :- customers(id:, name:);
            Greeting(id:) :- Custmer(id:);
        "#,
        );
        assert_eq!(errors.len(), 1, "{:?}", errors);
        assert_eq!(errors[0].predicate, "Custmer");
        assert_eq!(errors[0].suggestion.as_deref(), Some("Customer"));
    }

    #[test]
    fn test_undefined_without_suggestion() {
        let errors = check(
            r#"
            Customer(id:, name:) :- customers(id:, name:);
            Greeting(id:) :- Zzzqxw(id:);
        "#,
        );
        assert_eq!(errors.len(), 1, "{:?}", errors);
        assert_eq!(errors[0].predicate, "Zzzqxw");
        assert_eq!(errors[0].suggestion, None);
    }

    #[test]
    fn test_builtin_not_flagged() {
        // Today/Now and built-in functions are not undefined.
        let errors = check(
            r#"
            Recent(id:, created_at:) :-
              orders(id:, created_at:),
              Today(date:),
              Substr(ToString(created_at), 1, 7) == Substr(date, 1, 7);
        "#,
        );
        assert!(errors.is_empty(), "{:?}", errors);
    }

    #[test]
    fn test_reference_inside_aggregate() {
        let errors = check(
            r#"
            Sale(id:, amount:) :- sales(id:, amount:);
            Total(total? += amount) distinct :- Saale(amount:);
        "#,
        );
        assert_eq!(errors.len(), 1, "{:?}", errors);
        assert_eq!(errors[0].predicate, "Saale");
        assert_eq!(errors[0].suggestion.as_deref(), Some("Sale"));
    }

    #[test]
    fn test_dedup_per_name() {
        let errors = check(
            r#"
            Customer(id:) :- customers(id:);
            A(id:) :- Custmer(id:);
            B(id:) :- Custmer(id:);
        "#,
        );
        assert_eq!(errors.len(), 1, "{:?}", errors);
    }

    #[test]
    fn test_reference_inside_negation() {
        let errors = check("Node(x:) :- x in [1];\nSink(x:) :- Node(x:), ~Edeg(a: x);");
        assert_eq!(errors.len(), 1);
        assert_eq!(errors[0].predicate, "Edeg");
    }

    #[test]
    fn test_levenshtein() {
        assert_eq!(levenshtein("Customer", "Custmer"), 1);
        assert_eq!(levenshtein("Sale", "Saale"), 1);
        assert_eq!(levenshtein("abc", "abc"), 0);
        assert_eq!(levenshtein("", "abc"), 3);
        assert_eq!(levenshtein("kitten", "sitting"), 3);
    }

    /// The exported list is what embedders resolve references against, so the
    /// string-manipulation built-ins a rule reaches for must be in it.
    #[test]
    fn test_builtin_function_names_exported() {
        let builtins = builtin_function_names();
        for name in ["Substr", "ToString", "Like", "Upper", "Length", "IsNull"] {
            assert!(builtins.contains(name), "{name} missing from built-in functions");
        }
        // Predicates are a different namespace: they belong to the reserved
        // list, and mixing the two would let a program redefine `Today`.
        assert!(!builtins.contains("Customer"));
    }

    /// A call to a built-in is not a relational reference — the regression
    /// behind hosts reporting `Substr` as an unknown predicate.
    #[test]
    fn test_builtin_calls_are_not_references() {
        let errors = check(
            r#"
            Sale(id:, day:) :- sales(id:, created_at:), day == Substr(ToString(created_at), 1, 10);
            Invoice(id:) :- sales(id:, subject:), Like(subject, "Facture%") == true;
        "#,
        );
        assert!(errors.is_empty(), "{errors:?}");
    }
}
