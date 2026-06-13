// Modified from: logica/type_inference/types_graph_builder.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Types graph builder from parsed Logica programs.
//!
//! Ported from Python: type_inference/types_graph_builder.py

use super::edge::{Bounds, Edge};
use super::expression::Expression;
use super::graph::TypesGraph;
use crate::parser::Json;
use std::collections::HashMap;

/// Builder for constructing type graphs from parsed Logica programs.
#[derive(Debug, Default)]
pub struct TypesGraphBuilder {
    /// Count of predicate usages for unique predicate IDs.
    predicate_usages: HashMap<String, usize>,
    /// Counter for if statement variables.
    if_statements_counter: usize,
    /// Cache of expressions for deduplication.
    expressions_cache: HashMap<String, Expression>,
}

impl TypesGraphBuilder {
    /// Create a new builder.
    pub fn new() -> Self {
        Self::default()
    }

    /// Reset internal state for a new program.
    fn reset(&mut self) {
        self.predicate_usages.clear();
        self.if_statements_counter = 0;
        self.expressions_cache.clear();
    }

    /// Get from cache or add expression.
    fn get_or_cache(&mut self, expr: Expression) -> Expression {
        let key = expr.to_string();
        if let Some(cached) = self.expressions_cache.get(&key) {
            cached.clone()
        } else {
            self.expressions_cache.insert(key, expr.clone());
            expr
        }
    }

    /// Build type graphs from a parsed program.
    /// Returns a map from predicate name to its type graph.
    pub fn run(&mut self, parsed_program: &Json) -> HashMap<String, TypesGraph> {
        self.reset();
        let mut graphs: HashMap<String, TypesGraph> = HashMap::new();

        let rules = match parsed_program.as_object().get("rule") {
            Some(r) => r.as_array(),
            None => return graphs,
        };

        for rule in rules {
            let head = match rule.as_object().get("head") {
                Some(h) => h,
                None => continue,
            };

            let predicate_name = match head.as_object().get("predicate_name") {
                Some(pn) => pn.as_str().to_string(),
                None => continue,
            };

            let rule_graph = self.traverse_tree(&predicate_name, rule);
            graphs
                .entry(predicate_name)
                .or_insert_with(TypesGraph::new)
                .merge(rule_graph);
        }

        graphs
    }

    /// Traverse a single rule and build its type graph.
    fn traverse_tree(&mut self, predicate_name: &str, rule: &Json) -> TypesGraph {
        let mut graph = TypesGraph::new();

        if !rule.is_object() {
            return graph;
        }

        // Process head fields
        let head = match rule.as_object().get("head") {
            Some(h) if h.is_object() => h,
            _ => return graph,
        };
        if let Some(record) = head.as_object().get("record") {
            if record.is_object() {
                if let Some(field_values) = record.as_object().get("field_value") {
                    if field_values.is_array() {
                        for field in field_values.as_array() {
                            self.fill_field(&mut graph, predicate_name, field);
                        }
                    }
                }
            }
        }

        // Process body conjuncts
        if let Some(body) = rule.as_object().get("body") {
            if body.is_object() {
                if let Some(conjunction) = body.as_object().get("conjunction") {
                    if conjunction.is_object() {
                        if let Some(conjuncts) = conjunction.as_object().get("conjunct") {
                            if conjuncts.is_array() {
                                for conjunct in conjuncts.as_array() {
                                    self.fill_conjunct(&mut graph, conjunct);
                                }
                            }
                        }
                    }
                }
            }
        }

        graph
    }

    /// Process a field in the head.
    fn fill_field(&mut self, graph: &mut TypesGraph, predicate_name: &str, field: &Json) {
        if !field.is_object() {
            return;
        }
        let field_obj = field.as_object();
        let field_name = match field_obj.get("field") {
            Some(f) => {
                if f.is_int() {
                    format!("col{}", f.as_int())
                } else if f.is_string() {
                    f.as_str().to_string()
                } else {
                    return;
                }
            }
            None => return,
        };

        let predicate_id = *self.predicate_usages.get(predicate_name).unwrap_or(&0);
        let variable = self.get_or_cache(Expression::predicate_addressing(
            predicate_name,
            &field_name,
            predicate_id,
        ));

        let value = match field_obj.get("value") {
            Some(v) if v.is_object() => v,
            _ => return,
        };
        let value_obj = value.as_object();

        // Handle aggregation
        if let Some(agg) = value_obj.get("aggregation") {
            if agg.is_object() {
                if let Some(expr) = agg.as_object().get("expression") {
                    let (converted, bounds) = self.convert_expression(graph, expr);
                    graph.connect(Edge::equality(variable, converted, bounds));
                }
            }
            return;
        }

        // Handle expression
        if let Some(expr) = value_obj.get("expression") {
            let (converted, bounds) = self.convert_expression(graph, expr);
            graph.connect(Edge::equality(variable, converted, bounds));
        }
    }

    /// Process a conjunct in the body.
    fn fill_conjunct(&mut self, graph: &mut TypesGraph, conjunct: &Json) {
        if !conjunct.is_object() {
            return;
        }
        let conj_obj = conjunct.as_object();

        // Unification: left = right
        if let Some(unification) = conj_obj.get("unification") {
            if !unification.is_object() {
                return;
            }
            let unif_obj = unification.as_object();
            if let (Some(lhs), Some(rhs)) = (
                unif_obj.get("left_hand_side"),
                unif_obj.get("right_hand_side"),
            ) {
                let (left_expr, (left_start, _)) = self.convert_expression(graph, lhs);
                let (right_expr, (_, right_end)) = self.convert_expression(graph, rhs);
                graph.connect(Edge::equality(left_expr, right_expr, (left_start, right_end)));
            }
            return;
        }

        // Inclusion: element in list
        if let Some(inclusion) = conj_obj.get("inclusion") {
            if !inclusion.is_object() {
                return;
            }
            let incl_obj = inclusion.as_object();
            if let (Some(list), Some(element)) = (incl_obj.get("list"), incl_obj.get("element")) {
                let (list_expr, (_, right_end)) = self.convert_expression(graph, list);
                let (elem_expr, (left_start, _)) = self.convert_expression(graph, element);
                graph.connect(Edge::equality_of_element(
                    list_expr,
                    elem_expr,
                    (left_start, right_end),
                ));
            }
            return;
        }

        // Predicate call
        if let Some(predicate) = conj_obj.get("predicate") {
            if !predicate.is_object() {
                return;
            }
            let pred_obj = predicate.as_object();
            let predicate_name = match pred_obj.get("predicate_name") {
                Some(pn) if pn.is_string() => pn.as_str().to_string(),
                _ => return,
            };

            let predicate_id = *self.predicate_usages.get(&predicate_name).unwrap_or(&0);
            let logica_value = Expression::predicate_addressing(&predicate_name, "logica_value", predicate_id);

            self.fill_fields(graph, &predicate_name, predicate, &logica_value);

            *self.predicate_usages.entry(predicate_name).or_insert(0) += 1;
        }
    }

    /// Fill fields for a predicate call.
    fn fill_fields(
        &mut self,
        graph: &mut TypesGraph,
        predicate_name: &str,
        fields: &Json,
        result: &Expression,
    ) -> Bounds {
        let mut total_min: Option<i64> = None;
        let mut total_max: Option<i64> = None;

        if !fields.is_object() {
            return (0, 0);
        }
        let record = match fields.as_object().get("record") {
            Some(r) if r.is_object() => r,
            _ => return (0, 0),
        };
        let field_values = match record.as_object().get("field_value") {
            Some(fv) if fv.is_array() => fv.as_array(),
            _ => return (0, 0),
        };

        let predicate_id = *self.predicate_usages.get(predicate_name).unwrap_or(&0);

        for field in field_values {
            if !field.is_object() {
                continue;
            }
            let field_obj = field.as_object();
            let field_name = match field_obj.get("field") {
                Some(f) => {
                    if f.is_int() {
                        format!("col{}", f.as_int())
                    } else if f.is_string() {
                        f.as_str().to_string()
                    } else {
                        continue;
                    }
                }
                None => continue,
            };

            let value = match field_obj.get("value") {
                Some(v) if v.is_object() => v,
                _ => continue,
            };
            let expr = match value.as_object().get("expression") {
                Some(e) => e,
                None => continue,
            };

            let (converted, bounds) = self.convert_expression(graph, expr);
            total_min = Some(min_ignoring_none(total_min, bounds.0));
            total_max = Some(max_ignoring_none(total_max, bounds.1));

            let predicate_field =
                Expression::predicate_addressing(predicate_name, &field_name, predicate_id);

            graph.connect(Edge::equality(predicate_field.clone(), converted, bounds));
            graph.connect(Edge::predicate_argument(
                result.clone(),
                predicate_field,
                bounds,
            ));
        }

        (total_min.unwrap_or(0), total_max.unwrap_or(0))
    }

    /// Convert a parsed expression to a typed expression.
    fn convert_expression(&mut self, graph: &mut TypesGraph, expr: &Json) -> (Expression, Bounds) {
        if !expr.is_object() {
            return (Expression::variable("_unknown"), (0, 0));
        }
        let expr_obj = expr.as_object();

        // Literal
        if let Some(literal) = expr_obj.get("literal") {
            return self.convert_literal(graph, literal);
        }

        // Variable
        if let Some(variable) = expr_obj.get("variable") {
            let var_name = variable.as_object().get("var_name").map(|v| {
                if v.is_string() {
                    v.as_str().to_string()
                } else if v.is_int() {
                    v.as_int().to_string()
                } else {
                    String::new()
                }
            }).unwrap_or_default();
            let bounds = get_bounds_from_value(variable.as_object().get("var_name"));
            let result = self.get_or_cache(Expression::variable(&var_name));
            return (result, bounds);
        }

        // Call
        if let Some(call) = expr_obj.get("call") {
            return self.convert_call(graph, call);
        }

        // Subscript
        if let Some(subscript) = expr_obj.get("subscript") {
            return self.convert_subscript(graph, subscript);
        }

        // Record
        if let Some(record) = expr_obj.get("record") {
            if let Some(field_values) = record.as_object().get("field_value") {
                return self.convert_record(graph, field_values);
            }
        }

        // Implication (if-then-else)
        if let Some(implication) = expr_obj.get("implication") {
            return self.convert_implication(graph, implication);
        }

        // Default fallback
        (Expression::variable("_unknown"), (0, 0))
    }

    /// Convert a literal expression.
    fn convert_literal(&mut self, graph: &mut TypesGraph, literal: &Json) -> (Expression, Bounds) {
        let lit_obj = literal.as_object();

        if let Some(the_string) = lit_obj.get("the_string") {
            let bounds = get_bounds_from_value(the_string.as_object().get("the_string"));
            return (Expression::StringLiteral, bounds);
        }

        if let Some(the_number) = lit_obj.get("the_number") {
            let bounds = get_bounds_from_value(the_number.as_object().get("number"));
            return (Expression::NumberLiteral, bounds);
        }

        if let Some(the_bool) = lit_obj.get("the_bool") {
            let bounds = get_bounds_from_value(the_bool.as_object().get("bool"));
            return (Expression::BooleanLiteral, bounds);
        }

        if let Some(the_null) = lit_obj.get("the_null") {
            let bounds = get_bounds_from_value(the_null.as_object().get("null"));
            return (Expression::NullLiteral, bounds);
        }

        if let Some(the_list) = lit_obj.get("the_list") {
            let mut total_min: Option<i64> = None;
            let mut total_max: Option<i64> = None;
            let mut elements = Vec::new();

            if let Some(elems) = the_list.as_object().get("element") {
                for elem in elems.as_array() {
                    let (expr, bounds) = self.convert_expression(graph, elem);
                    elements.push(expr);
                    total_min = Some(min_ignoring_none(total_min, bounds.0));
                    total_max = Some(max_ignoring_none(total_max, bounds.1));
                }
            }

            let result = Expression::list_literal(elements);
            let bounds = (
                total_min.map(|m| m - 1).unwrap_or(0),
                total_max.map(|m| m + 1).unwrap_or(0),
            );
            return (result, bounds);
        }

        (Expression::NullLiteral, (0, 0))
    }

    /// Convert a call expression.
    fn convert_call(&mut self, graph: &mut TypesGraph, call: &Json) -> (Expression, Bounds) {
        let call_obj = call.as_object();
        let predicate_name = match call_obj.get("predicate_name") {
            Some(pn) => pn.as_str().to_string(),
            None => return (Expression::variable("_unknown"), (0, 0)),
        };

        let predicate_id = *self.predicate_usages.get(&predicate_name).unwrap_or(&0);
        let result = self.get_or_cache(Expression::predicate_addressing(
            &predicate_name,
            "logica_value",
            predicate_id,
        ));

        let bounds = self.fill_fields(graph, &predicate_name, call, &result);
        *self.predicate_usages.entry(predicate_name.clone()).or_insert(0) += 1;

        // Adjust bounds based on predicate name
        let adjusted_bounds = adjust_bounds_for_predicate(bounds, call_obj.get("predicate_name"));

        (result, adjusted_bounds)
    }

    /// Convert a subscript expression.
    fn convert_subscript(&mut self, graph: &mut TypesGraph, subscript: &Json) -> (Expression, Bounds) {
        let sub_obj = subscript.as_object();

        let record_expr = match sub_obj.get("record") {
            Some(r) => r,
            None => return (Expression::variable("_unknown"), (0, 0)),
        };

        let (record, (left_start, _)) = self.convert_expression(graph, record_expr);

        let field_name = sub_obj
            .get("subscript")
            .and_then(|s| s.as_object().get("literal"))
            .and_then(|l| l.as_object().get("the_symbol"))
            .and_then(|sym| sym.as_object().get("symbol"))
            .map(|s| s.as_str())
            .unwrap_or("");

        let field_end = sub_obj
            .get("subscript")
            .and_then(|s| s.as_object().get("literal"))
            .and_then(|l| l.as_object().get("the_symbol"))
            .and_then(|sym| sym.as_object().get("symbol"))
            .map(|s| get_end_from_value(s))
            .unwrap_or(0);

        let result = self.get_or_cache(Expression::subscript_addressing(record.clone(), field_name));
        let bounds = (left_start, field_end);

        graph.connect(Edge::field_belonging(record, result.clone(), bounds));

        (result, bounds)
    }

    /// Convert a record expression.
    fn convert_record(&mut self, graph: &mut TypesGraph, field_values: &Json) -> (Expression, Bounds) {
        let mut fields = HashMap::new();
        let mut total_min: Option<i64> = None;
        let mut total_max: Option<i64> = None;

        for field in field_values.as_array() {
            let field_obj = field.as_object();
            let field_name = match field_obj.get("field") {
                Some(f) if f.is_string() => f.as_str().to_string(),
                Some(f) if f.is_int() => format!("col{}", f.as_int()),
                _ => continue,
            };

            let value_expr = match field_obj.get("value") {
                Some(v) => match v.as_object().get("expression") {
                    Some(e) => e,
                    None => continue,
                },
                None => continue,
            };

            let (expr, bounds) = self.convert_expression(graph, value_expr);
            fields.insert(field_name, expr);
            total_min = Some(min_ignoring_none(total_min, bounds.0));
            total_max = Some(max_ignoring_none(total_max, bounds.1));
        }

        let result = Expression::record_literal(fields);
        let bounds = (
            total_min.map(|m| m - 1).unwrap_or(0),
            total_max.map(|m| m + 1).unwrap_or(0),
        );
        (result, bounds)
    }

    /// Convert an implication (if-then-else) expression.
    fn convert_implication(&mut self, graph: &mut TypesGraph, implication: &Json) -> (Expression, Bounds) {
        let impl_obj = implication.as_object();
        let inner_var_name = format!("_IfNode{}", self.if_statements_counter);
        self.if_statements_counter += 1;
        let inner_variable = self.get_or_cache(Expression::variable(&inner_var_name));

        // Process otherwise clause
        let (otherwise_expr, (mut common_left, mut common_right)) =
            if let Some(otherwise) = impl_obj.get("otherwise") {
                self.convert_expression(graph, otherwise)
            } else {
                (Expression::NullLiteral, (0, 0))
            };

        graph.connect(Edge::equality(
            inner_variable.clone(),
            otherwise_expr,
            (common_left, common_right),
        ));

        // Process if-then clauses
        if let Some(if_thens) = impl_obj.get("if_then") {
            for if_then in if_thens.as_array() {
                let if_then_obj = if_then.as_object();

                // Process condition (for side effects on graph)
                if let Some(condition) = if_then_obj.get("condition") {
                    let _ = self.convert_expression(graph, condition);
                }

                // Process consequence
                if let Some(consequence) = if_then_obj.get("consequence") {
                    let (value_expr, (left, right)) = self.convert_expression(graph, consequence);
                    graph.connect(Edge::equality(
                        inner_variable.clone(),
                        value_expr,
                        (left, right),
                    ));
                    common_left = min_ignoring_none(Some(common_left), left);
                    common_right = max_ignoring_none(Some(common_right), right);
                }
            }
        }

        (inner_variable, (common_left, common_right))
    }
}

/// Get bounds from a JSON value that may have start/stop fields.
fn get_bounds_from_value(value: Option<&Json>) -> Bounds {
    match value {
        Some(v) if v.is_object() => {
            let obj = v.as_object();
            let start = obj
                .get("start")
                .and_then(|s| if s.is_int() { Some(s.as_int() as i64) } else { None })
                .unwrap_or(0);
            let stop = obj
                .get("stop")
                .and_then(|s| if s.is_int() { Some(s.as_int() as i64) } else { None })
                .unwrap_or(0);
            (start, stop)
        }
        _ => (0, 0),
    }
}

/// Get end position from a JSON value.
fn get_end_from_value(value: &Json) -> i64 {
    if !value.is_object() {
        return 0;
    }
    value.as_object()
        .get("stop")
        .and_then(|s| if s.is_int() { Some(s.as_int() as i64) } else { None })
        .unwrap_or(0)
}

/// Adjust bounds based on predicate name position.
fn adjust_bounds_for_predicate(bounds: Bounds, predicate_name: Option<&Json>) -> Bounds {
    match predicate_name {
        Some(pn) if pn.is_object() => {
            let obj = pn.as_object();
            let pn_start = obj
                .get("start")
                .and_then(|s| if s.is_int() { Some(s.as_int() as i64) } else { None });
            let pn_stop = obj
                .get("stop")
                .and_then(|s| if s.is_int() { Some(s.as_int() as i64) } else { None });
            (
                min_ignoring_none(pn_start, bounds.0),
                max_ignoring_none(pn_stop, bounds.1),
            )
        }
        _ => bounds,
    }
}

fn min_ignoring_none(left: Option<i64>, right: i64) -> i64 {
    match left {
        Some(l) => l.min(right),
        None => right,
    }
}

fn max_ignoring_none(left: Option<i64>, right: i64) -> i64 {
    match left {
        Some(l) => l.max(right),
        None => right,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_builder_new() {
        let builder = TypesGraphBuilder::new();
        assert!(builder.predicate_usages.is_empty());
    }
}
