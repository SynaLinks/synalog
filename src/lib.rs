// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Synalog: a Datalog-family logic programming language that compiles to SQL.
//!
//! This crate is the Rust core behind the `synalog` Python package and CLI. It
//! parses Synalog programs ([`parser`]), checks them for common mistakes
//! ([`verifier`]) and compiles any predicate to SQL for one of the supported
//! engines ([`compiler`]): `duckdb` (default), `sqlite`, `psql`, `bigquery`,
//! `presto`, `trino` and `databricks`.
//!
//! # Example
//!
//! ```
//! use std::collections::HashMap;
//! use synalog::compiler::universe::{LogicaProgram, Pagination};
//! use synalog::parser::parse_file;
//! use synalog::verifier::validate;
//!
//! let source = r#"
//!     Parent(parent: "alice", child: "bob");
//!     Parent(parent: "bob", child: "carol");
//!
//!     @Recursive(Ancestor, 20);
//!     Ancestor(ancestor:, descendant:) :- Parent(parent: ancestor, child: descendant);
//!     Ancestor(ancestor:, descendant:) :-
//!         Ancestor(ancestor:, descendant: middle),
//!         Parent(parent: middle, child: descendant);
//! "#;
//!
//! // Parse to the JSON AST shared by the verifier and the compiler.
//! let ast = parse_file(source, None, &[]).expect("syntax error");
//!
//! // Report mistakes (unsafe variables, arity clashes, ...) before compiling.
//! let report = validate(&ast);
//! assert!(report.errors.is_empty(), "{:?}", report.errors);
//!
//! // Compile one predicate; `Some("sqlite")` overrides the program's `@Engine`.
//! let program = LogicaProgram::new_with_engine(&ast, HashMap::new(), HashMap::new(), Some("sqlite"))
//!     .expect("compile error");
//! let sql = program
//!     .formatted_predicate_sql_with_pagination("Ancestor", &Pagination { limit: Some(10), offset: None })
//!     .expect("compile error");
//! assert!(sql.contains("LIMIT 10"), "{sql}");
//! ```
//!
//! # Features
//!
//! The library has no default features. `python` builds the PyO3 extension
//! module (used by maturin for the wheel) and `wasm` the browser playground
//! bindings; `run` adds embedded SQL engines used by the test harness. None of
//! them is needed to parse, verify or compile programs.
//!
//! The Python API and the language are documented at
//! <https://synalinks.github.io/synalog/>.

pub mod errors;
pub mod parser;
pub mod compiler;
pub mod verifier;
pub mod assertion;

#[cfg(feature = "python")]
mod python;

#[cfg(feature = "wasm")]
mod wasm;

// Re-export common error types for convenience
pub use errors::{SynalogError, ParseError, CompileError, VerifyError, Result};
