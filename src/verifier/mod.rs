// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Structural validation for Synalog rules.
//!
//! Provides safety and stratification checks:
//! - Variable safety (all head variables bound in body)
//! - Safe negation (negated variables appear positively)
//! - Safe aggregation (aggregated variables bound outside aggregate)
//! - Stratification (no negative recursion cycles)
//! - Arity consistency (predicates used with consistent argument counts)
//! - Recursion safety (base cases, no trivial loops)

mod vars;
mod safety;
mod stratification;
mod arity;
mod recursion;
mod reserved;
mod sqlexpr;

pub use vars::VarCollector;
pub use safety::{SafetyError, check_safety};
pub use stratification::{StratificationError, check_stratification};
pub use arity::{ArityError, check_arity};
pub use recursion::{RecursionError, check_recursion, check_unbounded_recursion};
pub use reserved::{ReservedError, check_reserved, reserved_predicate_names};
pub use sqlexpr::{SqlExprError, check_sqlexpr};

use crate::parser::Json;
use crate::errors::{VerifyError, VerifyResult};

/// All validation errors.
#[derive(Debug, Clone)]
pub enum CheckError {
    Safety(SafetyError),
    Stratification(StratificationError),
    Arity(ArityError),
    Recursion(RecursionError),
    Reserved(ReservedError),
    SqlExpr(SqlExprError),
}

impl std::fmt::Display for CheckError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            CheckError::Safety(e) => write!(f, "{}", e),
            CheckError::Stratification(e) => write!(f, "{}", e),
            CheckError::Arity(e) => write!(f, "{}", e),
            CheckError::Recursion(e) => write!(f, "{}", e),
            CheckError::Reserved(e) => write!(f, "{}", e),
            CheckError::SqlExpr(e) => write!(f, "{}", e),
        }
    }
}

impl std::error::Error for CheckError {}

impl From<CheckError> for VerifyError {
    fn from(e: CheckError) -> Self {
        match e {
            CheckError::Safety(se) => se.into(),
            CheckError::Stratification(se) => se.into(),
            CheckError::Arity(ae) => ae.into(),
            CheckError::Recursion(re) => re.into(),
            CheckError::Reserved(re) => re.into(),
            CheckError::SqlExpr(se) => se.into(),
        }
    }
}

impl From<CheckError> for crate::errors::SynalogError {
    fn from(e: CheckError) -> Self {
        crate::errors::SynalogError::Verify(e.into())
    }
}

/// Validation result containing errors and warnings.
#[derive(Debug, Default)]
pub struct CheckResult {
    pub errors: Vec<CheckError>,
    pub warnings: Vec<String>,
}

impl CheckResult {
    pub fn is_valid(&self) -> bool {
        self.errors.is_empty()
    }

    pub fn merge(&mut self, other: CheckResult) {
        self.errors.extend(other.errors);
        self.warnings.extend(other.warnings);
    }

    /// Convert to the unified VerifyResult type.
    pub fn to_verify_result(self) -> VerifyResult {
        let mut result = VerifyResult::ok();
        for err in self.errors {
            result.add_error(err.into());
        }
        for warn in self.warnings {
            result.add_warning(warn);
        }
        result
    }
}

impl From<CheckResult> for VerifyResult {
    fn from(r: CheckResult) -> Self {
        r.to_verify_result()
    }
}

/// Run all structural validations on parsed rules.
pub fn validate(parsed: &Json) -> CheckResult {
    let mut result = CheckResult::default();

    // Safely extract rules array, return empty result if missing
    let Some(rules_json) = parsed.as_object().get("rule") else {
        return result;
    };
    let rules = rules_json.as_array();

    // All rules including annotations
    let all_rules: Vec<&Json> = rules.iter().collect();

    // Filter out annotation rules for most checks
    let normal_rules: Vec<&Json> = rules
        .iter()
        .filter(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .collect();

    // Check 1: Variable safety for each rule
    for rule in &normal_rules {
        for err in safety::check_rule_safety(rule) {
            result.errors.push(CheckError::Safety(err));
        }
    }

    // Check 2: Stratification (no negative cycles)
    if let Err(e) = stratification::check_stratification(&normal_rules) {
        result.errors.push(CheckError::Stratification(e));
    }

    // Check 3: Arity consistency
    for err in arity::check_arity(&normal_rules) {
        result.errors.push(CheckError::Arity(err));
    }

    // Check 4: Recursion safety (base cases, trivial loops)
    for err in recursion::check_recursion(&normal_rules) {
        result.errors.push(CheckError::Recursion(err));
    }

    // Check 5: Unbounded recursion (needs @Recursive annotations)
    for err in recursion::check_unbounded_recursion(&all_rules, &normal_rules) {
        result.errors.push(CheckError::Recursion(err));
    }

    // Check 6: Reserved predicate names (collisions with the built-in library)
    for err in reserved::check_reserved(&normal_rules) {
        result.errors.push(CheckError::Reserved(err));
    }

    // Check 7: Unsafe raw-SQL SqlExpr escape hatch in user rules
    for err in sqlexpr::check_sqlexpr(&normal_rules) {
        result.errors.push(CheckError::SqlExpr(err));
    }

    result
}
