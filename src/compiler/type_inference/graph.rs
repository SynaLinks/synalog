// Modified from: logica/type_inference/types/types_graph.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// Original work: Copyright 2020 Google LLC, licensed under the Apache License, Version 2.0.
// Modifications: Copyright 2025-2026 Yoan Sallami (Synalinks Team), licensed under the Apache License, Version 2.0.

//! Types graph for storing expression connections.
//!
//! Ported from Python: type_inference/types/types_graph.py

use super::edge::Edge;
use std::collections::HashSet;

/// Graph storing type inference edges between expressions.
#[derive(Debug, Clone, Default)]
pub struct TypesGraph {
    /// The edges, each once, in the order they were connected.
    edges: Vec<Edge>,
    /// The keys of the edges, to connect each once.
    keys: HashSet<EdgeKey>,
    /// The expressions the edges connect, by their text.
    expressions: HashSet<String>,
}

/// Key for deduplicating edges.
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
struct EdgeKey {
    v1: String,
    v2: String,
    bounds: (i64, i64),
    discriminant: std::mem::Discriminant<Edge>,
}

impl EdgeKey {
    fn new(edge: &Edge, first: String, second: String) -> Self {
        let (v1, v2) = if first <= second { (first, second) } else { (second, first) };
        Self {
            v1,
            v2,
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
        let (first, second) = edge.vertices();
        let (first, second) = (first.to_string(), second.to_string());
        let key = EdgeKey::new(&edge, first.clone(), second.clone());
        if !self.keys.insert(key) {
            return; // Already have this edge
        }
        self.expressions.insert(first);
        self.expressions.insert(second);
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

    /// Check if an expression exists in the graph.
    pub fn contains_expression(&self, expr: &str) -> bool {
        self.expressions.contains(expr)
    }

    /// Get all expression keys in the graph.
    pub fn expressions(&self) -> impl Iterator<Item = &String> {
        self.expressions.iter()
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
