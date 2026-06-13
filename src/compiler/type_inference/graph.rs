// Modified from: logica/type_inference/types/types_graph.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Types graph for storing expression connections.
//!
//! Ported from Python: type_inference/types/types_graph.py

use super::edge::Edge;
use std::collections::{HashMap, HashSet};

/// Graph storing type inference edges between expressions.
#[derive(Debug, Clone, Default)]
pub struct TypesGraph {
    /// Map from expression to connected expressions and their edges.
    /// expression_connections[expr1][expr2] = list of edges between expr1 and expr2
    expression_connections: HashMap<String, HashMap<String, Vec<Edge>>>,
    /// All edges in the graph.
    edges: HashSet<EdgeKey>,
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
    fn from_edge(edge: &Edge) -> Self {
        let (v1, v2) = edge.vertices();
        let mut strs = vec![v1.to_string(), v2.to_string()];
        strs.sort();
        Self {
            v1: strs[0].clone(),
            v2: strs[1].clone(),
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
        let key = EdgeKey::from_edge(&edge);
        if self.edges.contains(&key) {
            return; // Already have this edge
        }
        self.edges.insert(key);

        let (first, second) = edge.vertices();
        let first_key = first.to_string();
        let second_key = second.to_string();

        // Add edge in both directions
        self.expression_connections
            .entry(first_key.clone())
            .or_default()
            .entry(second_key.clone())
            .or_default()
            .push(edge.clone());

        self.expression_connections
            .entry(second_key)
            .or_default()
            .entry(first_key)
            .or_default()
            .push(edge);
    }

    /// Get all edges in the graph.
    pub fn to_edges_vec(&self) -> Vec<Edge> {
        let mut seen = HashSet::new();
        let mut result = Vec::new();

        for connections in self.expression_connections.values() {
            for edges in connections.values() {
                for edge in edges {
                    let key = EdgeKey::from_edge(edge);
                    if !seen.contains(&key) {
                        seen.insert(key);
                        result.push(edge.clone());
                    }
                }
            }
        }

        result
    }

    /// Get connections for a specific expression.
    pub fn connections_for(&self, expr: &str) -> Option<&HashMap<String, Vec<Edge>>> {
        self.expression_connections.get(expr)
    }

    /// Check if an expression exists in the graph.
    pub fn contains_expression(&self, expr: &str) -> bool {
        self.expression_connections.contains_key(expr)
    }

    /// Get all expression keys in the graph.
    pub fn expressions(&self) -> impl Iterator<Item = &String> {
        self.expression_connections.keys()
    }

    /// Merge another graph into this one.
    pub fn merge(&mut self, other: TypesGraph) {
        for edge in other.to_edges_vec() {
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
