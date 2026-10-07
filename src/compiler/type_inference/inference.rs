// Modified from: logica/type_inference/research/infer.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// Original work: Copyright 2020 Google LLC, licensed under the Apache License, Version 2.0.
// Modifications: Copyright 2025-2026 Yoan Sallami (Synalinks Team), licensed under the Apache License, Version 2.0.

//! Type inference engine.
//!
//! Ported from Python: type_inference/type_inference_service.py

use super::edge::Edge;
use crate::compiler::type_inference::Bounds;
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
            for edge in graph.edges() {
                all_edges.push((name.clone(), edge.clone()));
            }
        }

        Self {
            all_edges,
            graphs,
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
                && !graph.has_column(name, "logica_value"))
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
        // Each shared vertex is interned once: its type lives in `store`, at
        // the index `sides[i][side]` gives for side `side` of edge `i`. A
        // vertex without a key keeps its type itself.
        let mut ids: HashMap<String, usize> = HashMap::new();
        let mut store: Vec<Type> = Vec::new();
        let mut sides: Vec<[Option<usize>; 2]> = Vec::with_capacity(self.all_edges.len());
        for (_, edge) in &self.all_edges {
            let (a, b) = edge.vertices();
            let mut side_ids = [None, None];
            for (side, v) in [a, b].into_iter().enumerate() {
                if let Some(k) = shared_key(v) {
                    let t = v.get_type().clone();
                    let id = match ids.get(&k) {
                        Some(&id) => {
                            store[id] = intersect(store[id].clone(), t, (0, 0))?;
                            id
                        }
                        None => {
                            store.push(t);
                            ids.insert(k, store.len() - 1);
                            store.len() - 1
                        }
                    };
                    side_ids[side] = Some(id);
                }
            }
            sides.push(side_ids);
        }
        // What each edge says, read once: the loop needs no copy of its vertices.
        enum Kind {
            Equality(Bounds),
            EqualityOfElement(Bounds),
            FieldBelonging(Bounds, Option<String>),
            PredicateArgument,
        }
        let kinds: Vec<Kind> = self.all_edges.iter().map(|(_, edge)| match edge {
            Edge::Equality { bounds, .. } => Kind::Equality(*bounds),
            Edge::EqualityOfElement { bounds, .. } => Kind::EqualityOfElement(*bounds),
            Edge::FieldBelonging { field, bounds, .. } => Kind::FieldBelonging(*bounds, field.field().map(|f| f.to_string())),
            Edge::PredicateArgument { .. } => Kind::PredicateArgument,
        }).collect();
        let current = |edges: &[(String, Edge)], store: &[Type], i: usize, side: usize| -> Type {
            match sides[i][side] {
                Some(id) => store[id].clone(),
                None => {
                    let (a, b) = edges[i].1.vertices();
                    if side == 0 { a } else { b }.get_type().clone()
                }
            }
        };
        // Give vertex `side` (0 or 1) of edge `i` the type `t`: whether its
        // type changed. A literal keeps its own (a null's is any type), so
        // giving it another changes nothing: counted as a change, it kept the
        // loop from converging.
        let assign = |edges: &mut [(String, Edge)], store: &mut [Type], i: usize, side: usize, t: &Type| -> bool {
            match sides[i][side] {
                Some(id) => {
                    let changed = store[id] != *t;
                    store[id] = t.clone();
                    changed
                }
                None => {
                    let (a, b) = edges[i].1.vertices_mut();
                    let v = if side == 0 { a } else { b };
                    let before = v.get_type().clone();
                    v.set_type(t.clone());
                    before != *v.get_type()
                }
            }
        };

        let mut changed = true;
        let mut iterations = 0;
        const MAX_ITERATIONS: usize = 1000;
        while changed && iterations < MAX_ITERATIONS {
            changed = false;
            iterations += 1;
            for i in 0..self.all_edges.len() {
                match &kinds[i] {
                    Kind::Equality(bounds) => {
                        let r = intersect(current(&self.all_edges, &store, i, 0), current(&self.all_edges, &store, i, 1), *bounds)?;
                        changed |= assign(&mut self.all_edges, &mut store, i, 0, &r);
                        changed |= assign(&mut self.all_edges, &mut store, i, 1, &r);
                    }
                    Kind::EqualityOfElement(bounds) => {
                        let list_type = current(&self.all_edges, &store, i, 0);
                        if list_type.is_any() {
                            changed |= assign(&mut self.all_edges, &mut store, i, 0, &Type::list(Type::Any));
                            continue;
                        }
                        let r = intersect_list_element(&list_type, current(&self.all_edges, &store, i, 1), *bounds)?;
                        changed |= assign(&mut self.all_edges, &mut store, i, 1, &r);
                        changed |= assign(&mut self.all_edges, &mut store, i, 0, &Type::list(r));
                    }
                    Kind::FieldBelonging(bounds, name) => {
                        let parent_type = current(&self.all_edges, &store, i, 0);
                        if parent_type.is_any() {
                            changed |= assign(&mut self.all_edges, &mut store, i, 0, &Type::opened_record());
                            continue;
                        }
                        let Some(name) = name else { continue };
                        if let Type::Record { fields, is_opened } = &parent_type {
                            let field_type = current(&self.all_edges, &store, i, 1);
                            let r = match fields.get(name) {
                                Some(existing) => intersect(field_type, existing.clone(), *bounds)?,
                                None => field_type,
                            };
                            let mut new_fields = fields.clone();
                            new_fields.insert(name.clone(), r.clone());
                            let new_parent = Type::Record { fields: new_fields, is_opened: *is_opened };
                            changed |= assign(&mut self.all_edges, &mut store, i, 0, &new_parent);
                            changed |= assign(&mut self.all_edges, &mut store, i, 1, &r);
                        }
                    }
                    Kind::PredicateArgument => {}
                }
            }
        }
        // Every copy of a shared vertex has its type.
        for (i, (_, edge)) in self.all_edges.iter_mut().enumerate() {
            let (a, b) = edge.vertices_mut();
            for (side, v) in [a, b].into_iter().enumerate() {
                if let Some(id) = sides[i][side] {
                    v.set_type(store[id].clone());
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
        self.all_predicate_types().remove(predicate_name).unwrap_or_default()
    }

    /// The inferred column types of every predicate, in one pass over the
    /// edges.
    pub fn all_predicate_types(&self) -> HashMap<String, HashMap<String, Type>> {
        let mut all: HashMap<String, HashMap<String, Type>> = HashMap::new();
        for (_, edge) in &self.all_edges {
            let (v1, v2) = edge.vertices();
            for v in [v1, v2] {
                let Expression::PredicateAddressing { predicate_name, field, .. } = v else { continue };
                let types = all.entry(predicate_name.clone()).or_default();
                // A column has a vertex per rule, some less specific than
                // others (a null, an empty list `[]`): its type is their
                // intersection, the same in any order. Where two rules
                // disagree, the most specific type, by rank and then by a text
                // that does not depend on hash order.
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
                types.insert(field.clone(), merged);
            }
        }
        all
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
