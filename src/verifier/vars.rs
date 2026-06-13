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
            let name = var_obj.as_object()["var_name"].as_str();
            if name != "_" {
                vars.insert(name.to_string());
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
            let name = var_obj.as_object()["var_name"].as_str();
            if name != "_" {
                vars.insert(name.to_string());
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
