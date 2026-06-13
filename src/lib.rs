// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

pub mod errors;
pub mod parser;
pub mod compiler;
pub mod verifier;

mod python;

// Re-export common error types for convenience
pub use errors::{SynalogError, ParseError, CompileError, VerifyError, Result};
