//! Type intersection logic.
//!
//! Ported from Python: type_inference/intersection.py

use super::edge::Bounds;
use super::types::Type;
use std::collections::HashMap;
use std::fmt;

/// Error during type intersection.
#[derive(Debug)]
pub struct TypeInferenceError {
    pub left: Type,
    pub right: Type,
    pub bounds: Bounds,
}

impl TypeInferenceError {
    pub fn new(left: Type, right: Type, bounds: Bounds) -> Self {
        Self { left, right, bounds }
    }
}

impl fmt::Display for TypeInferenceError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "Type mismatch: cannot match {} with {} at ({}, {})",
            self.left, self.right, self.bounds.0, self.bounds.1
        )
    }
}

impl std::error::Error for TypeInferenceError {}

/// Intersect two types, returning the most specific common type.
pub fn intersect(a: Type, b: Type, bounds: Bounds) -> Result<Type, TypeInferenceError> {
    // Order by rank so a has lower or equal rank
    let (a, b) = if a.rank() > b.rank() { (b, a) } else { (a, b) };

    match (&a, &b) {
        // AnyType intersects with anything to give the other type
        (Type::Any, _) => Ok(b),

        // Bool only matches Bool
        (Type::Bool, Type::Bool) => Ok(Type::Bool),
        (Type::Bool, _) => Err(TypeInferenceError::new(a, b, bounds)),

        // Atomic types
        (Type::Atomic, Type::Atomic) => Ok(Type::Atomic),
        (Type::Number, Type::Number) | (Type::Number, Type::Atomic) => Ok(Type::Number),
        (Type::String, Type::String) | (Type::String, Type::Atomic) => Ok(Type::String),
        (Type::Atomic, _) | (Type::Number, _) | (Type::String, _) => {
            Err(TypeInferenceError::new(a, b, bounds))
        }

        // List types
        (Type::List(elem_a), Type::List(elem_b)) => {
            let new_element = intersect(elem_a.as_ref().clone(), elem_b.as_ref().clone(), bounds)?;
            Ok(Type::list(new_element))
        }
        (Type::List(_), _) => Err(TypeInferenceError::new(a, b, bounds)),

        // Record types
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
            if *a_open {
                if *b_open {
                    // Both opened: merge fields, result is opened
                    intersect_friendly_records(a_fields, b_fields, true, bounds)
                } else {
                    // a is opened, b is closed: a's fields must be subset of b's
                    let a_keys: std::collections::HashSet<_> = a_fields.keys().collect();
                    let b_keys: std::collections::HashSet<_> = b_fields.keys().collect();
                    if a_keys.is_subset(&b_keys) {
                        intersect_friendly_records(a_fields, b_fields, false, bounds)
                    } else {
                        Err(TypeInferenceError::new(a.clone(), b.clone(), bounds))
                    }
                }
            } else {
                // a is closed
                if *b_open {
                    // Already handled by rank ordering (opened < closed)
                    // This branch shouldn't be reached due to rank ordering
                    Err(TypeInferenceError::new(a.clone(), b.clone(), bounds))
                } else {
                    // Both closed: must have same keys
                    let a_keys: std::collections::HashSet<_> = a_fields.keys().collect();
                    let b_keys: std::collections::HashSet<_> = b_fields.keys().collect();
                    if a_keys == b_keys {
                        intersect_friendly_records(a_fields, b_fields, false, bounds)
                    } else {
                        Err(TypeInferenceError::new(a.clone(), b.clone(), bounds))
                    }
                }
            }
        }

        // Record with non-Record: error
        (Type::Record { .. }, _) => Err(TypeInferenceError::new(a, b, bounds)),
    }
}

/// Intersect two compatible record types.
fn intersect_friendly_records(
    a_fields: &HashMap<String, Type>,
    b_fields: &HashMap<String, Type>,
    is_opened: bool,
    bounds: Bounds,
) -> Result<Type, TypeInferenceError> {
    let mut result_fields = HashMap::new();

    // Start with b's fields
    for (name, b_type) in b_fields {
        if let Some(a_type) = a_fields.get(name) {
            // Field exists in both: intersect types
            let intersection = intersect(a_type.clone(), b_type.clone(), bounds)?;
            result_fields.insert(name.clone(), intersection);
        } else {
            // Field only in b
            result_fields.insert(name.clone(), b_type.clone());
        }
    }

    // Add a's fields not in b (only matters for opened records)
    if is_opened {
        for (name, a_type) in a_fields {
            if !result_fields.contains_key(name) {
                result_fields.insert(name.clone(), a_type.clone());
            }
        }
    }

    Ok(Type::record(result_fields, is_opened))
}

/// Intersect a list's element type with another element type.
pub fn intersect_list_element(
    list_type: &Type,
    element_type: Type,
    bounds: Bounds,
) -> Result<Type, TypeInferenceError> {
    match list_type {
        Type::List(list_elem) => intersect(list_elem.as_ref().clone(), element_type, bounds),
        _ => Err(TypeInferenceError::new(
            list_type.clone(),
            element_type,
            bounds,
        )),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_type_inference_error_display() {
        let err = TypeInferenceError::new(Type::Number, Type::String, (10, 20));
        let msg = err.to_string();
        assert!(msg.contains("Type mismatch"));
        assert!(msg.contains("number"));
        assert!(msg.contains("string"));
        assert!(msg.contains("10"));
        assert!(msg.contains("20"));
    }

    #[test]
    fn test_intersect_any() {
        let bounds = (0, 0);
        assert_eq!(intersect(Type::Any, Type::Number, bounds).unwrap(), Type::Number);
        assert_eq!(intersect(Type::Number, Type::Any, bounds).unwrap(), Type::Number);
        assert_eq!(intersect(Type::Any, Type::Any, bounds).unwrap(), Type::Any);
    }

    #[test]
    fn test_intersect_bool() {
        let bounds = (0, 0);
        assert_eq!(intersect(Type::Bool, Type::Bool, bounds).unwrap(), Type::Bool);
        assert!(intersect(Type::Bool, Type::Number, bounds).is_err());
        assert!(intersect(Type::Bool, Type::String, bounds).is_err());
        assert!(intersect(Type::Bool, Type::Atomic, bounds).is_err());
    }

    #[test]
    fn test_intersect_atomic() {
        let bounds = (0, 0);
        assert_eq!(intersect(Type::Atomic, Type::Atomic, bounds).unwrap(), Type::Atomic);
        assert_eq!(intersect(Type::Number, Type::Atomic, bounds).unwrap(), Type::Number);
        assert_eq!(intersect(Type::Atomic, Type::Number, bounds).unwrap(), Type::Number);
        assert_eq!(intersect(Type::String, Type::Atomic, bounds).unwrap(), Type::String);
        assert_eq!(intersect(Type::Atomic, Type::String, bounds).unwrap(), Type::String);
    }

    #[test]
    fn test_intersect_number_string() {
        let bounds = (0, 0);
        assert_eq!(intersect(Type::Number, Type::Number, bounds).unwrap(), Type::Number);
        assert_eq!(intersect(Type::String, Type::String, bounds).unwrap(), Type::String);
    }

    #[test]
    fn test_intersect_mismatch() {
        let bounds = (0, 0);
        assert!(intersect(Type::Number, Type::String, bounds).is_err());
        assert!(intersect(Type::Bool, Type::Number, bounds).is_err());
        assert!(intersect(Type::Number, Type::list(Type::Number), bounds).is_err());
        assert!(intersect(Type::Atomic, Type::list(Type::Number), bounds).is_err());
    }

    #[test]
    fn test_intersect_list() {
        let bounds = (0, 0);
        let list_num = Type::list(Type::Number);
        let list_any = Type::list(Type::Any);
        let list_str = Type::list(Type::String);

        assert_eq!(intersect(list_num.clone(), list_any, bounds).unwrap(), list_num);
        assert_eq!(intersect(list_num.clone(), list_num.clone(), bounds).unwrap(), list_num);
        assert!(intersect(list_num, list_str, bounds).is_err());

        // List vs non-list
        assert!(intersect(Type::list(Type::Number), Type::record(HashMap::new(), false), bounds).is_err());
    }

    #[test]
    fn test_intersect_record_both_opened() {
        let bounds = (0, 0);
        let mut f1 = HashMap::new();
        f1.insert("x".to_string(), Type::Number);
        let mut f2 = HashMap::new();
        f2.insert("y".to_string(), Type::String);

        let r1 = Type::record(f1, true);
        let r2 = Type::record(f2, true);
        let result = intersect(r1, r2, bounds).unwrap();

        // Result should be opened with both fields
        assert!(result.is_opened());
        let fields = result.record_fields().unwrap();
        assert!(fields.contains_key("x"));
        assert!(fields.contains_key("y"));
    }

    #[test]
    fn test_intersect_record_opened_closed() {
        let bounds = (0, 0);
        let mut opened_fields = HashMap::new();
        opened_fields.insert("x".to_string(), Type::Number);

        let mut closed_fields = HashMap::new();
        closed_fields.insert("x".to_string(), Type::Number);
        closed_fields.insert("y".to_string(), Type::String);

        let opened = Type::record(opened_fields, true);
        let closed = Type::record(closed_fields, false);

        let result = intersect(opened, closed, bounds).unwrap();
        assert!(!result.is_opened());
        let fields = result.record_fields().unwrap();
        assert_eq!(fields.len(), 2);
    }

    #[test]
    fn test_intersect_record_opened_closed_mismatch() {
        let bounds = (0, 0);
        let mut opened_fields = HashMap::new();
        opened_fields.insert("x".to_string(), Type::Number);
        opened_fields.insert("z".to_string(), Type::Bool); // Not in closed

        let mut closed_fields = HashMap::new();
        closed_fields.insert("x".to_string(), Type::Number);
        closed_fields.insert("y".to_string(), Type::String);

        let opened = Type::record(opened_fields, true);
        let closed = Type::record(closed_fields, false);

        assert!(intersect(opened, closed, bounds).is_err());
    }

    #[test]
    fn test_intersect_record_both_closed() {
        let bounds = (0, 0);
        let mut f1 = HashMap::new();
        f1.insert("x".to_string(), Type::Number);
        let mut f2 = HashMap::new();
        f2.insert("x".to_string(), Type::Number);

        let r1 = Type::record(f1, false);
        let r2 = Type::record(f2, false);
        let result = intersect(r1, r2, bounds).unwrap();
        assert!(!result.is_opened());

        // Different keys should fail
        let mut f3 = HashMap::new();
        f3.insert("y".to_string(), Type::Number);
        let r3 = Type::record(f3, false);
        let mut f4 = HashMap::new();
        f4.insert("x".to_string(), Type::Number);
        let r4 = Type::record(f4, false);
        assert!(intersect(r3, r4, bounds).is_err());
    }

    #[test]
    fn test_intersect_record_with_non_record() {
        let bounds = (0, 0);
        let rec = Type::record(HashMap::new(), false);
        assert!(intersect(rec, Type::Number, bounds).is_err());
    }

    #[test]
    fn test_intersect_list_element() {
        let bounds = (0, 0);
        let list = Type::list(Type::Any);
        let result = intersect_list_element(&list, Type::Number, bounds).unwrap();
        assert_eq!(result, Type::Number);

        // Non-list type should error
        assert!(intersect_list_element(&Type::Number, Type::Number, bounds).is_err());
    }
}
