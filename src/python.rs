//! Python bindings for synalog (PyO3).
//!
//! Exposed as the `_synalog` extension module, wrapped by the `synalog`
//! Python package in `python/synalog/__init__.py`.

use std::collections::HashMap;

use pyo3::exceptions::PyValueError;
use pyo3::prelude::*;

use crate::compiler::dialects;
use crate::compiler::universe::{LogicaProgram, Pagination};
use crate::parser::{parse_file, CompilationMode, Json};
use crate::verifier::validate;

fn map_err<E: std::fmt::Display>(e: E) -> PyErr {
    PyValueError::new_err(e.to_string())
}

fn parse_source(
    source: &str,
    file_name: Option<&str>,
    import_root: Option<Vec<String>>,
) -> PyResult<Json> {
    parse_file(source, file_name, &import_root.unwrap_or_default()).map_err(map_err)
}

/// Validate an optional engine override against the known SQL dialects.
///
/// Produces a clear, self-contained error (not a "Compile error", since this is
/// also reached from the non-compiling `parse`/`check` entry points) listing the
/// supported engines. `None` is always valid: it means "use the source's
/// `@Engine` (defaulting to duckdb)".
fn check_engine(engine: Option<&str>) -> PyResult<()> {
    match engine {
        None => Ok(()),
        Some(engine) if dialects::SUPPORTED_ENGINES.contains(&engine) => Ok(()),
        Some(engine) => Err(PyValueError::new_err(format!(
            "Unsupported engine '{}'. Supported engines: {}.",
            engine,
            dialects::SUPPORTED_ENGINES.join(", ")
        ))),
    }
}

/// Build a program, optionally overriding the engine declared via `@Engine`.
/// When `engine` is `None`, the engine is read from the source (defaulting to
/// `duckdb`), preserving the previous behavior.
fn build_program(parsed: &Json, engine: Option<&str>) -> PyResult<LogicaProgram> {
    LogicaProgram::new_with_mode_and_engine(
        parsed,
        HashMap::new(),
        HashMap::new(),
        CompilationMode::Logica,
        engine,
    )
    .map_err(map_err)
}

/// Parse a Synalog program and return its AST as a JSON string.
///
/// `file_name` is used in error messages. `engine` overrides the program's
/// `@Engine` annotation (default: duckdb). `import_root` lists directories
/// where `import` statements look up `.l` files (default: the current
/// directory). Raises ValueError on syntax errors.
#[pyfunction]
#[pyo3(signature = (source, file_name=None, engine=None, import_root=None))]
fn parse(
    source: &str,
    file_name: Option<&str>,
    engine: Option<&str>,
    import_root: Option<Vec<String>>,
) -> PyResult<String> {
    check_engine(engine)?;
    let parsed = parse_source(source, file_name, import_root)?;
    Ok(parsed.to_string_fmt(true))
}

/// Compile one predicate of a Synalog program to SQL.
///
/// `limit`/`offset` paginate the final result; `limit` is combined with the
/// program's `@Limit` annotation as min(limit, @Limit). `engine` overrides
/// the program's `@Engine` annotation (default: duckdb). `import_root` lists
/// directories where `import` statements look up `.l` files (default: the
/// current directory). Raises ValueError on syntax or compilation errors.
#[pyfunction]
#[pyo3(signature = (source, predicate, limit=None, offset=None, engine=None, import_root=None))]
fn compile(
    source: &str,
    predicate: &str,
    limit: Option<u64>,
    offset: Option<u64>,
    engine: Option<&str>,
    import_root: Option<Vec<String>>,
) -> PyResult<String> {
    check_engine(engine)?;
    let parsed = parse_source(source, None, import_root)?;
    let program = build_program(&parsed, engine)?;
    let pagination = Pagination { limit, offset };
    program
        .formatted_predicate_sql_with_pagination(predicate, &pagination)
        .map_err(map_err)
}

/// Compile every defined predicate to SQL; returns {predicate_name: sql}.
///
/// `engine` overrides the program's `@Engine` annotation (default: duckdb).
/// Raises ValueError on syntax or compilation errors.
#[pyfunction]
#[pyo3(signature = (source, engine=None, import_root=None))]
fn compile_all(
    source: &str,
    engine: Option<&str>,
    import_root: Option<Vec<String>>,
) -> PyResult<HashMap<String, String>> {
    check_engine(engine)?;
    let parsed = parse_source(source, None, import_root)?;
    let program = build_program(&parsed, engine)?;
    let mut out = HashMap::new();
    let pagination = Pagination { limit: None, offset: None };
    for name in program.user_defined_predicates() {
        let sql = program
            .formatted_predicate_sql_with_pagination(&name, &pagination)
            .map_err(map_err)?;
        out.insert(name, sql);
    }
    Ok(out)
}

/// Validate a Synalog program; returns a list of error messages (empty = valid).
///
/// `engine` overrides the program's `@Engine` annotation (default: duckdb).
/// Raises ValueError on syntax errors.
#[pyfunction]
#[pyo3(signature = (source, engine=None, import_root=None))]
fn check(
    source: &str,
    engine: Option<&str>,
    import_root: Option<Vec<String>>,
) -> PyResult<Vec<String>> {
    check_engine(engine)?;
    let parsed = parse_source(source, None, import_root)?;
    let result = validate(&parsed);
    Ok(result.errors.iter().map(|e| e.to_string()).collect())
}

#[pymodule]
fn _synalog(m: &Bound<'_, PyModule>) -> PyResult<()> {
    m.add("SUPPORTED_ENGINES", dialects::SUPPORTED_ENGINES.to_vec())?;
    m.add_function(wrap_pyfunction!(parse, m)?)?;
    m.add_function(wrap_pyfunction!(compile, m)?)?;
    m.add_function(wrap_pyfunction!(compile_all, m)?)?;
    m.add_function(wrap_pyfunction!(check, m)?)?;
    Ok(())
}
