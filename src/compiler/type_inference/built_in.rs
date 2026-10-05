// Modified from: logica/type_inference/built_in_functions_types.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// Original work: Copyright 2020 Google LLC, licensed under the Apache License, Version 2.0.
// Modifications: Copyright 2025-2026 Yoan Sallami (Synalinks Team), licensed under the Apache License, Version 2.0.

//! Built-in function type restrictions.
//!
//! Ported from Python: type_inference/built_in_functions_types.py

use super::types::Type;

/// Get the type restriction for a built-in predicate field.
pub fn built_in_restrictions(predicate_name: &str, field: &str) -> Option<Type> {
    match (predicate_name, field) {
        // Range
        ("Range", "col0") => Some(Type::Number),
        ("Range", "logica_value") => Some(Type::list(Type::Number)),

        // Num
        ("Num", "col0") => Some(Type::Number),
        ("Num", "logica_value") => Some(Type::Number),

        // Str
        ("Str", "col0") => Some(Type::String),
        ("Str", "logica_value") => Some(Type::String),

        // Addition (+)
        ("+", "left") => Some(Type::Number),
        ("+", "right") => Some(Type::Number),
        ("+", "logica_value") => Some(Type::Number),

        // String concatenation (++)
        ("++", "left") => Some(Type::String),
        ("++", "right") => Some(Type::String),
        ("++", "logica_value") => Some(Type::String),

        // Comparison operators
        ("<", "left") | (">", "left") | ("<=", "left") | (">=", "left") => Some(Type::Atomic),
        ("<", "right") | (">", "right") | ("<=", "right") | (">=", "right") => Some(Type::Atomic),
        ("<", "logica_value")
        | (">", "logica_value")
        | ("<=", "logica_value")
        | (">=", "logica_value") => Some(Type::Bool),

        // Results whose type the function fixes, whatever its arguments: a
        // number's text, for one, is written the same on every engine only
        // when the compiler knows it is a number.
        ("-" | "*" | "/" | "%" | "^" | "Agg+" | "Avg" | "Count" | "Length" | "Size" | "ToInt64"
            | "ToFloat64" | "Abs" | "Round" | "Floor" | "Ceil" | "Sqrt" | "Exp" | "Log" | "Pow",
            "logica_value") => Some(Type::Number),
        ("ToString" | "Upper" | "Lower" | "Substr" | "Format" | "Join" | "StringAgg", "logica_value") => Some(Type::String),
        ("==" | "!=" | "&&" | "||" | "!" | "Like" | "IsNull", "logica_value") => Some(Type::Bool),

        _ => None,
    }
}

/// Check and resolve inequality argument types.
/// Returns the corrected types for left and right operands.
pub fn check_inequalities(
    left_type: &Type,
    right_type: &Type,
) -> Option<(Type, Type)> {
    let is_number = |t: &Type| matches!(t, Type::Number);
    let is_string = |t: &Type| matches!(t, Type::String);
    let is_atomic = |t: &Type| matches!(t, Type::Atomic);

    // Both number or one number one atomic
    if (is_number(left_type) && is_number(right_type))
        || (is_number(left_type) && is_atomic(right_type))
        || (is_atomic(left_type) && is_number(right_type))
    {
        return Some((Type::Number, Type::Number));
    }

    // Both string or one string one atomic
    if (is_string(left_type) && is_string(right_type))
        || (is_string(left_type) && is_atomic(right_type))
        || (is_atomic(left_type) && is_string(right_type))
    {
        return Some((Type::String, Type::String));
    }

    // Both atomic
    if is_atomic(left_type) && is_atomic(right_type) {
        return Some((Type::Atomic, Type::Atomic));
    }

    None
}

/// Predicates that have special type checking requirements.
pub fn is_inequality_predicate(name: &str) -> bool {
    matches!(name, "<" | ">" | "<=" | ">=")
}
