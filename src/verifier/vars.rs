// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Variable collection utilities for Logica AST.
//!
//! Mirrors the Lean 4 specification for variable analysis.

use std::collections::HashSet;
use crate::parser::Json;

/// Comparison operators that don't bind variables.
const COMPARISON_OPS: &[&str] = &[">", "<", ">=", "<=", "==", "!=", "<>"];

/// Aggregation functions.
const AGGREGATION_FNS: &[&str] = &["Sum", "Count", "Min", "Max", "Avg", "List", "Array", "ArrayConcat"];

/// Collects variables from Logica AST nodes.
pub struct VarCollector;

impl VarCollector {
    /// Collect all variables in an expression.
    pub fn expr_vars(expr: &Json) -> HashSet<String> {
        let mut vars = HashSet::new();
        Self::collect_expr_vars(expr, &mut vars);
        vars
    }

    fn collect_expr_vars(expr: &Json, vars: &mut HashSet<String>) {
        let obj = expr.as_object();

        // Variable
        if let Some(var_obj) = obj.get("variable") {
            let name = var_obj.as_object()["var_name"].as_var_name();
            if name != "_" {
                vars.insert(name);
            }
            return;
        }

        // Literal - no variables
        if obj.contains_key("literal") {
            return;
        }

        // Call (predicate application or function)
        if let Some(call_obj) = obj.get("call") {
            Self::collect_record_vars(call_obj.as_object().get("record"), vars);
            return;
        }

        // Aggregation
        if let Some(agg_obj) = obj.get("aggregation") {
            if let Some(inner) = agg_obj.as_object().get("expression") {
                Self::collect_expr_vars(inner, vars);
            }
            return;
        }

        // Combine (subquery) - collect from the embedded rule
        if let Some(combine_obj) = obj.get("combine") {
            Self::collect_rule_vars(combine_obj, vars);
            return;
        }

        // Implication
        if let Some(impl_obj) = obj.get("implication") {
            if let Some(cond) = impl_obj.as_object().get("condition") {
                Self::collect_expr_vars(cond, vars);
            }
            if let Some(cons) = impl_obj.as_object().get("consequence") {
                Self::collect_expr_vars(cons, vars);
            }
            if let Some(otherwise) = impl_obj.as_object().get("otherwise") {
                Self::collect_expr_vars(otherwise, vars);
            }
            return;
        }

        // Record fields
        if let Some(record) = obj.get("record") {
            Self::collect_record_vars(Some(record), vars);
        }
    }

    fn collect_record_vars(record: Option<&Json>, vars: &mut HashSet<String>) {
        let Some(rec) = record else { return };
        let rec_obj = rec.as_object();
        if let Some(fv_arr) = rec_obj.get("field_value") {
            for fv in fv_arr.as_array() {
                if let Some(value) = fv.as_object().get("value") {
                    if let Some(expr) = value.as_object().get("expression") {
                        Self::collect_expr_vars(expr, vars);
                    }
                }
            }
        }
    }

    /// Collect variables from expression, stopping at aggregation function calls.
    fn collect_expr_vars_excluding_aggregations(expr: &Json, vars: &mut HashSet<String>) {
        let obj = expr.as_object();

        // Variable
        if let Some(var_obj) = obj.get("variable") {
            let name = var_obj.as_object()["var_name"].as_var_name();
            if name != "_" {
                vars.insert(name);
            }
            return;
        }

        // Literal - no variables
        if obj.contains_key("literal") {
            return;
        }

        // Call - stop if it's an aggregation function
        if let Some(call_obj) = obj.get("call") {
            let pred_name = call_obj.as_object()["predicate_name"].as_str();
            if AGGREGATION_FNS.contains(&pred_name) {
                // Don't collect vars inside aggregations
                return;
            }
            // Non-aggregation call: collect its args
            Self::collect_record_vars_excluding_aggregations(call_obj.as_object().get("record"), vars);
            return;
        }

        // Aggregation node
        if obj.contains_key("aggregation") {
            // Don't collect vars inside aggregations
            return;
        }

        // Record fields
        if let Some(record) = obj.get("record") {
            Self::collect_record_vars_excluding_aggregations(Some(record), vars);
        }
    }

    fn collect_record_vars_excluding_aggregations(record: Option<&Json>, vars: &mut HashSet<String>) {
        let Some(rec) = record else { return };
        let rec_obj = rec.as_object();
        if let Some(fv_arr) = rec_obj.get("field_value") {
            for fv in fv_arr.as_array() {
                if let Some(value) = fv.as_object().get("value") {
                    if let Some(expr) = value.as_object().get("expression") {
                        Self::collect_expr_vars_excluding_aggregations(expr, vars);
                    }
                }
            }
        }
    }

    fn collect_rule_vars(rule: &Json, vars: &mut HashSet<String>) {
        let obj = rule.as_object();

        // Head variables
        if let Some(head) = obj.get("head") {
            Self::collect_record_vars(head.as_object().get("record"), vars);
        }

        // Body variables
        if let Some(body) = obj.get("body") {
            Self::collect_conjunction_vars(body, vars);
        }
    }

    fn collect_conjunction_vars(body: &Json, vars: &mut HashSet<String>) {
        let obj = body.as_object();
        if let Some(conj) = obj.get("conjunction") {
            if let Some(conjuncts) = conj.as_object().get("conjunct") {
                for c in conjuncts.as_array() {
                    Self::collect_conjunct_vars(c, vars);
                }
            }
        }
    }

    /// Collect variables from a conjunct.
    pub fn collect_conjunct_vars(conjunct: &Json, vars: &mut HashSet<String>) {
        let obj = conjunct.as_object();

        // Positive predicate
        if let Some(pred) = obj.get("predicate") {
            Self::collect_record_vars(pred.as_object().get("record"), vars);
            return;
        }

        // Unification
        if let Some(unif) = obj.get("unification") {
            if let Some(lhs) = unif.as_object().get("left_hand_side") {
                Self::collect_expr_vars(lhs, vars);
            }
            if let Some(rhs) = unif.as_object().get("right_hand_side") {
                Self::collect_expr_vars(rhs, vars);
            }
            return;
        }

        // Inclusion (x in List)
        if let Some(incl) = obj.get("inclusion") {
            if let Some(elem) = incl.as_object().get("element") {
                Self::collect_expr_vars(elem, vars);
            }
            if let Some(list) = incl.as_object().get("list") {
                Self::collect_expr_vars(list, vars);
            }
            return;
        }

        // Disjunction
        if let Some(disj) = obj.get("disjunction") {
            if let Some(branches) = disj.as_object().get("disjunct") {
                for branch in branches.as_array() {
                    Self::collect_conjunction_vars(branch, vars);
                }
            }
        }
    }

    /// Get variables appearing in rule head.
    pub fn head_vars(rule: &Json) -> HashSet<String> {
        let mut vars = HashSet::new();
        if let Some(head) = rule.as_object().get("head") {
            Self::collect_record_vars(head.as_object().get("record"), &mut vars);
        }
        vars
    }

    /// Input-argument variables of a value-function definition (`F(a, b) = v`).
    ///
    /// A value-function's head record carries a `logica_value` field (the
    /// returned value); its *other* fields are input parameters, bound by the
    /// caller rather than the body. Returns those parameter variables so the
    /// safety checks treat them as bound. For an ordinary predicate (no
    /// `logica_value` field) this is empty, leaving predicate checks unchanged.
    pub fn function_input_vars(rule: &Json) -> HashSet<String> {
        let mut vars = HashSet::new();
        let Some(head) = rule.as_object().get("head") else {
            return vars;
        };
        let Some(record) = head.as_object().get("record") else {
            return vars;
        };
        let Some(fv_arr) = record.as_object().get("field_value") else {
            return vars;
        };
        let fields = fv_arr.as_array();
        let is_function = fields
            .iter()
            .any(|fv| matches!(fv.as_object().get("field"), Some(Json::Str(s)) if s == "logica_value"));
        if !is_function {
            return vars;
        }
        for fv in fields {
            let is_value =
                matches!(fv.as_object().get("field"), Some(Json::Str(s)) if s == "logica_value");
            if is_value {
                continue;
            }
            if let Some(expr) = fv.as_object().get("value").and_then(|v| v.as_object().get("expression")) {
                Self::collect_expr_vars(expr, &mut vars);
            }
        }
        vars
    }

    /// Get variables appearing in rule body.
    pub fn body_vars(rule: &Json) -> HashSet<String> {
        let mut vars = HashSet::new();
        if let Some(body) = rule.as_object().get("body") {
            Self::collect_conjunction_vars(body, &mut vars);
        }
        vars
    }

    /// Get variables bound positively (safe to use in head/negation).
    pub fn positive_vars(rule: &Json) -> HashSet<String> {
        let mut vars = HashSet::new();
        if let Some(body) = rule.as_object().get("body") {
            Self::collect_positive_vars(body, &mut vars);
        }
        vars
    }

    fn collect_positive_vars(body: &Json, vars: &mut HashSet<String>) {
        let obj = body.as_object();
        if let Some(conj) = obj.get("conjunction") {
            if let Some(conjuncts) = conj.as_object().get("conjunct") {
                for c in conjuncts.as_array() {
                    Self::collect_conjunct_positive_vars(c, vars);
                }
            }
        }
    }

    fn collect_conjunct_positive_vars(conjunct: &Json, vars: &mut HashSet<String>) {
        let obj = conjunct.as_object();

        // Positive predicate - binds variables
        if let Some(pred) = obj.get("predicate") {
            let pred_name = pred.as_object()["predicate_name"].as_str();
            // Skip IsNull (negation wrapper) and comparison operators
            // Comparisons constrain but don't bind variables
            if pred_name != "IsNull" && !COMPARISON_OPS.contains(&pred_name) {
                Self::collect_record_vars(pred.as_object().get("record"), vars);
            }
            return;
        }

        // Unification - binds variables (excluding those inside aggregations)
        if let Some(unif) = obj.get("unification") {
            if let Some(lhs) = unif.as_object().get("left_hand_side") {
                Self::collect_expr_vars_excluding_aggregations(lhs, vars);
            }
            if let Some(rhs) = unif.as_object().get("right_hand_side") {
                Self::collect_expr_vars_excluding_aggregations(rhs, vars);
            }
            return;
        }

        // Inclusion - element is bound
        if let Some(incl) = obj.get("inclusion") {
            if let Some(elem) = incl.as_object().get("element") {
                Self::collect_expr_vars(elem, vars);
            }
            return;
        }

        // Disjunction - only vars in ALL branches are bound
        if let Some(disj) = obj.get("disjunction") {
            if let Some(branches) = disj.as_object().get("disjunct") {
                let branch_arr = branches.as_array();
                if branch_arr.is_empty() {
                    return;
                }
                // Intersection of all branches
                let mut common: Option<HashSet<String>> = None;
                for branch in branch_arr {
                    let mut branch_vars = HashSet::new();
                    Self::collect_positive_vars(branch, &mut branch_vars);
                    common = Some(match common {
                        None => branch_vars,
                        Some(c) => c.intersection(&branch_vars).cloned().collect(),
                    });
                }
                if let Some(c) = common {
                    vars.extend(c);
                }
            }
        }
    }

    /// Get variables appearing in negated predicates.
    pub fn negated_vars(rule: &Json) -> HashSet<String> {
        let mut vars = HashSet::new();
        if let Some(body) = rule.as_object().get("body") {
            Self::collect_negated_vars(body, &mut vars);
        }
        vars
    }

    fn collect_negated_vars(body: &Json, vars: &mut HashSet<String>) {
        let obj = body.as_object();
        if let Some(conj) = obj.get("conjunction") {
            if let Some(conjuncts) = conj.as_object().get("conjunct") {
                for c in conjuncts.as_array() {
                    Self::collect_conjunct_negated_vars(c, vars);
                }
            }
        }
    }

    fn collect_conjunct_negated_vars(conjunct: &Json, vars: &mut HashSet<String>) {
        let obj = conjunct.as_object();

        // IsNull wrapping a combine = negation
        if let Some(pred) = obj.get("predicate") {
            let pred_name = pred.as_object()["predicate_name"].as_str();
            if pred_name == "IsNull" {
                // Get the inner combine's variables
                if let Some(fv_arr) = pred.as_object().get("record")
                    .and_then(|r| r.as_object().get("field_value"))
                {
                    for fv in fv_arr.as_array() {
                        if let Some(expr) = fv.as_object().get("value")
                            .and_then(|v| v.as_object().get("expression"))
                        {
                            if expr.as_object().contains_key("combine") {
                                Self::collect_expr_vars(expr, vars);
                            }
                        }
                    }
                }
            }
            return;
        }

        // Disjunction - recurse
        if let Some(disj) = obj.get("disjunction") {
            if let Some(branches) = disj.as_object().get("disjunct") {
                for branch in branches.as_array() {
                    Self::collect_negated_vars(branch, vars);
                }
            }
        }
    }

    /// Get variables appearing in aggregations.
    pub fn aggregation_vars(rule: &Json) -> HashSet<String> {
        let mut vars = HashSet::new();
        if let Some(body) = rule.as_object().get("body") {
            Self::collect_aggregation_vars_body(body, &mut vars);
        }
        vars
    }

    fn collect_aggregation_vars_body(body: &Json, vars: &mut HashSet<String>) {
        let obj = body.as_object();
        if let Some(conj) = obj.get("conjunction") {
            if let Some(conjuncts) = conj.as_object().get("conjunct") {
                for c in conjuncts.as_array() {
                    Self::collect_aggregation_vars_conjunct(c, vars);
                }
            }
        }
    }

    fn collect_aggregation_vars_conjunct(conjunct: &Json, vars: &mut HashSet<String>) {
        let obj = conjunct.as_object();

        // Check predicates for aggregation expressions
        if let Some(pred) = obj.get("predicate") {
            if let Some(record) = pred.as_object().get("record") {
                if let Some(fv_arr) = record.as_object().get("field_value") {
                    for fv in fv_arr.as_array() {
                        if let Some(expr) = fv.as_object().get("value")
                            .and_then(|v| v.as_object().get("expression"))
                        {
                            Self::collect_aggregation_vars_expr(expr, vars);
                        }
                    }
                }
            }
            return;
        }

        // Check unifications for aggregation expressions (e.g., total == Sum(y))
        if let Some(unif) = obj.get("unification") {
            if let Some(rhs) = unif.as_object().get("right_hand_side") {
                Self::collect_aggregation_vars_expr(rhs, vars);
            }
            if let Some(lhs) = unif.as_object().get("left_hand_side") {
                Self::collect_aggregation_vars_expr(lhs, vars);
            }
            return;
        }

        // Handle disjunctions - recurse into branches
        if let Some(disj) = obj.get("disjunction") {
            if let Some(branches) = disj.as_object().get("disjunct") {
                for branch in branches.as_array() {
                    Self::collect_aggregation_vars_body(branch, vars);
                }
            }
        }
    }

    fn collect_aggregation_vars_expr(expr: &Json, vars: &mut HashSet<String>) {
        let obj = expr.as_object();

        // Explicit aggregation node
        if let Some(agg) = obj.get("aggregation") {
            if let Some(inner) = agg.as_object().get("expression") {
                Self::collect_expr_vars(inner, vars);
            }
        }

        // Call to aggregation function (e.g., Sum, Count, Min, Max)
        if let Some(call) = obj.get("call") {
            let pred_name = call.as_object()["predicate_name"].as_str();
            if AGGREGATION_FNS.contains(&pred_name) {
                // Collect inner variables as aggregation vars
                Self::collect_record_vars(call.as_object().get("record"), vars);
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::json_obj;

    /// Positional-argument normalization (e.g. the `@Recursive` rewrite) can
    /// leave a variable's `var_name` as an integer index rather than a string.
    /// The collector must coerce it instead of panicking in `as_str`.
    #[test]
    fn test_collect_expr_vars_int_var_name() {
        let expr = json_obj!("variable" => json_obj!("var_name" => Json::Int(0)));
        let vars = VarCollector::expr_vars(&expr);
        assert!(vars.contains("0"), "int var_name should collect as \"0\": {vars:?}");
    }

    /// `head_vars` walks the same record path that panicked on the
    /// `35_recursive_annotated` fixture; an int-indexed head column must work.
    #[test]
    fn test_head_vars_int_var_name() {
        let rule = json_obj!(
            "head" => json_obj!(
                "record" => json_obj!("field_value" => Json::Array(vec![
                    json_obj!(
                        "field" => Json::Int(0),
                        "value" => json_obj!(
                            "expression" => json_obj!(
                                "variable" => json_obj!("var_name" => Json::Int(0))
                            )
                        )
                    ),
                ]))
            )
        );
        let vars = VarCollector::head_vars(&rule);
        assert!(vars.contains("0"), "int head column should collect as \"0\": {vars:?}");
    }

    /// A value-function's input args are reported; its `logica_value` is not.
    #[test]
    fn test_function_input_vars() {
        use crate::parser::parse_file;
        let parsed = parse_file("Inc(x, y) = n :- n == x + y;", None, &[]).unwrap();
        let rule = &parsed.as_object()["rule"].as_array()[0];
        let inputs = VarCollector::function_input_vars(rule);
        assert!(inputs.contains("x") && inputs.contains("y"), "args: {inputs:?}");
        assert!(!inputs.contains("n"), "return value is not an input: {inputs:?}");
    }

    /// An ordinary predicate has no `logica_value`, so no input vars (which
    /// keeps the head-var safety check unchanged for predicates).
    #[test]
    fn test_predicate_has_no_function_input_vars() {
        use crate::parser::parse_file;
        let parsed = parse_file("Foo(a:, b:) :- Bar(a:, b:);", None, &[]).unwrap();
        let rule = &parsed.as_object()["rule"].as_array()[0];
        assert!(VarCollector::function_input_vars(rule).is_empty());
    }
}
