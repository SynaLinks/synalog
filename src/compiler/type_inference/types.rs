//! Type definitions for the Logica type inference system.
//!
//! Ported from Python: type_inference/types/variable_types.py

use std::collections::HashMap;
use std::fmt;
use std::hash::{Hash, Hasher};

/// Base trait for all Logica types.
#[derive(Debug, Clone)]
pub enum Type {
    Any,
    Atomic,
    Number,
    String,
    Bool,
    List(Box<Type>),
    Record {
        fields: HashMap<String, Type>,
        is_opened: bool,
    },
}

impl Default for Type {
    fn default() -> Self {
        Type::Any
    }
}

impl fmt::Display for Type {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Type::Any => write!(f, "any"),
            Type::Atomic => write!(f, "atomic"),
            Type::Number => write!(f, "number"),
            Type::String => write!(f, "string"),
            Type::Bool => write!(f, "bool"),
            Type::List(element) => write!(f, "[{}]", element),
            Type::Record { fields, .. } => {
                let mut items: Vec<_> = fields.iter().collect();
                items.sort_by_key(|(k, _)| *k);
                let fields_str: Vec<String> = items
                    .into_iter()
                    .map(|(k, v)| format!("{}: {}", k, v))
                    .collect();
                write!(f, "{{{}}}", fields_str.join(", "))
            }
        }
    }
}

impl PartialEq for Type {
    fn eq(&self, other: &Self) -> bool {
        match (self, other) {
            (Type::Any, Type::Any) => true,
            (Type::Atomic, Type::Atomic) => true,
            (Type::Number, Type::Number) => true,
            (Type::String, Type::String) => true,
            (Type::Bool, Type::Bool) => true,
            (Type::List(a), Type::List(b)) => a == b,
            (
                Type::Record {
                    fields: a_fields,
                    is_opened: a_open,
                },
                Type::Record {
                    fields: b_fields,
                    is_opened: b_open,
                },
            ) => {
                // Helper to check if open record is equal to closed record
                fn equal_open_to_close(
                    opened: &HashMap<String, Type>,
                    closed: &HashMap<String, Type>,
                ) -> bool {
                    opened
                        .iter()
                        .all(|(k, v)| closed.get(k).map(|cv| cv == v).unwrap_or(false))
                }

                if *a_open && *b_open {
                    // Both opened: intersection of keys must have equal types
                    a_fields
                        .iter()
                        .filter(|(k, _)| b_fields.contains_key(*k))
                        .all(|(k, v)| b_fields.get(k).map(|bv| bv == v).unwrap_or(true))
                } else if *a_open && !*b_open {
                    equal_open_to_close(a_fields, b_fields)
                } else if !*a_open && *b_open {
                    equal_open_to_close(b_fields, a_fields)
                } else {
                    // Both closed: must have same keys and values
                    a_fields == b_fields
                }
            }
            _ => false,
        }
    }
}

impl Eq for Type {}

impl Hash for Type {
    fn hash<H: Hasher>(&self, state: &mut H) {
        // Hash based on string representation for simplicity
        self.to_string().hash(state);
    }
}

impl Type {
    /// Create a new list type.
    pub fn list(element: Type) -> Self {
        Type::List(Box::new(element))
    }

    /// Create a new record type.
    pub fn record(fields: HashMap<String, Type>, is_opened: bool) -> Self {
        Type::Record { fields, is_opened }
    }

    /// Create an empty opened record type.
    pub fn opened_record() -> Self {
        Type::Record {
            fields: HashMap::new(),
            is_opened: true,
        }
    }

    /// Check if this is an Any type.
    pub fn is_any(&self) -> bool {
        matches!(self, Type::Any)
    }

    /// Check if this is a List type.
    pub fn is_list(&self) -> bool {
        matches!(self, Type::List(_))
    }

    /// Check if this is a Record type.
    pub fn is_record(&self) -> bool {
        matches!(self, Type::Record { .. })
    }

    /// Get list element type if this is a List.
    pub fn list_element(&self) -> Option<&Type> {
        match self {
            Type::List(e) => Some(e),
            _ => None,
        }
    }

    /// Get record fields if this is a Record.
    pub fn record_fields(&self) -> Option<&HashMap<String, Type>> {
        match self {
            Type::Record { fields, .. } => Some(fields),
            _ => None,
        }
    }

    /// Get mutable record fields if this is a Record.
    pub fn record_fields_mut(&mut self) -> Option<&mut HashMap<String, Type>> {
        match self {
            Type::Record { fields, .. } => Some(fields),
            _ => None,
        }
    }

    /// Check if record is opened.
    pub fn is_opened(&self) -> bool {
        match self {
            Type::Record { is_opened, .. } => *is_opened,
            _ => false,
        }
    }

    /// Get the rank of a type for intersection ordering.
    pub fn rank(&self) -> u8 {
        match self {
            Type::Any => 0,
            Type::Bool => 1,
            Type::Number => 2,
            Type::String => 3,
            Type::Atomic => 4,
            Type::List(_) => 5,
            Type::Record { is_opened, .. } => {
                if *is_opened {
                    6
                } else {
                    7
                }
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::HashSet;

    #[test]
    fn test_type_display() {
        assert_eq!(Type::Any.to_string(), "any");
        assert_eq!(Type::Atomic.to_string(), "atomic");
        assert_eq!(Type::Number.to_string(), "number");
        assert_eq!(Type::String.to_string(), "string");
        assert_eq!(Type::Bool.to_string(), "bool");
        assert_eq!(Type::list(Type::Number).to_string(), "[number]");

        // Record display
        let mut fields = HashMap::new();
        fields.insert("a".to_string(), Type::Number);
        let rec = Type::record(fields, false);
        assert_eq!(rec.to_string(), "{a: number}");
    }

    #[test]
    fn test_type_equality() {
        assert_eq!(Type::Any, Type::Any);
        assert_eq!(Type::Atomic, Type::Atomic);
        assert_eq!(Type::Number, Type::Number);
        assert_eq!(Type::String, Type::String);
        assert_eq!(Type::Bool, Type::Bool);
        assert_ne!(Type::Number, Type::String);
        assert_eq!(Type::list(Type::Number), Type::list(Type::Number));
        assert_ne!(Type::list(Type::Number), Type::list(Type::String));

        // Closed records equality
        let mut f1 = HashMap::new();
        f1.insert("x".to_string(), Type::Number);
        let mut f2 = HashMap::new();
        f2.insert("x".to_string(), Type::Number);
        assert_eq!(Type::record(f1.clone(), false), Type::record(f2, false));

        // Opened vs closed record
        let opened = Type::record(f1.clone(), true);
        let mut closed = HashMap::new();
        closed.insert("x".to_string(), Type::Number);
        closed.insert("y".to_string(), Type::String);
        assert_eq!(opened, Type::record(closed, false));

        // Both opened records
        let mut o1 = HashMap::new();
        o1.insert("x".to_string(), Type::Number);
        let mut o2 = HashMap::new();
        o2.insert("x".to_string(), Type::Number);
        o2.insert("y".to_string(), Type::String);
        assert_eq!(Type::record(o1, true), Type::record(o2, true));

        // Different types across variants
        assert_ne!(Type::Number, Type::list(Type::Number));
        assert_ne!(Type::Number, Type::record(HashMap::new(), false));
    }

    #[test]
    fn test_type_default() {
        let t: Type = Default::default();
        assert!(matches!(t, Type::Any));
    }

    #[test]
    fn test_type_hash() {
        let mut set = HashSet::new();
        set.insert(Type::Number);
        set.insert(Type::String);
        assert!(set.contains(&Type::Number));
        assert!(set.contains(&Type::String));
        assert!(!set.contains(&Type::Bool));
    }

    #[test]
    fn test_type_helpers() {
        assert!(Type::Any.is_any());
        assert!(!Type::Number.is_any());

        assert!(Type::list(Type::Number).is_list());
        assert!(!Type::Number.is_list());

        let rec = Type::record(HashMap::new(), true);
        assert!(rec.is_record());
        assert!(!Type::Number.is_record());

        let list = Type::list(Type::String);
        assert_eq!(list.list_element(), Some(&Type::String));
        assert_eq!(Type::Number.list_element(), None);

        let mut fields = HashMap::new();
        fields.insert("a".to_string(), Type::Number);
        let rec = Type::record(fields.clone(), false);
        assert_eq!(rec.record_fields(), Some(&fields));
        assert_eq!(Type::Number.record_fields(), None);

        assert!(Type::opened_record().is_opened());
        assert!(!Type::record(HashMap::new(), false).is_opened());
        assert!(!Type::Number.is_opened());
    }

    #[test]
    fn test_type_rank() {
        assert_eq!(Type::Any.rank(), 0);
        assert_eq!(Type::Bool.rank(), 1);
        assert_eq!(Type::Number.rank(), 2);
        assert_eq!(Type::String.rank(), 3);
        assert_eq!(Type::Atomic.rank(), 4);
        assert_eq!(Type::list(Type::Any).rank(), 5);
        assert_eq!(Type::opened_record().rank(), 6);
        assert_eq!(Type::record(HashMap::new(), false).rank(), 7);
    }

    #[test]
    fn test_record_fields_mut() {
        let mut rec = Type::record(HashMap::new(), false);
        if let Some(fields) = rec.record_fields_mut() {
            fields.insert("new".to_string(), Type::Bool);
        }
        assert!(rec.record_fields().unwrap().contains_key("new"));

        let mut num = Type::Number;
        assert!(num.record_fields_mut().is_none());
    }
}
