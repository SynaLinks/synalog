// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Contradictory conditions: a rule whose comparisons can never all hold.
//!
//! The comparisons of a rule's body (`<`, `<=`, `>`, `>=`, `==`, `!=`)
//! between variables and constants are an order: `a < b, b <= a` is a cycle
//! through a strict edge, `a == 3, a == 4` makes two constants equal, and
//! `a <= b, b <= a, a != b` asks two equal things to differ. Such a rule gives
//! no row, which is almost always a mistake (a reversed comparison, a wrong
//! constant). Only the conditions the rule always applies are read, not those
//! inside a disjunction, a negation or an aggregate, and an expression other
//! than a variable or a constant (arithmetic, a call) is left out, so what is
//! reported can never hold; some contradictions are not found.

use crate::parser::Json;

/// A side of a comparison: a variable or a constant.
#[derive(Clone, Debug, PartialEq, Eq, Hash)]
enum Term {
    Var(String),
    /// A number, by its value (`2` and `2.0` are one term).
    Num(String),
    Str(String),
}

fn term(expr: &Json) -> Option<Term> {
    if !expr.is_object() {
        return None;
    }
    let o = expr.as_object();
    if let Some(v) = o.get("variable") {
        return Some(Term::Var(v.as_object()["var_name"].as_str().to_string()));
    }
    let literal = o.get("literal")?.as_object();
    if let Some(n) = literal.get("the_number") {
        let text = if n.is_object() { n.as_object()["number"].as_str().to_string() } else { n.to_string() };
        let value: f64 = text.parse().ok()?;
        return Some(Term::Num(format!("{}", value)));
    }
    if let Some(s) = literal.get("the_string") {
        let text = if s.is_object() { s.as_object()["the_string"].as_str().to_string() } else { s.as_str().to_string() };
        return Some(Term::Str(text));
    }
    None
}

fn heritage(expr: &Json) -> String {
    if expr.is_object() {
        if let Some(h) = expr.as_object().get("expression_heritage") {
            return h.as_str().to_string();
        }
    }
    String::new()
}

/// The comparisons a body always applies: (left, operator, right, text).
fn comparisons(body: &Json) -> Vec<(Term, &'static str, Term, String)> {
    let mut out = Vec::new();
    let Some(conjuncts) = body
        .as_object()
        .get("conjunction")
        .and_then(|c| c.as_object().get("conjunct"))
    else {
        return out;
    };
    for c in conjuncts.as_array() {
        let o = c.as_object();
        if let Some(u) = o.get("unification") {
            let u = u.as_object();
            let (l, r) = (&u["left_hand_side"], &u["right_hand_side"]);
            if let (Some(a), Some(b)) = (term(l), term(r)) {
                out.push((a, "==", b, format!("{} == {}", heritage(l), heritage(r))));
            }
            continue;
        }
        let Some(p) = o.get("predicate") else { continue };
        let p = p.as_object();
        let op: &'static str = match p["predicate_name"].as_str() {
            "<" => "<",
            "<=" => "<=",
            ">" => ">",
            ">=" => ">=",
            "==" => "==",
            "!=" => "!=",
            _ => continue,
        };
        let fvs = p["record"].as_object()["field_value"].as_array();
        let side = |name: &str| {
            fvs.iter()
                .find(|fv| fv.as_object()["field"].is_string() && fv.as_object()["field"].as_str() == name)
                .and_then(|fv| fv.as_object()["value"].as_object().get("expression").cloned())
        };
        let (Some(l), Some(r)) = (side("left"), side("right")) else { continue };
        if let (Some(a), Some(b)) = (term(&l), term(&r)) {
            out.push((a, op, b, format!("{} {} {}", heritage(&l), op, heritage(&r))));
        }
    }
    out
}

/// Whether the comparisons can never all hold.
fn contradictory(cmps: &[(Term, &'static str, Term, String)]) -> bool {
    let mut nodes: Vec<Term> = Vec::new();
    let index = |t: &Term, nodes: &mut Vec<Term>| -> usize {
        nodes.iter().position(|n| n == t).unwrap_or_else(|| {
            nodes.push(t.clone());
            nodes.len() - 1
        })
    };
    // reach[a][b]: None, Some(false) a <= b, Some(true) a < b.
    let mut edges: Vec<(usize, usize, bool)> = Vec::new();
    let mut differ: Vec<(usize, usize)> = Vec::new();
    for (a, op, b, _) in cmps {
        let (i, j) = (index(a, &mut nodes), index(b, &mut nodes));
        match *op {
            "<" => edges.push((i, j, true)),
            "<=" => edges.push((i, j, false)),
            ">" => edges.push((j, i, true)),
            ">=" => edges.push((j, i, false)),
            "==" => {
                edges.push((i, j, false));
                edges.push((j, i, false));
            }
            _ => differ.push((i, j)),
        }
    }
    // Constants are ordered among themselves (numbers, and strings, apart).
    for i in 0..nodes.len() {
        for j in 0..nodes.len() {
            let less = match (&nodes[i], &nodes[j]) {
                (Term::Num(a), Term::Num(b)) => a.parse::<f64>().ok() < b.parse::<f64>().ok(),
                (Term::Str(a), Term::Str(b)) => a < b,
                _ => false,
            };
            if less {
                edges.push((i, j, true));
            }
        }
    }
    let n = nodes.len();
    let mut reach: Vec<Vec<Option<bool>>> = vec![vec![None; n]; n];
    for (i, j, strict) in edges {
        let cur = reach[i][j];
        reach[i][j] = Some(cur.unwrap_or(false) || strict);
    }
    for k in 0..n {
        for i in 0..n {
            for j in 0..n {
                if let (Some(a), Some(b)) = (reach[i][k], reach[k][j]) {
                    let cur = reach[i][j];
                    reach[i][j] = Some(cur.unwrap_or(false) || a || b);
                }
            }
        }
    }
    (0..n).any(|i| reach[i][i] == Some(true))
        || differ.iter().any(|&(i, j)| i == j || (reach[i][j].is_some() && reach[j][i].is_some()))
}

/// A warning for each rule whose conditions contradict each other. A rule
/// with a disjunction in its body is split into one rule per branch, all with
/// the rule's text: it gives no row only when every branch contradicts itself.
pub fn check_contradictions(rules: &[&Json]) -> Vec<String> {
    let mut by_text: Vec<(String, bool, Vec<String>)> = Vec::new();
    for rule in rules {
        let Some(body) = rule.as_object().get("body") else { continue };
        let text = rule.as_object().get("full_text").map(|t| t.as_str().trim().to_string()).unwrap_or_default();
        let cmps = comparisons(body);
        let dead = !cmps.is_empty() && contradictory(&cmps);
        let conditions: Vec<String> = cmps.iter().map(|c| c.3.clone()).collect();
        match by_text.iter_mut().find(|(t, _, _)| *t == text) {
            Some(entry) => {
                entry.1 &= dead;
                for c in conditions {
                    if !entry.2.contains(&c) {
                        entry.2.push(c);
                    }
                }
            }
            None => by_text.push((text, dead, conditions)),
        }
    }
    by_text
        .into_iter()
        .filter(|(_, dead, _)| *dead)
        .map(|(text, _, conditions)| {
            format!(
                "Contradictory conditions: {} can never all hold, so the rule gives no row: {}",
                conditions.join(", "),
                text
            )
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::parser::parse_file;

    fn warnings(source: &str) -> Vec<String> {
        let parsed = parse_file(source, None, &[]).unwrap();
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        check_contradictions(&rules)
    }

    #[test]
    fn reversed_comparisons_contradict() {
        assert_eq!(warnings("V(x: 1);\nC(a:) :- V(x: a), V(x: b), a < b, a >= b;").len(), 1);
    }

    #[test]
    fn two_constants_contradict() {
        assert_eq!(warnings("V(x: 1);\nC(a:) :- V(x: a), a == 3, a == 4;").len(), 1);
        assert_eq!(warnings("V(x: 1);\nC(a:) :- V(x: a), a > 5, a < 3;").len(), 1);
        assert_eq!(warnings("V(s: \"x\");\nC(s:) :- V(s:), s == \"a\", s == \"b\";").len(), 1);
    }

    #[test]
    fn every_branch_contradicting_is_reported_once() {
        assert_eq!(warnings("V(x: 1);\nC(a:) :- V(x: a), (a < 0 | a > 5), a == 3;").len(), 1);
    }

    #[test]
    fn equal_things_cannot_differ() {
        assert_eq!(warnings("V(x: 1);\nC(a:) :- V(x: a), V(x: b), a <= b, b <= a, a != b;").len(), 1);
        assert_eq!(warnings("V(x: 1);\nC(a:) :- V(x: a), a != a;").len(), 1);
    }

    #[test]
    fn consistent_conditions_pass() {
        assert!(warnings("V(x: 1);\nC(a:) :- V(x: a), V(x: b), a < b, a > 0, b < 10;").is_empty());
        assert!(warnings("V(x: 1);\nC(a:) :- V(x: a), a >= 3, a <= 3;").is_empty());
        assert!(warnings("V(x: 1);\nC(a:) :- V(x: a), a == 2, a == 2.0;").is_empty());
        // One branch of a disjunction cannot hold, the other can.
        assert!(warnings("V(x: 1);\nC(a:) :- V(x: a), (a < 0 | a > 1), a == 3;").is_empty());
    }
}
