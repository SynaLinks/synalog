// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! What each predicate of a program depends on.
//!
//! A host that keeps its own dependency graph (one node per predicate, an
//! edge per dependency) reads it from here rather than walking the AST:
//! the edges are then exactly what synalog reads. A predicate depends on
//!   * the predicates and tables its bodies read (`undefined::collect_body_refs`,
//!     a `combine` in its head included);
//!   * the predicates its `@Assert` statements name;
//!   * for a functor's result (`P := F(A: B)`), the functor and its arguments.
//!
//! The bodies synalog splits a multi-body aggregate into
//! (`<Name>_MultBodyAggAux`) are their predicate's. Built-in predicates and
//! functions are left out, and so is the predicate itself.

use std::collections::{BTreeMap, BTreeSet};

use crate::parser::Json;

use super::reserved::reserved_predicate_names;
use super::undefined::{builtin_function_names, collect_body_refs, collect_expr_refs};

const AUX_SUFFIX: &str = "_MultBodyAggAux";

/// Every predicate the program defines, and what it depends on. `rules`
/// must include the annotation rules.
pub fn dependencies(rules: &[&Json]) -> BTreeMap<String, BTreeSet<String>> {
    let mut found: BTreeMap<String, BTreeSet<String>> = BTreeMap::new();
    for rule in rules {
        let head = rule.as_object()["head"].as_object();
        let name = head["predicate_name"].as_str();
        if name == "@Make" {
            if let Some((result, applied, arguments)) = super::functors::functor_names(rule) {
                found.entry(result).or_default().extend(std::iter::once(applied).chain(arguments));
            }
            continue;
        }
        if name.starts_with('@') {
            continue;
        }
        let mut refs = BTreeSet::new();
        if let Some(body) = rule.as_object().get("body") {
            collect_body_refs(body, &mut refs);
        }
        if let Some(record) = head.get("record") {
            collect_expr_refs(record, &mut refs);
        }
        found.entry(name.strip_suffix(AUX_SUFFIX).unwrap_or(name).to_string()).or_default().extend(refs);
    }
    let (assertions, _) = super::assertions::check_assertions(rules);
    for assertion in assertions {
        if let Some(refs) = found.get_mut(&assertion.predicate) {
            refs.extend(assertion.predicates);
        }
    }
    let reserved = reserved_predicate_names();
    let builtins = builtin_function_names();
    for (name, refs) in found.iter_mut() {
        refs.retain(|r| r != name && !r.ends_with(AUX_SUFFIX) && !reserved.contains(r) && !builtins.contains(r));
    }
    found
}
