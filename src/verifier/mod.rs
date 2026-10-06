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
//! - Ordering (the predicate a file's front matter names has `@OrderBy`)
//! - Front matter (a name and a description)
//! - Functors (each argument a predicate the functor depends on)
//! - Directives (@OrderBy, @Limit, ... about a defined predicate and its columns)
//! - Assertions (`@Assert` statements)

mod vars;
mod safety;
mod stratification;
mod arity;
mod recursion;
mod reserved;
mod sqlexpr;
mod positional;
mod undefined;
mod orderby;
mod front_matter;
mod functors;
mod directives;
mod assertions;
mod contradiction;

pub use vars::VarCollector;
pub use safety::{SafetyError, check_safety};
pub use stratification::{StratificationError, check_stratification};
pub use arity::{ArityError, check_arity};
pub use recursion::{RecursionError, check_recursion, check_unbounded_recursion};
pub use reserved::{ReservedError, check_reserved, reserved_predicate_names};
pub use sqlexpr::{SqlExprError, check_sqlexpr};
pub use positional::{PositionalError, check_positional};
pub use undefined::{UndefinedError, builtin_function_names, check_undefined};
pub use orderby::{OrderByError, check_order_by};
pub use front_matter::{DescriptionError, NameError, check_description, check_name};
pub use functors::{FunctorError, check_functors};
pub use directives::{DirectiveError, check_directives};
pub use assertions::{AssertionError, AssertionReport, AssertionStatus, check_assertions, assertion_check};

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
    Positional(PositionalError),
    Undefined(UndefinedError),
    OrderBy(OrderByError),
    Name(NameError),
    Description(DescriptionError),
    Functor(FunctorError),
    Directive(DirectiveError),
    Assert(AssertionError),
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
            CheckError::Positional(e) => write!(f, "{}", e),
            CheckError::Undefined(e) => write!(f, "{}", e),
            CheckError::OrderBy(e) => write!(f, "{}", e),
            CheckError::Name(e) => write!(f, "{}", e),
            CheckError::Description(e) => write!(f, "{}", e),
            CheckError::Functor(e) => write!(f, "{}", e),
            CheckError::Directive(e) => write!(f, "{}", e),
            CheckError::Assert(e) => write!(f, "{}", e),
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
            CheckError::Positional(pe) => pe.into(),
            CheckError::Undefined(ue) => ue.into(),
            CheckError::OrderBy(oe) => oe.into(),
            CheckError::Name(ne) => ne.into(),
            CheckError::Description(de) => de.into(),
            CheckError::Functor(fe) => fe.into(),
            CheckError::Directive(de) => de.into(),
            CheckError::Assert(se) => se.into(),
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
    /// Every `@Assert` of the program and where it stands.
    pub assertions: Vec<AssertionReport>,
}

impl CheckResult {
    pub fn is_valid(&self) -> bool {
        self.errors.is_empty()
    }

    pub fn merge(&mut self, other: CheckResult) {
        self.errors.extend(other.errors);
        self.warnings.extend(other.warnings);
        self.assertions.extend(other.assertions);
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
    for err in safety::check_safety(&normal_rules) {
        result.errors.push(CheckError::Safety(err));
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
    // ... and SQL text as a table name.
    for err in undefined::check_table_names(&all_rules) {
        result.errors.push(CheckError::SqlExpr(err));
    }

    // Check 8: Positional arguments (Synalog requires named arguments)
    for err in positional::check_positional(&normal_rules) {
        result.errors.push(CheckError::Positional(err));
    }

    // Check 9: Undefined predicate references (typo detection with suggestions)
    // All rules: a functor application (`D := F(...)`, an @Make) defines D.
    for err in undefined::check_undefined(&all_rules) {
        result.errors.push(CheckError::Undefined(err));
    }

    // Check 10: The predicate the front matter names is ordered (@OrderBy)
    if let Some(err) = orderby::check_order_by(parsed, &all_rules) {
        result.errors.push(CheckError::OrderBy(err));
    }

    // Check 11: Front matter names the predicate the file is about
    if let Some(err) = front_matter::check_name(parsed) {
        result.errors.push(CheckError::Name(err));
    }

    // Check 12: Front matter says what its rows are (a description)
    if let Some(err) = front_matter::check_description(parsed) {
        result.errors.push(CheckError::Description(err));
    }

    // Check 13: Functors (each argument a predicate the functor depends on)
    for err in functors::check_functors(&all_rules) {
        result.errors.push(CheckError::Functor(err));
    }

    // Check 14: Directives (@OrderBy, @Limit, ... about what the program defines)
    for err in directives::check_directives(&all_rules) {
        result.errors.push(CheckError::Directive(err));
    }

    // Check 15: Rules whose conditions contradict each other give no row.
    result.warnings.extend(contradiction::check_contradictions(&normal_rules));

    // Check 15: Assertions (@Assert statements)
    let (assertions, spec_errors) = assertions::check_assertions(&all_rules);
    for err in spec_errors {
        result.errors.push(CheckError::Assert(err));
    }
    for assertion in &assertions {
        if assertion.status == AssertionStatus::Unsupported {
            if let Some(reason) = &assertion.detail {
                result.warnings.push(format!(
                    "Assertion '{}.{}' cannot be checked: {}",
                    assertion.predicate, assertion.name, reason
                ));
            }
        }
    }
    result.assertions = assertions;

    result
}
