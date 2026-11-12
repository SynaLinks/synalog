// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

pub mod annotations;
pub mod dialects;
pub mod expr_translate;
pub mod functors;
pub mod home_guard;
pub mod rule_translate;
pub mod type_inference;
pub mod universe;

use std::fmt;

/// The schema synalog stores the tables a program computes in, on every
/// engine (an in-memory database attached under this name on SQLite).
pub fn home_schema() -> &'static str {
    "synalog_home"
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
