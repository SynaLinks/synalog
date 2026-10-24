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
        ("Range", "synalog_value") => Some(Type::list(Type::Number)),

        // Num
        ("Num", "col0") => Some(Type::Number),
        ("Num", "synalog_value") => Some(Type::Number),

        // Str
        ("Str", "col0") => Some(Type::String),
        ("Str", "synalog_value") => Some(Type::String),

        // Addition (+)
        ("+", "left") => Some(Type::Number),
        ("+", "right") => Some(Type::Number),
        ("+", "synalog_value") => Some(Type::Number),

        // String concatenation (++)
        ("++", "left") => Some(Type::String),
        ("++", "right") => Some(Type::String),
        ("++", "synalog_value") => Some(Type::String),

        // Comparison operators
        ("<", "left") | (">", "left") | ("<=", "left") | (">=", "left") => Some(Type::Atomic),
        ("<", "right") | (">", "right") | ("<=", "right") | (">=", "right") => Some(Type::Atomic),
        ("<", "synalog_value")
        | (">", "synalog_value")
        | ("<=", "synalog_value")
        | (">=", "synalog_value") => Some(Type::Bool),

        // Results whose type the function fixes, whatever its arguments: a
        // number's text, for one, is written the same on every engine only
        // when the compiler knows it is a number.
        ("-" | "*" | "/" | "%" | "^" | "Agg+" | "Avg" | "Count" | "Length" | "Size" | "ToInt64"
            | "ToFloat64" | "Abs" | "Round" | "Floor" | "Ceil" | "Sqrt" | "Exp" | "Log" | "Pow",
            "synalog_value") => Some(Type::Number),
        ("ToString" | "Upper" | "Lower" | "Substr" | "Format" | "Join" | "StringAgg", "synalog_value") => Some(Type::String),
        ("==" | "!=" | "&&" | "||" | "!" | "Like" | "IsNull" | "ILike" | "StartsWith" | "EndsWith"
            | "RegexpContains", "synalog_value") => Some(Type::Bool),
        ("Strpos" | "Div" | "Trunc", "synalog_value") => Some(Type::Number),
        ("Lpad" | "Rpad" | "Repeat" | "Replace" | "Trim" | "RegexpExtract" | "RegexpReplace", "synalog_value") => Some(Type::String),

        _ => None,
    }
}

