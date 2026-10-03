// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Unified error handling for synalog.
//!
//! This module provides a consistent error hierarchy across parser, compiler,
//! and verifier components using `thiserror` for error definitions.
//!
//! Each error includes:
//! - A clear description of what went wrong
//! - Help text explaining how to fix the issue
//! - Context about the rule or location where the error occurred
//!
//! # Error Hierarchy
//!
//! ```text
//! SynalogError
//! ├── Parse(ParseError)
//! │   └── Syntax { message, location }
//! ├── Compile(CompileError)
//! │   └── Generic { message, rule }
//! ├── Verify(VerifyError)
//! │   ├── UnboundHeadVar { var, rule }
//! │   ├── UnsafeNegation { var, rule }
//! │   ├── UnsafeAggregation { var, rule }
//! │   ├── NegativeCycle { predicates }
//! │   └── ArityMismatch { predicate, expected, actual }
//! └── Io(std::io::Error)
//! ```
//!
//! # Usage
//!
//! ```ignore
//! use synalog::errors::{Result, ParseError, CompileError};
//!
//! fn parse_and_compile(source: &str) -> Result<String> {
//!     let ast = parse(source)?;
//!     let sql = compile(&ast)?;
//!     Ok(sql)
//! }
//! ```

use thiserror::Error;

/// Result type alias using `anyhow::Error` for flexible error handling.
pub type Result<T> = std::result::Result<T, SynalogError>;

/// Top-level error type encompassing all synalog errors.
#[derive(Error, Debug)]
pub enum SynalogError {
    /// Parsing error.
    #[error(transparent)]
    Parse(#[from] ParseError),

    /// Compilation error.
    #[error(transparent)]
    Compile(#[from] CompileError),

    /// Verification error.
    #[error(transparent)]
    Verify(#[from] VerifyError),

    /// I/O error.
    #[error("I/O error: {0}")]
    Io(#[from] std::io::Error),
}

// ============================================================================
// Parse Errors
// ============================================================================

/// Errors that occur during parsing.
#[derive(Error, Debug, Clone)]
pub enum ParseError {
    /// Syntax error in source code.
    #[error("Syntax error: {message}")]
    Syntax {
        message: String,
        /// Source location context (before, highlighted, after).
        #[source]
        location: Option<SourceLocation>,
    },
}

/// Source location for error reporting.
#[derive(Debug, Clone)]
pub struct SourceLocation {
    /// Text before the error.
    pub before: String,
    /// Highlighted error text.
    pub highlighted: String,
    /// Text after the error.
    pub after: String,
    /// Line number (1-indexed).
    pub line: Option<usize>,
    /// Column number (1-indexed).
    pub column: Option<usize>,
}

impl std::fmt::Display for SourceLocation {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        if let (Some(line), Some(col)) = (self.line, self.column) {
            write!(f, "at line {}, column {}", line, col)
        } else {
            write!(f, "at '{}'", self.highlighted)
        }
    }
}

impl std::error::Error for SourceLocation {}

// ============================================================================
// Compile Errors
// ============================================================================

/// Errors that occur during compilation.
#[derive(Error, Debug, Clone)]
pub enum CompileError {
    /// Generic compilation error with rule context.
    #[error("Compile error: {message}")]
    Generic { message: String, rule: String },
}

// ============================================================================
// Verify Errors
// ============================================================================

/// Errors that occur during verification.
#[derive(Error, Debug, Clone)]
pub enum VerifyError {
    /// Variable in head not bound in body.
    #[error("Unbound variable '{var}' in head of rule: {rule}")]
    UnboundHeadVar { var: String, rule: String },

    /// Variable only appears in negated context.
    #[error("Unsafe negation: variable '{var}' only appears negated in: {rule}")]
    UnsafeNegation { var: String, rule: String },

    /// Variable in aggregation not bound outside.
    #[error("Unsafe aggregation: variable '{var}' not bound outside aggregate in: {rule}")]
    UnsafeAggregation { var: String, rule: String },

    /// Negative recursion cycle detected.
    #[error("Negative recursion cycle: {}", predicates.join(" -> "))]
    NegativeCycle { predicates: Vec<String> },

    /// Recursive predicate has no base case.
    #[error("Recursive predicate '{predicate}' has no base case")]
    NoBaseCase { predicate: String, rule: String },

    /// Trivial infinite loop.
    #[error("Trivial infinite loop: '{predicate}' calls itself with same arguments")]
    TrivialLoop { predicate: String, rule: String },

    /// Recursive predicate without @Recursive bound.
    #[error("Recursive predicate '{predicate}' missing @Recursive annotation")]
    UnboundedRecursion { predicate: String, rule: String },

    /// Predicate called with wrong arity.
    #[error("Arity mismatch for '{predicate}': expected {expected}, got {actual}")]
    ArityMismatch {
        predicate: String,
        expected: usize,
        actual: usize,
    },

    /// Named call references a column the definition does not provide.
    #[error("Unknown column '{column}' for predicate '{predicate}'")]
    UnknownColumn { predicate: String, column: String },

    /// Predicate name collides with a built-in library predicate.
    #[error("Reserved predicate name '{predicate}': it is a built-in library predicate and cannot be redefined")]
    ReservedPredicateName { predicate: String },

    /// Raw-SQL `SqlExpr` escape hatch used in a user rule.
    #[error("Unsafe SqlExpr in rule '{predicate}': raw SQL bypasses verification and portability")]
    UnsafeSqlExpr { predicate: String },

    /// Positional arguments used where named arguments are required.
    #[error("Positional arguments in '{predicate}': Synalog requires named arguments; use `field_name: value` instead of positional arguments")]
    PositionalArguments { predicate: String },

    /// Reference to a predicate that is not defined and is not a built-in.
    #[error("Undefined predicate '{predicate}'{}", match suggestion {
        Some(s) => format!(" — did you mean '{}'?", s),
        None => String::new(),
    })]
    UndefinedPredicate {
        predicate: String,
        suggestion: Option<String>,
        rule: String,
    },

    /// `@Spec` / `@Proof` not shaped as `(Predicate, name: "text", ...)`.
    #[error("Malformed {annotation}: {reason}")]
    MalformedSpecAnnotation {
        annotation: String,
        reason: String,
        rule: String,
    },

    /// `@Spec` statement that does not parse or contradicts the program.
    #[error("Invalid spec '{predicate}.{name}': {reason}")]
    InvalidSpec {
        predicate: String,
        name: String,
        reason: String,
    },

    /// The same spec name stated twice for a predicate.
    #[error("Duplicate spec '{predicate}.{name}': it is stated more than once")]
    DuplicateSpec { predicate: String, name: String },

    /// The same spec name proved twice for a predicate.
    #[error("Duplicate proof of '{predicate}.{name}': it is proved more than once")]
    DuplicateProof { predicate: String, name: String },

    /// `@Proof` naming a spec that no `@Spec` states.
    #[error("Proof of '{predicate}.{name}' has no matching @Spec")]
    OrphanProof { predicate: String, name: String },
}

// ============================================================================
// Verification Result (for multiple errors)
// ============================================================================

/// Result of verification containing potentially multiple errors.
#[derive(Debug, Default)]
pub struct VerifyResult {
    /// List of errors found.
    pub errors: Vec<VerifyError>,
    /// List of warnings.
    pub warnings: Vec<String>,
}

impl VerifyResult {
    /// Create an empty (valid) result.
    pub fn ok() -> Self {
        Self::default()
    }

    /// Check if verification passed.
    pub fn is_valid(&self) -> bool {
        self.errors.is_empty()
    }

    /// Add an error.
    pub fn add_error(&mut self, error: VerifyError) {
        self.errors.push(error);
    }

    /// Add a warning.
    pub fn add_warning(&mut self, warning: impl Into<String>) {
        self.warnings.push(warning.into());
    }

    /// Merge another result into this one.
    pub fn merge(&mut self, other: VerifyResult) {
        self.errors.extend(other.errors);
        self.warnings.extend(other.warnings);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_parse_error_display() {
        let err = ParseError::Syntax {
            message: "unexpected token '}'".to_string(),
            location: None,
        };
        assert!(err.to_string().contains("unexpected token"));
    }

    #[test]
    fn test_compile_error_display() {
        let err = CompileError::Generic {
            message: "boom".to_string(),
            rule: "Test(x) :- Foo(x)".to_string(),
        };
        assert!(err.to_string().contains("boom"));
    }

    #[test]
    fn test_verify_error_display() {
        let err = VerifyError::UnboundHeadVar {
            var: "y".to_string(),
            rule: "Test(x, y) :- Source(x)".to_string(),
        };
        assert!(err.to_string().contains("Unbound variable 'y'"));
    }

    #[test]
    fn test_negative_cycle_display() {
        let err = VerifyError::NegativeCycle {
            predicates: vec!["A".to_string(), "B".to_string(), "C".to_string()],
        };
        assert!(err.to_string().contains("A -> B -> C"));
    }

    #[test]
    fn test_verify_result() {
        let mut result = VerifyResult::ok();
        assert!(result.is_valid());

        result.add_error(VerifyError::UnboundHeadVar {
            var: "x".to_string(),
            rule: "Test(x) :- Source()".to_string(),
        });
        assert!(!result.is_valid());
    }
}
