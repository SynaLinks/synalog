// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! WebAssembly bindings for synalog (wasm-bindgen).
//!
//! Powers the in-browser playground in the docs: the parser, compiler and
//! verifier run entirely client-side, with no database and no network. The
//! surface mirrors `src/python.rs`, minus pagination knobs that the playground
//! does not expose. `import` statements are disabled (empty import root), since
//! there is no filesystem in the browser.

use std::collections::HashMap;

use wasm_bindgen::prelude::*;

use crate::compiler::dialects;
use crate::compiler::universe::{LogicaProgram, Pagination};
use crate::parser::{parse_file, CompilationMode, Json};
use crate::verifier::validate;

fn err(e: impl std::fmt::Display) -> JsValue {
    JsValue::from_str(&e.to_string())
}

/// Normalise the engine argument: an empty string means "use the program's
/// `@Engine` annotation (default: duckdb)". A non-empty value must be one of
/// the supported dialects.
fn engine_arg(engine: &str) -> Result<Option<&str>, JsValue> {
    match engine {
        "" => Ok(None),
        e if dialects::SUPPORTED_ENGINES.contains(&e) => Ok(Some(e)),
        e => Err(err(format!(
            "Unsupported engine '{}'. Supported engines: {}.",
            e,
            dialects::SUPPORTED_ENGINES.join(", ")
        ))),
    }
}

fn parse(source: &str) -> Result<Json, JsValue> {
    parse_file(source, None, &[]).map_err(err)
}

fn build(parsed: &Json, engine: Option<&str>) -> Result<LogicaProgram, JsValue> {
    LogicaProgram::new_with_mode_and_engine(
        parsed,
        HashMap::new(),
        HashMap::new(),
        CompilationMode::Logica,
        engine,
    )
    .map_err(err)
}

/// The SQL dialects the playground can target.
#[wasm_bindgen]
pub fn supported_engines() -> Vec<String> {
    dialects::SUPPORTED_ENGINES
        .iter()
        .map(|s| s.to_string())
        .collect()
}

/// User-defined predicate names of `source`, sorted, excluding dialect library
/// helpers. Drives the playground's predicate picker. `engine` may be empty.
#[wasm_bindgen]
pub fn predicates(source: &str, engine: &str) -> Result<Vec<String>, JsValue> {
    let engine = engine_arg(engine)?;
    let parsed = parse(source)?;
    let program = build(&parsed, engine)?;
    Ok(program.user_defined_predicates())
}

/// Compile a single predicate of `source` to SQL for `engine` (empty = the
/// program's `@Engine`, default duckdb). Errors (syntax or compilation) come
/// back as the rejected promise / thrown string.
#[wasm_bindgen]
pub fn compile(source: &str, predicate: &str, engine: &str) -> Result<String, JsValue> {
    let engine = engine_arg(engine)?;
    let parsed = parse(source)?;
    let program = build(&parsed, engine)?;
    let pagination = Pagination { limit: None, offset: None };
    program
        .formatted_predicate_sql_with_pagination(predicate, &pagination)
        .map_err(err)
}

/// Run the verifier over `source`. Returns the list of verification error
/// messages (empty = the program is valid). Raises on syntax errors.
#[wasm_bindgen]
pub fn check(source: &str, engine: &str) -> Result<Vec<String>, JsValue> {
    engine_arg(engine)?;
    let parsed = parse(source)?;
    let result = validate(&parsed);
    Ok(result.errors.iter().map(|e| e.to_string()).collect())
}
