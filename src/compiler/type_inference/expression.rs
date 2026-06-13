//! Expression types for the type inference graph.
//!
//! Ported from Python: type_inference/types/expression.py

use super::built_in::built_in_restrictions;
use super::types::Type;
use std::fmt;
use std::hash::{Hash, Hasher};

/// Expression identifier for type graph nodes.
#[derive(Debug, Clone)]
pub enum Expression {
    /// Reference to a predicate field: predicate_name.field (with predicate_id for multiple usages)
    PredicateAddressing {
        predicate_name: String,
        field: String,
        predicate_id: usize,
        expr_type: Type,
    },
    /// Subscript addressing: base.subscript_field
    SubscriptAddressing {
        base: Box<Expression>,
        subscript_field: String,
        expr_type: Type,
    },
    /// Variable reference
    Variable {
        variable_name: String,
        expr_type: Type,
    },
    /// String literal
    StringLiteral,
    /// Number literal
    NumberLiteral,
    /// Boolean literal
    BooleanLiteral,
    /// Null literal
    NullLiteral,
    /// List literal with elements
    ListLiteral {
        elements: Vec<Expression>,
        expr_type: Type,
    },
    /// Record literal with fields
    RecordLiteral {
        fields: std::collections::HashMap<String, Expression>,
        expr_type: Type,
    },
}

impl Expression {
    /// Create a predicate addressing expression.
    pub fn predicate_addressing(predicate_name: &str, field: &str, predicate_id: usize) -> Self {
        let expr_type = built_in_restrictions(predicate_name, field).unwrap_or(Type::Any);
        Expression::PredicateAddressing {
            predicate_name: predicate_name.to_string(),
            field: field.to_string(),
            predicate_id,
            expr_type,
        }
    }

    /// Create a subscript addressing expression.
    pub fn subscript_addressing(base: Expression, subscript_field: &str) -> Self {
        Expression::SubscriptAddressing {
            base: Box::new(base),
            subscript_field: subscript_field.to_string(),
            expr_type: Type::Any,
        }
    }

    /// Create a variable expression.
    pub fn variable(name: &str) -> Self {
        Expression::Variable {
            variable_name: name.to_string(),
            expr_type: Type::Any,
        }
    }

    /// Create a list literal expression.
    pub fn list_literal(elements: Vec<Expression>) -> Self {
        let element_type = if let Some(first) = elements.first() {
            first.get_type().clone()
        } else {
            Type::Any
        };
        Expression::ListLiteral {
            elements,
            expr_type: Type::list(element_type),
        }
    }

    /// Create a record literal expression.
    pub fn record_literal(fields: std::collections::HashMap<String, Expression>) -> Self {
        let field_types: std::collections::HashMap<String, Type> = fields
            .iter()
            .map(|(k, v)| (k.clone(), v.get_type().clone()))
            .collect();
        Expression::RecordLiteral {
            fields,
            expr_type: Type::record(field_types, false),
        }
    }

    /// Get the type of this expression.
    pub fn get_type(&self) -> &Type {
        match self {
            Expression::PredicateAddressing { expr_type, .. } => expr_type,
            Expression::SubscriptAddressing { expr_type, .. } => expr_type,
            Expression::Variable { expr_type, .. } => expr_type,
            Expression::StringLiteral => &Type::String,
            Expression::NumberLiteral => &Type::Number,
            Expression::BooleanLiteral => &Type::Bool,
            Expression::NullLiteral => &Type::Any,
            Expression::ListLiteral { expr_type, .. } => expr_type,
            Expression::RecordLiteral { expr_type, .. } => expr_type,
        }
    }

    /// Set the type of this expression.
    pub fn set_type(&mut self, new_type: Type) {
        match self {
            Expression::PredicateAddressing { expr_type, .. } => *expr_type = new_type,
            Expression::SubscriptAddressing { expr_type, .. } => *expr_type = new_type,
            Expression::Variable { expr_type, .. } => *expr_type = new_type,
            Expression::StringLiteral | Expression::NumberLiteral | Expression::BooleanLiteral => {
                // Literals have fixed types
            }
            Expression::NullLiteral => {
                // Null type can be set
            }
            Expression::ListLiteral { expr_type, .. } => *expr_type = new_type,
            Expression::RecordLiteral { expr_type, .. } => *expr_type = new_type,
        }
    }

    /// Get predicate name if this is a PredicateAddressing.
    pub fn predicate_name(&self) -> Option<&str> {
        match self {
            Expression::PredicateAddressing { predicate_name, .. } => Some(predicate_name),
            _ => None,
        }
    }

    /// Get field name if this is a PredicateAddressing or SubscriptAddressing.
    pub fn field(&self) -> Option<&str> {
        match self {
            Expression::PredicateAddressing { field, .. } => Some(field),
            Expression::SubscriptAddressing { subscript_field, .. } => Some(subscript_field),
            _ => None,
        }
    }
}

impl fmt::Display for Expression {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Expression::PredicateAddressing {
                predicate_name,
                field,
                ..
            } => {
                write!(f, "PredicateAddressing({}.{})", predicate_name, field)
            }
            Expression::SubscriptAddressing {
                base,
                subscript_field,
                ..
            } => {
                write!(f, "SubscriptAddressing{}.{}", base, subscript_field)
            }
            Expression::Variable { variable_name, .. } => {
                write!(f, "Variable({})", variable_name)
            }
            Expression::StringLiteral => write!(f, "StringLiteral"),
            Expression::NumberLiteral => write!(f, "NumberLiteral"),
            Expression::BooleanLiteral => write!(f, "BooleanLiteral"),
            Expression::NullLiteral => write!(f, "NullLiteral"),
            Expression::ListLiteral { elements, .. } => {
                let elems: Vec<String> = elements.iter().map(|e| e.to_string()).collect();
                write!(f, "ListLiteral[{}]", elems.join(", "))
            }
            Expression::RecordLiteral { fields, .. } => {
                let mut items: Vec<_> = fields.iter().collect();
                items.sort_by_key(|(k, _)| *k);
                let fields_str: Vec<String> =
                    items.into_iter().map(|(k, v)| format!("{}: {}", k, v)).collect();
                write!(f, "RecordLiteral({})", fields_str.join(", "))
            }
        }
    }
}

impl PartialEq for Expression {
    fn eq(&self, other: &Self) -> bool {
        match (self, other) {
            (
                Expression::PredicateAddressing {
                    predicate_name: pn1,
                    field: f1,
                    predicate_id: id1,
                    ..
                },
                Expression::PredicateAddressing {
                    predicate_name: pn2,
                    field: f2,
                    predicate_id: id2,
                    ..
                },
            ) => pn1 == pn2 && f1 == f2 && id1 == id2,
            (
                Expression::SubscriptAddressing {
                    subscript_field: sf1,
                    ..
                },
                Expression::SubscriptAddressing {
                    subscript_field: sf2,
                    ..
                },
            ) => sf1 == sf2,
            (
                Expression::Variable {
                    variable_name: vn1, ..
                },
                Expression::Variable {
                    variable_name: vn2, ..
                },
            ) => vn1 == vn2,
            (Expression::StringLiteral, Expression::StringLiteral) => true,
            (Expression::NumberLiteral, Expression::NumberLiteral) => true,
            (Expression::BooleanLiteral, Expression::BooleanLiteral) => true,
            (Expression::NullLiteral, Expression::NullLiteral) => true,
            (
                Expression::ListLiteral { elements: e1, .. },
                Expression::ListLiteral { elements: e2, .. },
            ) => e1 == e2,
            (
                Expression::RecordLiteral { fields: f1, .. },
                Expression::RecordLiteral { fields: f2, .. },
            ) => f1 == f2,
            _ => false,
        }
    }
}

impl Eq for Expression {}

impl Hash for Expression {
    fn hash<H: Hasher>(&self, state: &mut H) {
        self.to_string().hash(state);
    }
}
