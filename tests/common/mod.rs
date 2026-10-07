//! Shared test utilities for integration tests.
//!
//! This module is compiled into every integration-test binary that does `mod
//! common;`, but each binary uses only the subset of helpers it needs, so the
//! rest read as dead code *in that binary*. That is inherent to the shared
//! `tests/common` pattern, so suppress `dead_code` module-wide rather than
//! per-item.
#![allow(dead_code)]

use std::path::PathBuf;
use std::process::Command;

/// Path to the integration test fixtures directory.
pub fn fixture_dir() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("tests/integration_tests")
}

/// Return import roots needed for a given test file.
pub fn import_roots_for(name: &str) -> Vec<String> {
    let tests_dir = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests")
        .to_str()
        .unwrap()
        .to_string();
    let integ = fixture_dir().to_str().unwrap().to_string();
    let import_tests = fixture_dir()
        .join("import_tests")
        .to_str()
        .unwrap()
        .to_string();

    match name {
        "closure_test" | "reachability_test" => vec![tests_dir.clone()],
        "import_root_test" => vec![import_tests],
        "import_roots_test" => vec![tests_dir.clone(), integ, import_tests],
        "chain_test" => vec![tests_dir.clone()],
        _ => vec![],
    }
}

/// Normalize JSON by re-parsing through serde for consistent formatting.
/// Strips metadata fields that differ between Python and Rust parsers.
/// Sorts rules by predicate name for order-independent comparison.
pub fn normalize_json(s: &str) -> String {
    let mut v: serde_json::Value = serde_json::from_str(s).unwrap_or_else(|e| {
        panic!("Invalid JSON: {}\nInput: {}", e, &s[..s.len().min(200)]);
    });

    // Strip metadata fields that differ between Python and Rust parsers
    strip_parser_metadata(&mut v);

    // Sort rules by predicate name for order-independent comparison
    if let Some(obj) = v.as_object_mut() {
        if let Some(rules) = obj.get_mut("rule") {
            if let Some(arr) = rules.as_array_mut() {
                arr.sort_by(|a, b| {
                    let name_a = a.get("head")
                        .and_then(|h| h.get("predicate_name"))
                        .and_then(|n| n.as_str())
                        .unwrap_or("");
                    let name_b = b.get("head")
                        .and_then(|h| h.get("predicate_name"))
                        .and_then(|n| n.as_str())
                        .unwrap_or("");
                    name_a.cmp(name_b)
                });
            }
        }
    }

    serde_json::to_string_pretty(&v).unwrap()
}

/// Recursively strip parser-specific metadata fields from JSON.
fn strip_parser_metadata(v: &mut serde_json::Value) {
    match v {
        serde_json::Value::Object(obj) => {
            // Remove top-level metadata
            obj.remove("file_name");
            obj.remove("imported_predicates");
            // Synalog's own: the names imported predicates were written with.
            obj.remove("predicate_names");
            obj.remove("predicates_prefix");
            // Remove expression_heritage (source text, differs between parsers)
            obj.remove("expression_heritage");
            // Recursively process all values
            for value in obj.values_mut() {
                strip_parser_metadata(value);
            }
        }
        serde_json::Value::Array(arr) => {
            for item in arr.iter_mut() {
                strip_parser_metadata(item);
            }
        }
        _ => {}
    }
}

/// Strip @Engine annotation from source.
pub fn strip_engine(source: &str) -> String {
    let re = regex::Regex::new(r#"@Engine\([^)]*\)\s*;?\s*"#).unwrap();
    re.replace_all(source, "").to_string()
}

/// `source` targeting `engine`: an `@Engine` line first, after the YAML front
/// matter when the file opens with one (front matter must open the file).
pub fn with_engine(source: &str, engine: &str) -> String {
    let annotation = format!("@Engine(\"{}\");\n", engine);
    let mut lines = source.split_inclusive('\n');
    if lines.next().is_some_and(|first| first.trim_end() == "---") {
        let mut split = source.split_inclusive('\n').next().unwrap().len();
        for line in lines {
            split += line.len();
            if line.trim_end() == "---" {
                return format!("{}{}{}", &source[..split], annotation, &source[split..]);
            }
        }
    }
    format!("{}{}", annotation, source)
}

/// The predicate of the last rule the fixture itself writes: what a fixture
/// tests. A rule is the fixture's when its text (`full_text`, verbatim) is in
/// `source`, not merged in from an imported file; the last one is the one
/// written last. The parser appends rules of its own (a predicate with several
/// aggregating rules becomes `P_MultBodyAggAux` and a `P` rule at the end),
/// carrying the text of the rule they come from: of the rules at the latest
/// position, the last parsed holds the written name. A functor application
/// (`F := G(...)`, an `@Make` rule) defines `F`.
pub fn last_predicate(parsed: &synalog::parser::Json, source: &str) -> Option<String> {
    let mut last = None;
    let mut last_position = 0;
    for rule in parsed.as_object().get("rule")?.as_array() {
        let rule = rule.as_object();
        let Some(head) = rule.get("head") else { continue };
        let head = head.as_object();
        let name = match head.get("call") {
            Some(call) => call.as_object().get("predicate_name").map(|p| p.as_str().to_string()),
            None => head.get("predicate_name").map(|p| p.as_str().to_string()),
        };
        let name = if name.as_deref() == Some("@Make") { made_predicate(head) } else { name };
        let position = rule.get("full_text").and_then(|text| source.find(text.as_str()));
        if let (Some(name), Some(position)) = (name, position) {
            if !name.starts_with('@') && !name.starts_with('_') && position >= last_position {
                last = Some(name);
                last_position = position;
            }
        }
    }
    last
}

/// The predicate an `@Make` head defines: its first argument.
fn made_predicate(head: &synalog::parser::JsonObject) -> Option<String> {
    let first = head.get("record")?.as_object().get("field_value")?.as_array().first()?;
    let value = &first.as_object()["value"];
    let expression = value.as_object().get("expression").unwrap_or(value);
    let literal = expression.as_object().get("literal")?;
    let predicate = literal.as_object().get("the_predicate")?;
    Some(predicate.as_object().get("predicate_name")?.as_str().to_string())
}

/// Execute SQL in SQLite via Python, return sorted rows.
pub fn exec_sqlite(sql: &str) -> Vec<Vec<String>> {
    let script = format!(
        r#"
import sqlite3, json
conn = sqlite3.connect(':memory:')
rows = conn.execute("""{sql}""").fetchall()
result = [[str(c) if c is not None else 'NULL' for c in row] for row in rows]
result.sort()
print(json.dumps(result))
"#,
        sql = sql.replace("\"\"\"", "\\\"\\\"\\\"")
    );
    let output = Command::new("python3")
        .arg("-c")
        .arg(&script)
        .output()
        .expect("python3 failed");
    if !output.status.success() {
        panic!(
            "SQLite execution failed:\nSQL: {}\nError: {}",
            sql,
            String::from_utf8_lossy(&output.stderr)
        );
    }
    let stdout = String::from_utf8(output.stdout).unwrap();
    serde_json::from_str(stdout.trim()).unwrap()
}

/// Execute SQL in DuckDB via Python, return sorted rows.
pub fn exec_duckdb(sql: &str) -> Vec<Vec<String>> {
    let script = format!(
        r#"
import duckdb, json
conn = duckdb.connect(':memory:')
rows = conn.execute("""{sql}""").fetchall()
result = [[str(c) if c is not None else 'NULL' for c in row] for row in rows]
result.sort()
print(json.dumps(result))
"#,
        sql = sql.replace("\"\"\"", "\\\"\\\"\\\"")
    );
    let output = Command::new("python3")
        .arg("-c")
        .arg(&script)
        .output()
        .expect("python3 failed");
    if !output.status.success() {
        panic!(
            "DuckDB execution failed:\nSQL: {}\nError: {}",
            sql,
            String::from_utf8_lossy(&output.stderr)
        );
    }
    let stdout = String::from_utf8(output.stdout).unwrap();
    serde_json::from_str(stdout.trim()).unwrap()
}

/// Assert that actual rows match expected rows.
pub fn assert_rows(actual: &[Vec<String>], expected: &[Vec<&str>]) {
    let expected: Vec<Vec<String>> = expected
        .iter()
        .map(|r| r.iter().map(|s| s.to_string()).collect())
        .collect();
    assert_eq!(actual, &expected, "Row mismatch");
}
