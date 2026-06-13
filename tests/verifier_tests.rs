//! Verifier negative tests: these files should parse but fail verification.
//!
//! Each fixture in verifier_tests/fixtures/ has a header comment specifying
//! the expected error type. Verification runs on the parse tree and is
//! engine-independent, so there is a single canonical fixture set.

use std::path::PathBuf;

use synalog::parser::parse_file;
use synalog::verifier::{validate, CheckError, SafetyError, RecursionError};

/// Path to the verifier fixtures directory.
fn fixtures_dir() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("tests/verifier_tests/fixtures")
}

/// Expected error type from test file.
#[derive(Debug, Clone, PartialEq)]
enum ExpectedError {
    UnboundHeadVar,
    UnsafeNegation,
    UnsafeAggregation,
    StratificationError,
    ArityMismatch,
    NoBaseCase,
    TrivialLoop,
    UnboundedRecursion,
    ReservedPredicate,
    UnsafeSqlExpr,
}

/// Parse expected error from file content.
fn parse_expected_error(content: &str) -> Option<ExpectedError> {
    for line in content.lines() {
        if line.contains("Expected Error:") {
            let err_str = line.split(':').last()?.trim();
            return match err_str {
                s if s.contains("unboundHeadVar") => Some(ExpectedError::UnboundHeadVar),
                s if s.contains("unsafeNegation") => Some(ExpectedError::UnsafeNegation),
                s if s.contains("unsafeAggregation") => Some(ExpectedError::UnsafeAggregation),
                s if s.contains("StratificationError") => Some(ExpectedError::StratificationError),
                s if s.contains("arityMismatch") => Some(ExpectedError::ArityMismatch),
                s if s.contains("noBaseCase") => Some(ExpectedError::NoBaseCase),
                s if s.contains("trivialLoop") => Some(ExpectedError::TrivialLoop),
                s if s.contains("unboundedRecursion") => Some(ExpectedError::UnboundedRecursion),
                s if s.contains("reservedPredicate") => Some(ExpectedError::ReservedPredicate),
                s if s.contains("unsafeSqlExpr") => Some(ExpectedError::UnsafeSqlExpr),
                _ => None,
            };
        }
    }
    None
}

/// Check if an error matches the expected type.
fn error_matches(error: &CheckError, expected: &ExpectedError) -> bool {
    match (error, expected) {
        (CheckError::Safety(SafetyError::UnboundHeadVar { .. }), ExpectedError::UnboundHeadVar) => true,
        (CheckError::Safety(SafetyError::UnsafeNegation { .. }), ExpectedError::UnsafeNegation) => true,
        (CheckError::Safety(SafetyError::UnsafeAggregation { .. }), ExpectedError::UnsafeAggregation) => true,
        (CheckError::Stratification(_), ExpectedError::StratificationError) => true,
        (CheckError::Arity(_), ExpectedError::ArityMismatch) => true,
        (CheckError::Recursion(RecursionError::NoBaseCase { .. }), ExpectedError::NoBaseCase) => true,
        (CheckError::Recursion(RecursionError::TrivialLoop { .. }), ExpectedError::TrivialLoop) => true,
        (CheckError::Recursion(RecursionError::UnboundedRecursion { .. }), ExpectedError::UnboundedRecursion) => true,
        (CheckError::Reserved(_), ExpectedError::ReservedPredicate) => true,
        (CheckError::SqlExpr(_), ExpectedError::UnsafeSqlExpr) => true,
        _ => false,
    }
}

#[test]
fn verifier_tests() {
    let dir = fixtures_dir();

    if !dir.exists() {
        panic!("verifier_tests/fixtures/ directory not found");
    }

    let mut entries: Vec<_> = std::fs::read_dir(&dir)
        .unwrap()
        .filter_map(|e| e.ok())
        .filter(|e| {
            e.file_name()
                .to_str()
                .map(|s| s.ends_with(".l"))
                .unwrap_or(false)
        })
        .collect();
    entries.sort_by_key(|e| e.file_name());

    let mut passed = 0;
    let mut failed = Vec::new();
    let mut parse_errors = Vec::new();
    let mut missing_expected = Vec::new();

    for entry in &entries {
        let name = entry.file_name();
        let name = name.to_str().unwrap();
        let source = std::fs::read_to_string(entry.path()).unwrap();

        // Parse expected error from header
        let Some(expected) = parse_expected_error(&source) else {
            missing_expected.push(name.to_string());
            continue;
        };

        // Parse the file
        let parsed = match parse_file(&source, None, &[]) {
            Ok(p) => p,
            Err(e) => {
                parse_errors.push((name.to_string(), e.message.clone()));
                continue;
            }
        };

        // Run verifier
        let result = validate(&parsed);

        // Check if expected error was found
        let found_expected = result.errors.iter().any(|e| error_matches(e, &expected));

        if found_expected {
            passed += 1;
        } else {
            let actual_errors: Vec<String> = result.errors.iter().map(|e| format!("{:?}", e)).collect();
            failed.push((name.to_string(), expected.clone(), actual_errors));
        }
    }

    eprintln!(
        "\n[verifier] {}/{} passed, {} failed, {} parse errors, {} missing expected-error header",
        passed,
        passed + failed.len(),
        failed.len(),
        parse_errors.len(),
        missing_expected.len()
    );

    if !failed.is_empty() {
        eprintln!("\nFailed tests:");
        for (name, expected, actual) in &failed {
            eprintln!("  {} - expected {:?}, got: {:?}", name, expected, actual);
        }
    }

    if !parse_errors.is_empty() {
        eprintln!("\nParse errors:");
        for (name, msg) in &parse_errors {
            eprintln!("  {} - {}", name, &msg[..msg.len().min(80)]);
        }
    }

    assert!(
        failed.is_empty() && parse_errors.is_empty() && missing_expected.is_empty(),
        "[verifier] {} failed, {} parse errors, {} missing expected-error header",
        failed.len(),
        parse_errors.len(),
        missing_expected.len()
    );

    assert!(passed >= 20, "[verifier] Expected at least 20 tests, found {}", passed);
}
