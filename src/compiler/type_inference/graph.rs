// Modified from: logica/type_inference/types/types_graph.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// Original work: Copyright 2020 Google LLC, licensed under the Apache License, Version 2.0.
// Modifications: Copyright 2025-2026 Yoan Sallami (Synalinks Team), licensed under the Apache License, Version 2.0.

//! Types graph for storing expression connections.
//!
//! Ported from Python: type_inference/types/types_graph.py

use super::edge::Edge;
use super::expression::Expression;
use std::collections::{HashMap, HashSet};

/// Graph storing type inference edges between expressions.
#[derive(Debug, Clone, Default)]
pub struct TypesGraph {
    /// The edges, each once, in the order they were connected.
    edges: Vec<Edge>,
    /// The keys of the edges, to connect each once.
    keys: HashSet<EdgeKey>,
    /// The columns the edges hold: the fields of each predicate of their
    /// `PredicateAddressing` vertices.
    columns: HashMap<String, HashSet<String>>,
}

/// Key for deduplicating edges: two edges are one when they are of the same
/// kind, have the same bounds, and connect the same two expressions, an
/// expression being its text (its type and, for a column, its use apart).
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
struct EdgeKey {
    vertices: (u128, u128),
    bounds: (i64, i64),
    discriminant: std::mem::Discriminant<Edge>,
}

/// A 128-bit digest of an expression's text, written without allocating it.
fn text_digest(expression: &Expression) -> u128 {
    use std::fmt::Write;
    use std::hash::Hasher;
    struct Digest(std::collections::hash_map::DefaultHasher, std::collections::hash_map::DefaultHasher);
    impl Write for Digest {
        fn write_str(&mut self, text: &str) -> std::fmt::Result {
            self.0.write(text.as_bytes());
            self.1.write(text.as_bytes());
            Ok(())
        }
    }
    let mut second = std::collections::hash_map::DefaultHasher::new();
    second.write_u8(0x5a);
    let mut digest = Digest(std::collections::hash_map::DefaultHasher::new(), second);
    let _ = write!(digest, "{}", expression);
    ((digest.0.finish() as u128) << 64) | digest.1.finish() as u128
}

impl EdgeKey {
    fn new(edge: &Edge) -> Self {
        let (first, second) = edge.vertices();
        let (a, b) = (text_digest(first), text_digest(second));
        Self {
            vertices: if a <= b { (a, b) } else { (b, a) },
            bounds: edge.bounds(),
            discriminant: std::mem::discriminant(edge),
        }
    }
}

impl TypesGraph {
    /// Create a new empty types graph.
    pub fn new() -> Self {
        Self::default()
    }

    /// Connect two expressions with an edge.
    pub fn connect(&mut self, edge: Edge) {
        if !self.keys.insert(EdgeKey::new(&edge)) {
            return; // Already have this edge
        }
        let (first, second) = edge.vertices();
        for v in [first, second] {
            if let Expression::PredicateAddressing { predicate_name, field, .. } = v {
                if !self.has_column(predicate_name, field) {
                    self.columns.entry(predicate_name.clone()).or_default().insert(field.clone());
                }
            }
        }
        self.edges.push(edge);
    }

    /// Get all edges in the graph.
    pub fn to_edges_vec(&self) -> Vec<Edge> {
        self.edges.clone()
    }

    /// The edges in the graph, in the order they were connected.
    pub fn edges(&self) -> &[Edge] {
        &self.edges
    }

    /// Whether an edge of the graph holds column `field` of `predicate`.
    pub fn has_column(&self, predicate: &str, field: &str) -> bool {
        self.columns.get(predicate).is_some_and(|fields| fields.contains(field))
    }

    /// Merge another graph into this one.
    pub fn merge(&mut self, other: TypesGraph) {
        for edge in other.edges {
            self.connect(edge);
        }
    }
}

impl std::ops::BitOr for TypesGraph {
    type Output = TypesGraph;

    fn bitor(mut self, rhs: Self) -> Self::Output {
        self.merge(rhs);
        self
    }
}

impl std::ops::BitOrAssign for TypesGraph {
    fn bitor_assign(&mut self, rhs: Self) {
        self.merge(rhs);
    }
}

#[cfg(test)]
mod tests {
    use super::super::edge::Edge;
    use super::super::expression::Expression;
    use super::*;

    #[test]
    fn test_connect_and_edges() {
        let mut graph = TypesGraph::new();
        let expr1 = Expression::variable("x");
        let expr2 = Expression::variable("y");
        let edge = Edge::equality(expr1, expr2, (0, 10));
        graph.connect(edge);

        let edges = graph.to_edges_vec();
        assert_eq!(edges.len(), 1);
    }

    #[test]
    fn test_no_duplicate_edges() {
        let mut graph = TypesGraph::new();
        let expr1 = Expression::variable("x");
        let expr2 = Expression::variable("y");
        let edge1 = Edge::equality(expr1.clone(), expr2.clone(), (0, 10));
        let edge2 = Edge::equality(expr1, expr2, (0, 10));

        graph.connect(edge1);
        graph.connect(edge2);

        let edges = graph.to_edges_vec();
        assert_eq!(edges.len(), 1);
    }

    #[test]
    fn test_merge_graphs() {
        let mut graph1 = TypesGraph::new();
        let mut graph2 = TypesGraph::new();

        graph1.connect(Edge::equality(
            Expression::variable("x"),
            Expression::variable("y"),
            (0, 5),
        ));
        graph2.connect(Edge::equality(
            Expression::variable("a"),
            Expression::variable("b"),
            (10, 15),
        ));

        graph1 |= graph2;
        assert_eq!(graph1.to_edges_vec().len(), 2);
    }
}
