//! Edge types for the type inference graph.
//!
//! Ported from Python: type_inference/types/edge.py

use super::expression::Expression;
use std::hash::{Hash, Hasher};

/// Source location bounds (start, end) for error reporting.
pub type Bounds = (i64, i64);

/// Edge in the type inference graph.
#[derive(Debug, Clone)]
pub enum Edge {
    /// Two expressions must have equal types.
    Equality {
        left: Expression,
        right: Expression,
        bounds: Bounds,
    },
    /// The element type must match the list's element type.
    EqualityOfElement {
        list: Expression,
        element: Expression,
        bounds: Bounds,
    },
    /// A field belongs to a record.
    FieldBelonging {
        parent: Expression,
        field: Expression, // Should be SubscriptAddressing
        bounds: Bounds,
    },
    /// Predicate argument relationship.
    PredicateArgument {
        logica_value: Expression, // Should be PredicateAddressing
        argument: Expression,     // Should be PredicateAddressing
        bounds: Bounds,
    },
}

impl Edge {
    /// Create an equality edge.
    pub fn equality(left: Expression, right: Expression, bounds: Bounds) -> Self {
        Edge::Equality {
            left,
            right,
            bounds,
        }
    }

    /// Create an equality of element edge.
    pub fn equality_of_element(list: Expression, element: Expression, bounds: Bounds) -> Self {
        Edge::EqualityOfElement {
            list,
            element,
            bounds,
        }
    }

    /// Create a field belonging edge.
    pub fn field_belonging(parent: Expression, field: Expression, bounds: Bounds) -> Self {
        Edge::FieldBelonging {
            parent,
            field,
            bounds,
        }
    }

    /// Create a predicate argument edge.
    pub fn predicate_argument(
        logica_value: Expression,
        argument: Expression,
        bounds: Bounds,
    ) -> Self {
        Edge::PredicateArgument {
            logica_value,
            argument,
            bounds,
        }
    }

    /// Get the bounds of this edge.
    pub fn bounds(&self) -> Bounds {
        match self {
            Edge::Equality { bounds, .. } => *bounds,
            Edge::EqualityOfElement { bounds, .. } => *bounds,
            Edge::FieldBelonging { bounds, .. } => *bounds,
            Edge::PredicateArgument { bounds, .. } => *bounds,
        }
    }

    /// Get the vertices (expressions) of this edge.
    pub fn vertices(&self) -> (&Expression, &Expression) {
        match self {
            Edge::Equality { left, right, .. } => (left, right),
            Edge::EqualityOfElement { list, element, .. } => (list, element),
            Edge::FieldBelonging { parent, field, .. } => (parent, field),
            Edge::PredicateArgument {
                logica_value,
                argument,
                ..
            } => (logica_value, argument),
        }
    }

    /// Get mutable references to the vertices.
    pub fn vertices_mut(&mut self) -> (&mut Expression, &mut Expression) {
        match self {
            Edge::Equality { left, right, .. } => (left, right),
            Edge::EqualityOfElement { list, element, .. } => (list, element),
            Edge::FieldBelonging { parent, field, .. } => (parent, field),
            Edge::PredicateArgument {
                logica_value,
                argument,
                ..
            } => (logica_value, argument),
        }
    }
}

impl PartialEq for Edge {
    fn eq(&self, other: &Self) -> bool {
        match (self, other) {
            (
                Edge::Equality {
                    left: l1,
                    right: r1,
                    bounds: b1,
                },
                Edge::Equality {
                    left: l2,
                    right: r2,
                    bounds: b2,
                },
            ) => {
                b1 == b2
                    && ((l1 == l2 && r1 == r2) || (l1 == r2 && r1 == l2))
            }
            (
                Edge::EqualityOfElement {
                    list: l1,
                    element: e1,
                    bounds: b1,
                },
                Edge::EqualityOfElement {
                    list: l2,
                    element: e2,
                    bounds: b2,
                },
            ) => l1 == l2 && e1 == e2 && b1 == b2,
            (
                Edge::FieldBelonging {
                    parent: p1,
                    field: f1,
                    bounds: b1,
                },
                Edge::FieldBelonging {
                    parent: p2,
                    field: f2,
                    bounds: b2,
                },
            ) => p1 == p2 && f1 == f2 && b1 == b2,
            (
                Edge::PredicateArgument {
                    logica_value: lv1,
                    argument: a1,
                    bounds: b1,
                },
                Edge::PredicateArgument {
                    logica_value: lv2,
                    argument: a2,
                    bounds: b2,
                },
            ) => lv1 == lv2 && a1 == a2 && b1 == b2,
            _ => false,
        }
    }
}

impl Eq for Edge {}

impl Hash for Edge {
    fn hash<H: Hasher>(&self, state: &mut H) {
        let (v1, v2) = self.vertices();
        // Use sorted vertex strings for consistent hashing
        let mut strs = vec![v1.to_string(), v2.to_string()];
        strs.sort();
        strs.hash(state);
        self.bounds().hash(state);
        // Discriminant for edge type
        std::mem::discriminant(self).hash(state);
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::HashSet;

    fn var(name: &str) -> Expression {
        Expression::variable(name)
    }

    #[test]
    fn test_edge_constructors() {
        let e1 = Edge::equality(var("x"), var("y"), (0, 10));
        assert!(matches!(e1, Edge::Equality { .. }));

        let e2 = Edge::equality_of_element(var("list"), var("elem"), (0, 5));
        assert!(matches!(e2, Edge::EqualityOfElement { .. }));

        let e3 = Edge::field_belonging(var("rec"), var("field"), (0, 3));
        assert!(matches!(e3, Edge::FieldBelonging { .. }));

        let e4 = Edge::predicate_argument(var("val"), var("arg"), (0, 7));
        assert!(matches!(e4, Edge::PredicateArgument { .. }));
    }

    #[test]
    fn test_edge_bounds() {
        let e1 = Edge::equality(var("x"), var("y"), (5, 15));
        assert_eq!(e1.bounds(), (5, 15));

        let e2 = Edge::equality_of_element(var("l"), var("e"), (10, 20));
        assert_eq!(e2.bounds(), (10, 20));

        let e3 = Edge::field_belonging(var("r"), var("f"), (0, 100));
        assert_eq!(e3.bounds(), (0, 100));

        let e4 = Edge::predicate_argument(var("v"), var("a"), (1, 2));
        assert_eq!(e4.bounds(), (1, 2));
    }

    #[test]
    fn test_edge_vertices() {
        let e = Edge::equality(var("a"), var("b"), (0, 1));
        let (left, right) = e.vertices();
        assert_eq!(left, &var("a"));
        assert_eq!(right, &var("b"));
    }

    #[test]
    fn test_edge_vertices_mut() {
        let mut e = Edge::equality(var("a"), var("b"), (0, 1));
        {
            let (left, _right) = e.vertices_mut();
            *left = var("c");
        }
        let (left, _) = e.vertices();
        assert_eq!(left, &var("c"));

        // Test other variants
        let mut e2 = Edge::equality_of_element(var("l"), var("e"), (0, 1));
        let (list, elem) = e2.vertices_mut();
        *list = var("list2");
        *elem = var("elem2");

        let mut e3 = Edge::field_belonging(var("p"), var("f"), (0, 1));
        let (parent, field) = e3.vertices_mut();
        *parent = var("parent2");
        *field = var("field2");

        let mut e4 = Edge::predicate_argument(var("v"), var("a"), (0, 1));
        let (lv, arg) = e4.vertices_mut();
        *lv = var("lv2");
        *arg = var("arg2");
    }

    #[test]
    fn test_edge_equality() {
        let e1 = Edge::equality(var("x"), var("y"), (0, 10));
        let e2 = Edge::equality(var("x"), var("y"), (0, 10));
        let e3 = Edge::equality(var("y"), var("x"), (0, 10)); // reversed
        let e4 = Edge::equality(var("x"), var("z"), (0, 10));
        let e5 = Edge::equality(var("x"), var("y"), (0, 20)); // different bounds

        assert_eq!(e1, e2);
        assert_eq!(e1, e3); // Equality edges are symmetric
        assert_ne!(e1, e4);
        assert_ne!(e1, e5);

        // Different edge types are not equal
        let elem = Edge::equality_of_element(var("x"), var("y"), (0, 10));
        assert_ne!(e1, elem);

        // EqualityOfElement
        let ee1 = Edge::equality_of_element(var("l"), var("e"), (0, 5));
        let ee2 = Edge::equality_of_element(var("l"), var("e"), (0, 5));
        let ee3 = Edge::equality_of_element(var("l2"), var("e"), (0, 5));
        assert_eq!(ee1, ee2);
        assert_ne!(ee1, ee3);

        // FieldBelonging
        let fb1 = Edge::field_belonging(var("r"), var("f"), (0, 3));
        let fb2 = Edge::field_belonging(var("r"), var("f"), (0, 3));
        let fb3 = Edge::field_belonging(var("r2"), var("f"), (0, 3));
        assert_eq!(fb1, fb2);
        assert_ne!(fb1, fb3);

        // PredicateArgument
        let pa1 = Edge::predicate_argument(var("v"), var("a"), (0, 7));
        let pa2 = Edge::predicate_argument(var("v"), var("a"), (0, 7));
        let pa3 = Edge::predicate_argument(var("v2"), var("a"), (0, 7));
        assert_eq!(pa1, pa2);
        assert_ne!(pa1, pa3);
    }

    #[test]
    fn test_edge_hash() {
        let mut set = HashSet::new();
        let e1 = Edge::equality(var("x"), var("y"), (0, 10));
        let e2 = Edge::equality(var("x"), var("y"), (0, 10));

        set.insert(e1.clone());
        assert!(set.contains(&e2));

        let e3 = Edge::equality(var("a"), var("b"), (0, 10));
        assert!(!set.contains(&e3));
    }
}
