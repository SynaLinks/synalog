pub mod annotations;
pub mod concertina;
pub mod dialects;
pub mod expr_translate;
pub mod functors;
pub mod rule_translate;
pub mod program;
pub mod type_inference;
pub mod universe;

use std::fmt;

// Re-export CompilationMode from parser for use in compiler
pub use crate::parser::CompilationMode;

/// Get the schema/database prefix based on compilation mode.
/// - Synalog mode: "synalog_home", "synalog_test"
/// - Logica mode: "logica_home", "logica_test"
pub fn schema_prefix(mode: CompilationMode) -> &'static str {
    match mode {
        CompilationMode::Synalog => "synalog",
        CompilationMode::Logica => "logica",
    }
}

/// Get the "home" schema name based on compilation mode.
pub fn home_schema(mode: CompilationMode) -> &'static str {
    match mode {
        CompilationMode::Synalog => "synalog_home",
        CompilationMode::Logica => "logica_home",
    }
}

/// Get the "test" schema name based on compilation mode.
pub fn test_schema(mode: CompilationMode) -> &'static str {
    match mode {
        CompilationMode::Synalog => "synalog_test",
        CompilationMode::Logica => "logica_test",
    }
}

/// Get the "value" field name based on compilation mode.
pub fn value_field(mode: CompilationMode) -> &'static str {
    match mode {
        CompilationMode::Synalog => "synalog_value",
        CompilationMode::Logica => "logica_value",
    }
}

/// Compilation error with source context (legacy type).
///
/// For new code, prefer using `crate::errors::CompileError`.
#[derive(Debug, Clone)]
pub struct CompileError {
    pub message: String,
    pub rule_text: String,
}

impl CompileError {
    pub fn new(message: impl Into<String>, rule_text: impl Into<String>) -> Self {
        CompileError {
            message: message.into(),
            rule_text: rule_text.into(),
        }
    }

    /// Convert to the unified error type.
    pub fn to_unified(&self) -> crate::errors::CompileError {
        crate::errors::CompileError::Generic {
            message: self.message.clone(),
            rule: self.rule_text.clone(),
        }
    }
}

impl fmt::Display for CompileError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        if self.rule_text.is_empty() {
            write!(f, "Compile error: {}", self.message)
        } else {
            write!(f, "Compile error in rule: {}\n{}", self.rule_text, self.message)
        }
    }
}

impl std::error::Error for CompileError {}

impl From<CompileError> for crate::errors::CompileError {
    fn from(e: CompileError) -> Self {
        e.to_unified()
    }
}

impl From<CompileError> for crate::errors::SynalogError {
    fn from(e: CompileError) -> Self {
        crate::errors::SynalogError::Compile(e.into())
    }
}

pub type CompileResult<T> = Result<T, CompileError>;
