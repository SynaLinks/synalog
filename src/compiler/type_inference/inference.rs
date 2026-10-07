// Modified from: logica/type_inference/research/infer.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// Original work: Copyright 2020 Google LLC, licensed under the Apache License, Version 2.0.
// Modifications: Copyright 2025-2026 Yoan Sallami (Synalinks Team), licensed under the Apache License, Version 2.0.

//! Type inference engine.
//!
//! Ported from Python: type_inference/type_inference_service.py

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
    ///
    /// A vertex has one type, shared by every edge it is in: a predicate's
    /// column (in its own rules and wherever it is read, so a type crosses
    /// from predicate to predicate), a variable of a rule, a field of either.
    /// A literal is a vertex of its own edge: two `null`s or two `[]` are not
    /// one value.
    pub fn infer(&mut self) -> Result<(), TypeInferenceError> {
        // The relations the program defines: a column of one is one vertex
        // wherever it is read. A function's or a built-in's argument is a
        // vertex per call, as a call may give it any type (`Coalesce`).
        let relations: std::collections::HashSet<String> = self.graphs.iter()
            // An annotation (`@Make`, `@OrderBy`) is no relation.
            .filter(|(name, graph)| !name.starts_with('@')
                && !graph.contains_expression(&format!("PredicateAddressing({}.logica_value)", name)))
            .map(|(name, _)| name.clone())
            .collect();
        let shared_key = |e: &Expression| -> Option<String> {
            fn key(e: &Expression, relations: &std::collections::HashSet<String>) -> Option<String> {
                match e {
                    Expression::PredicateAddressing { predicate_name, predicate_id, .. } => Some(if relations.contains(predicate_name) {
                        e.to_string()
                    } else {
                        format!("{}#{}", e, predicate_id)
                    }),
                    Expression::Variable { .. } => Some(e.to_string()),
                    Expression::SubscriptAddressing { base, .. } => key(base, relations).map(|b| format!("{}.{}", b, e)),
                    _ => None,
                }
            }
            key(e, &relations)
        };
        let mut store: HashMap<String, Type> = HashMap::new();
        for (_, edge) in &self.all_edges {
            let (a, b) = edge.vertices();
            for v in [a, b] {
                if let Some(k) = shared_key(v) {
                    let t = v.get_type().clone();
                    let merged = match store.get(&k) {
                        Some(old) => intersect(old.clone(), t, (0, 0))?,
                        None => t,
                    };
                    store.insert(k, merged);
                }
            }
        }
        let current = |store: &HashMap<String, Type>, e: &Expression| -> Type {
            shared_key(e).and_then(|k| store.get(&k).cloned()).unwrap_or_else(|| e.get_type().clone())
        };
        // Give vertex `side` (0 or 1) of edge `i` the type `t`: whether its
        // type changed. A literal keeps its own (a null's is any type), so
        // giving it another changes nothing: counted as a change, it kept the
        // loop from converging.
        let assign = |edges: &mut [(String, Edge)], store: &mut HashMap<String, Type>, i: usize, side: usize, t: &Type| -> bool {
            let (a, b) = edges[i].1.vertices_mut();
            let v = if side == 0 { a } else { b };
            let before = current(store, v);
            if let Some(k) = shared_key(v) {
                store.insert(k, t.clone());
            }
            v.set_type(t.clone());
            before != current(store, v)
        };

        let mut changed = true;
        let mut iterations = 0;
        const MAX_ITERATIONS: usize = 1000;
        while changed && iterations < MAX_ITERATIONS {
            changed = false;
            iterations += 1;
            for i in 0..self.all_edges.len() {
                let edge = self.all_edges[i].1.clone();
                match &edge {
                    Edge::Equality { left, right, bounds } => {
                        let r = intersect(current(&store, left), current(&store, right), *bounds)?;
                        changed |= assign(&mut self.all_edges, &mut store, i, 0, &r);
                        changed |= assign(&mut self.all_edges, &mut store, i, 1, &r);
                    }
                    Edge::EqualityOfElement { list, element, bounds } => {
                        let list_type = current(&store, list);
                        if list_type.is_any() {
                            changed |= assign(&mut self.all_edges, &mut store, i, 0, &Type::list(Type::Any));
                            continue;
                        }
                        let r = intersect_list_element(&list_type, current(&store, element), *bounds)?;
                        changed |= assign(&mut self.all_edges, &mut store, i, 1, &r);
                        changed |= assign(&mut self.all_edges, &mut store, i, 0, &Type::list(r));
                    }
                    Edge::FieldBelonging { parent, field, bounds } => {
                        let parent_type = current(&store, parent);
                        if parent_type.is_any() {
                            changed |= assign(&mut self.all_edges, &mut store, i, 0, &Type::opened_record());
                            continue;
                        }
                        let Some(name) = field.field().map(|f| f.to_string()) else { continue };
                        if let Type::Record { fields, is_opened } = &parent_type {
                            let field_type = current(&store, field);
                            let r = match fields.get(&name) {
                                Some(existing) => intersect(field_type, existing.clone(), *bounds)?,
                                None => field_type,
                            };
                            let mut new_fields = fields.clone();
                            new_fields.insert(name, r.clone());
                            let new_parent = Type::Record { fields: new_fields, is_opened: *is_opened };
                            changed |= assign(&mut self.all_edges, &mut store, i, 0, &new_parent);
                            changed |= assign(&mut self.all_edges, &mut store, i, 1, &r);
                        }
                    }
                    Edge::PredicateArgument { .. } => {}
                }
            }
        }
        // Every copy of a shared vertex has its type.
        for (_, edge) in self.all_edges.iter_mut() {
            let (a, b) = edge.vertices_mut();
            for v in [a, b] {
                if let Some(t) = shared_key(v).and_then(|k| store.get(&k)) {
                    v.set_type(t.clone());
                }
            }
        }
        Ok(())
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
        let mut types: HashMap<String, Type> = HashMap::new();
        // The dot ends the name: `L` is not `List`.
        let prefix = format!("PredicateAddressing({}.", predicate_name);

        for (_, edge) in &self.all_edges {
            let (v1, v2) = edge.vertices();
            for v in [v1, v2] {
                let key = v.to_string();
                if key.starts_with(&prefix) {
                    if let Some(field) = v.field() {
                        // A column has a vertex per rule, some less specific
                        // than others (a null, an empty list `[]`): its type is
                        // their intersection, the same in any order. Where two
                        // rules disagree, the most specific type, by rank and
                        // then by a text that does not depend on hash order.
                        let new = v.get_type();
                        let merged = match types.get(field) {
                            None => new.clone(),
                            Some(old) => match intersect(old.clone(), new.clone(), (0, 0)) {
                                Ok(t) => t,
                                Err(_) => {
                                    let rank = |t: &Type| match t {
                                        Type::Any => 0,
                                        Type::Atomic => 1,
                                        _ => 2,
                                    };
                                    if rank(new) > rank(old)
                                        || (rank(new) == rank(old) && new.to_string() < old.to_string())
                                    {
                                        new.clone()
                                    } else {
                                        old.clone()
                                    }
                                }
                            },
                        };
                        types.insert(field.to_string(), merged);
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
