//! Type inference engine.
//!
//! Ported from Python: type_inference/type_inference_service.py

use super::built_in::{check_inequalities, is_inequality_predicate};
use super::edge::Edge;
use super::expression::Expression;
use super::graph::TypesGraph;
use super::intersection::{intersect, intersect_list_element, TypeInferenceError};
use super::types::Type;
use std::collections::HashMap;

/// Type inference engine that propagates types through the type graph.
pub struct TypeInference {
    /// All edges across all predicates: (predicate_name, edge)
    all_edges: Vec<(String, Edge)>,
    /// Type graphs by predicate name.
    graphs: HashMap<String, TypesGraph>,
}

impl TypeInference {
    /// Create a new type inference engine from predicate graphs.
    pub fn new(graphs: HashMap<String, TypesGraph>) -> Self {
        let mut all_edges = Vec::new();

        for (name, graph) in &graphs {
            for edge in graph.to_edges_vec() {
                all_edges.push((name.clone(), edge));
            }
        }

        let mut engine = Self {
            all_edges,
            graphs,
        };

        engine.merge_graphs();
        engine
    }

    /// Merge graphs by linking cross-predicate references.
    fn merge_graphs(&mut self) {
        let edges_to_add: Vec<(String, Edge)> = Vec::new();

        for (predicate_name, graph) in &self.graphs {
            for expr_key in graph.expressions() {
                // Try to parse as PredicateAddressing
                if expr_key.starts_with("PredicateAddressing(") {
                    // Extract predicate name from the key
                    // Format: PredicateAddressing(pred_name.field)
                    if let Some(inner) = expr_key
                        .strip_prefix("PredicateAddressing(")
                        .and_then(|s| s.strip_suffix(")"))
                    {
                        if let Some((ref_pred, field)) = inner.split_once('.') {
                            // If this references a different predicate that we have
                            if ref_pred != predicate_name && self.graphs.contains_key(ref_pred) {
                                // Find the matching expression in the target graph
                                let target_key = format!("PredicateAddressing({}.{})", ref_pred, field);
                                if self.graphs[ref_pred].contains_expression(&target_key) {
                                    // Create expression objects for linking
                                    // Note: In the real implementation, we'd need to track actual Expression objects
                                    // For now, we just note that these should be linked
                                    let _ = (); // Placeholder for cross-predicate linking
                                }
                            }
                        }
                    }
                }
            }
        }

        for (_, edge) in edges_to_add {
            self.all_edges.push(("_merged".to_string(), edge));
        }
    }

    /// Run type inference to fixed point.
    pub fn infer(&mut self) -> Result<(), TypeInferenceError> {
        let mut changed = true;
        let mut iterations = 0;
        const MAX_ITERATIONS: usize = 1000;

        while changed && iterations < MAX_ITERATIONS {
            changed = false;
            iterations += 1;

            for i in 0..self.all_edges.len() {
                let (graph_name, edge) = &self.all_edges[i];
                let graph_name = graph_name.clone();

                match edge {
                    Edge::Equality { left, right, bounds } => {
                        let left_type = left.get_type().clone();
                        let right_type = right.get_type().clone();
                        let result = intersect(left_type.clone(), right_type.clone(), *bounds)?;

                        if result != left_type {
                            let (_, edge) = &mut self.all_edges[i];
                            if let Edge::Equality { left, .. } = edge {
                                left.set_type(result.clone());
                            }
                            changed = true;
                        }
                        if result != right_type {
                            let (_, edge) = &mut self.all_edges[i];
                            if let Edge::Equality { right, .. } = edge {
                                right.set_type(result);
                            }
                            changed = true;
                        }
                    }

                    Edge::EqualityOfElement { list, element, bounds } => {
                        // Ensure list has ListType
                        let list_type = list.get_type().clone();
                        if list_type.is_any() {
                            let (_, edge) = &mut self.all_edges[i];
                            if let Edge::EqualityOfElement { list, .. } = edge {
                                list.set_type(Type::list(Type::Any));
                            }
                            changed = true;
                            continue;
                        }

                        let element_type = element.get_type().clone();
                        let list_type = self.all_edges[i].1.vertices().0.get_type();
                        let result = intersect_list_element(list_type, element_type.clone(), *bounds)?;

                        if result != element_type {
                            let (_, edge) = &mut self.all_edges[i];
                            if let Edge::EqualityOfElement { element, .. } = edge {
                                element.set_type(result.clone());
                            }
                            changed = true;
                        }

                        let new_list_type = Type::list(result);
                        let current_list_type = self.all_edges[i].1.vertices().0.get_type();
                        if &new_list_type != current_list_type {
                            let (_, edge) = &mut self.all_edges[i];
                            if let Edge::EqualityOfElement { list, .. } = edge {
                                list.set_type(new_list_type);
                            }
                            changed = true;
                        }
                    }

                    Edge::FieldBelonging { parent, field, bounds } => {
                        // Ensure parent has RecordType
                        let parent_type = parent.get_type().clone();
                        if parent_type.is_any() {
                            let (_, edge) = &mut self.all_edges[i];
                            if let Edge::FieldBelonging { parent, .. } = edge {
                                parent.set_type(Type::opened_record());
                            }
                            changed = true;
                            continue;
                        }

                        if let Type::Record { ref fields, .. } = parent_type {
                            let field_name = match field.field() {
                                Some(f) => f.to_string(),
                                None => continue,
                            };
                            let field_type = field.get_type().clone();

                            if let Some(existing_type) = fields.get(&field_name) {
                                let result = intersect(field_type.clone(), existing_type.clone(), *bounds)?;
                                if &result != existing_type {
                                    let (_, edge) = &mut self.all_edges[i];
                                    if let Edge::FieldBelonging { parent, .. } = edge {
                                        if let Some(fields) = parent.get_type().clone().record_fields_mut() {
                                            fields.insert(field_name, result);
                                        }
                                    }
                                    changed = true;
                                }
                            } else {
                                // Add new field to record
                                let (_, edge) = &mut self.all_edges[i];
                                if let Edge::FieldBelonging { parent, .. } = edge {
                                    let mut new_type = parent.get_type().clone();
                                    if let Some(fields) = new_type.record_fields_mut() {
                                        fields.insert(field_name, field_type);
                                    }
                                    parent.set_type(new_type);
                                }
                                changed = true;
                            }
                        }
                    }

                    Edge::PredicateArgument { logica_value, argument: _, bounds: _ } => {
                        // Handle special built-in predicates like inequalities
                        if let Some(pred_name) = logica_value.predicate_name() {
                            if is_inequality_predicate(pred_name) {
                                // Get argument types from the graph
                                if let Some(_graph) = self.graphs.get(&graph_name) {
                                    let arg_types = self.get_arguments(logica_value, &graph_name);
                                    if let (Some(left_type), Some(right_type)) =
                                        (arg_types.get("left"), arg_types.get("right"))
                                    {
                                        if let Some((correct_left, correct_right)) =
                                            check_inequalities(left_type, right_type)
                                        {
                                            // Update argument types
                                            // Note: This is simplified - full implementation would update the actual expressions
                                            let _ = (correct_left, correct_right);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        Ok(())
    }

    /// Get argument types for a predicate call.
    fn get_arguments(
        &self,
        logica_value: &Expression,
        graph_name: &str,
    ) -> HashMap<String, Type> {
        let mut arg_types = HashMap::new();

        if let Some(graph) = self.graphs.get(graph_name) {
            let lv_key = logica_value.to_string();
            if let Some(connections) = graph.connections_for(&lv_key) {
                for (arg_key, edges) in connections {
                    // Check if any edge is a PredicateArgument
                    let has_pred_arg = edges.iter().any(|e| matches!(e, Edge::PredicateArgument { .. }));
                    if has_pred_arg {
                        // Extract field name from arg_key
                        if let Some(inner) = arg_key
                            .strip_prefix("PredicateAddressing(")
                            .and_then(|s| s.strip_suffix(")"))
                        {
                            if let Some((_, field)) = inner.split_once('.') {
                                // Get type from the edge
                                for edge in edges {
                                    if let Edge::PredicateArgument { argument, .. } = edge {
                                        arg_types.insert(field.to_string(), argument.get_type().clone());
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        arg_types
    }

    /// Get the inferred type for a predicate field.
    pub fn get_type(&self, predicate_name: &str, field: &str) -> Option<Type> {
        let key = format!("PredicateAddressing({}.{})", predicate_name, field);

        for (_, edge) in &self.all_edges {
            let (v1, v2) = edge.vertices();
            if v1.to_string() == key {
                return Some(v1.get_type().clone());
            }
            if v2.to_string() == key {
                return Some(v2.get_type().clone());
            }
        }

        None
    }

    /// Get all inferred types for a predicate.
    pub fn get_predicate_types(&self, predicate_name: &str) -> HashMap<String, Type> {
        let mut types = HashMap::new();
        let prefix = format!("PredicateAddressing({}", predicate_name);

        for (_, edge) in &self.all_edges {
            let (v1, v2) = edge.vertices();
            for v in [v1, v2] {
                let key = v.to_string();
                if key.starts_with(&prefix) {
                    if let Some(field) = v.field() {
                        types.insert(field.to_string(), v.get_type().clone());
                    }
                }
            }
        }

        types
    }
}

#[cfg(test)]
mod tests {
    use super::super::graph::TypesGraph;
    use super::*;

    #[test]
    fn test_empty_inference() {
        let graphs = HashMap::new();
        let mut engine = TypeInference::new(graphs);
        assert!(engine.infer().is_ok());
    }

    #[test]
    fn test_simple_graph_inference() {
        use super::super::edge::Edge;
        use super::super::expression::Expression;

        let mut graph = TypesGraph::new();
        // Create x = y where x is a number literal
        let x = Expression::NumberLiteral;
        let y = Expression::variable("y");
        graph.connect(Edge::equality(x, y, (0, 10)));

        let mut graphs = HashMap::new();
        graphs.insert("Test".to_string(), graph);

        let mut engine = TypeInference::new(graphs);
        assert!(engine.infer().is_ok());
    }

    #[test]
    fn test_type_propagation() {
        use super::super::edge::Edge;
        use super::super::expression::Expression;

        let mut graph = TypesGraph::new();

        // Chain: number_lit = x, x = y
        // This should propagate Number type through the chain
        let num = Expression::NumberLiteral;
        let x = Expression::variable("x");
        let y = Expression::variable("y");

        graph.connect(Edge::equality(num, x.clone(), (0, 5)));
        graph.connect(Edge::equality(x, y, (5, 10)));

        let mut graphs = HashMap::new();
        graphs.insert("Test".to_string(), graph);

        let mut engine = TypeInference::new(graphs);
        assert!(engine.infer().is_ok());
    }
}
