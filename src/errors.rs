// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Unified error handling for synalog.
//!
//! This module provides a consistent error hierarchy across parser, compiler,
//! and verifier components using `thiserror` for error definitions.
//!
//! Each error includes:
//! - A clear description of what went wrong
//! - Help text explaining how to fix the issue
//! - Context about the rule or location where the error occurred
//!
//! # Error Hierarchy
//!
//! ```text
//! SynalogError
//! ├── Parse(ParseError)
//! │   ├── Syntax { message, location }
//! │   ├── Import { path, source }
//! │   └── Io { path, source }
//! ├── Compile(CompileError)
//! │   ├── UnknownPredicate { name, rule }
//! │   ├── TypeMismatch { expected, found, rule }
//! │   ├── InvalidAggregation { message, rule }
//! │   └── Internal { message }
//! └── Verify(VerifyError)
//!     ├── UnboundHeadVar { var, rule }
//!     ├── UnsafeNegation { var, rule }
//!     ├── UnsafeAggregation { var, rule }
//!     ├── NegativeCycle { predicates }
//!     └── ArityMismatch { predicate, expected, actual }
//! ```
//!
//! # Usage
//!
//! ```ignore
//! use synalog::errors::{Result, ParseError, CompileError};
//!
//! fn parse_and_compile(source: &str) -> Result<String> {
//!     let ast = parse(source)?;
//!     let sql = compile(&ast)?;
//!     Ok(sql)
//! }
//! ```

use std::path::PathBuf;
use thiserror::Error;

/// Trait for errors that provide help messages.
pub trait ErrorHelp {
    /// Returns a help message explaining how to fix the error.
    fn help(&self) -> String;

    /// Returns the full error message with help.
    fn with_help(&self) -> String
    where
        Self: std::fmt::Display,
    {
        format!("{}\n\nHelp: {}", self, self.help())
    }
}

/// Result type alias using `anyhow::Error` for flexible error handling.
pub type Result<T> = std::result::Result<T, SynalogError>;

/// Top-level error type encompassing all synalog errors.
#[derive(Error, Debug)]
pub enum SynalogError {
    /// Parsing error.
    #[error(transparent)]
    Parse(#[from] ParseError),

    /// Compilation error.
    #[error(transparent)]
    Compile(#[from] CompileError),

    /// Verification error.
    #[error(transparent)]
    Verify(#[from] VerifyError),

    /// I/O error.
    #[error("I/O error: {0}")]
    Io(#[from] std::io::Error),

    /// Generic error with context.
    #[error("{0}")]
    Other(String),
}

impl SynalogError {
    /// Create a generic error from a string.
    pub fn other(msg: impl Into<String>) -> Self {
        SynalogError::Other(msg.into())
    }
}

impl ErrorHelp for SynalogError {
    fn help(&self) -> String {
        match self {
            SynalogError::Parse(e) => e.help(),
            SynalogError::Compile(e) => e.help(),
            SynalogError::Verify(e) => e.help(),
            SynalogError::Io(e) => {
                format!(
                    r#"I/O error: {e}

## Checklist

- [ ] The file path is correct
- [ ] You have read/write permissions
- [ ] The disk is not full"#,
                    e = e
                )
            }
            SynalogError::Other(msg) => msg.clone(),
        }
    }
}

// ============================================================================
// Parse Errors
// ============================================================================

/// Errors that occur during parsing.
#[derive(Error, Debug, Clone)]
pub enum ParseError {
    /// Syntax error in source code.
    #[error("Syntax error: {message}")]
    Syntax {
        message: String,
        /// Source location context (before, highlighted, after).
        #[source]
        location: Option<SourceLocation>,
    },

    /// Failed to resolve import.
    #[error("Import error: cannot find '{path}'")]
    Import {
        path: String,
        #[source]
        source: Option<Box<ParseError>>,
    },

    /// File I/O error during parsing.
    #[error("Cannot read '{path}': {reason}")]
    FileRead { path: PathBuf, reason: String },

    /// Invalid syntax mode.
    #[error("Invalid syntax: {message}")]
    InvalidSyntax { message: String },
}

impl ErrorHelp for ParseError {
    fn help(&self) -> String {
        match self {
            ParseError::Syntax { message, .. } => {
                if message.contains("positional arguments") {
                    r#"Synalog requires **named arguments**.

## How To Fix

Change `Predicate(value)` to `Predicate(field_name: value)`.

```synalog
# WRONG
Person("Alice", 30);

# CORRECT
Person(name: "Alice", age: 30);
```"#.to_string()
                } else if message.contains("unexpected") || message.contains("expected") {
                    r#"## Common Syntax Issues

- **Missing semicolon:** Each rule must end with `;`
- **Unmatched brackets:** Ensure all `(`, `[`, `{` have matching closers
- **Typos:** Check predicate names and operators

```synalog
# WRONG: missing semicolon
Test(x) :- Source(x)

# CORRECT
Test(x) :- Source(x);
```"#.to_string()
                } else if message.contains("unterminated string") {
                    r#"String literals must be closed with matching quotes.

## How To Fix

Check for missing closing quote.

```synalog
# WRONG
Name(x: "Alice);

# CORRECT
Name(x: "Alice");
```"#.to_string()
                } else {
                    r#"## Common Syntax Issues

Review the syntax around the indicated location:
- Missing semicolons at end of rules
- Unmatched brackets `()`, `[]`, `{}`
- Invalid operators
- Typos in predicate names"#.to_string()
                }
            }
            ParseError::Import { path, .. } => {
                format!(
                    r#"The import `{path}` could not be found.

## How To Fix

1. Check the file path is correct and the file exists
2. Specify import roots with `--roots` flag
3. Ensure the import path is relative to one of the import roots

```bash
synalog compile file.l --roots /path/to/imports
```"#,
                    path = path
                )
            }
            ParseError::FileRead { path, .. } => {
                format!(
                    r#"Cannot read file `{path}`.

## How To Fix

1. Verify the file exists at the specified path
2. Check you have read permissions for the file
3. Use an absolute path if unsure

```bash
ls -la {path}
```"#,
                    path = path.display()
                )
            }
            ParseError::InvalidSyntax { message } => {
                format!(
                    r#"Invalid syntax: {message}

## Synalog Syntax Reference

```synalog
# Rules: Head :- Body
Result(x, y) :- Source(x, y);

# Facts: Predicate with values
Person(name: "Alice", age: 30);

# Named arguments
Table(field1: value1, field2: value2);

# Aggregation
Total(sum? += amount) distinct :- Sales(amount:);
```"#,
                    message = message
                )
            }
        }
    }
}

impl ParseError {
    /// Create a syntax error with location context.
    pub fn syntax(message: impl Into<String>, location: Option<SourceLocation>) -> Self {
        ParseError::Syntax {
            message: message.into(),
            location,
        }
    }

    /// Create a syntax error without location.
    pub fn syntax_simple(message: impl Into<String>) -> Self {
        ParseError::Syntax {
            message: message.into(),
            location: None,
        }
    }

    /// Format error with source context for display.
    pub fn show_with_context(&self) -> String {
        match self {
            ParseError::Syntax { message, location } => {
                if let Some(loc) = location {
                    format!(
                        "Parsing:\n{}{}{}\n\n[ Error ] {}\n",
                        loc.before, loc.highlighted, loc.after, message
                    )
                } else {
                    format!("[ Error ] {}", message)
                }
            }
            other => format!("{}", other),
        }
    }
}

/// Source location for error reporting.
#[derive(Debug, Clone)]
pub struct SourceLocation {
    /// Text before the error.
    pub before: String,
    /// Highlighted error text.
    pub highlighted: String,
    /// Text after the error.
    pub after: String,
    /// Line number (1-indexed).
    pub line: Option<usize>,
    /// Column number (1-indexed).
    pub column: Option<usize>,
}

impl std::fmt::Display for SourceLocation {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        if let (Some(line), Some(col)) = (self.line, self.column) {
            write!(f, "at line {}, column {}", line, col)
        } else {
            write!(f, "at '{}'", self.highlighted)
        }
    }
}

impl std::error::Error for SourceLocation {}

// ============================================================================
// Compile Errors
// ============================================================================

/// Errors that occur during compilation.
#[derive(Error, Debug, Clone)]
pub enum CompileError {
    /// Reference to unknown predicate.
    #[error("Unknown predicate '{name}' in rule: {rule}")]
    UnknownPredicate { name: String, rule: String },

    /// Type mismatch in expression.
    #[error("Type mismatch: expected {expected}, found {found} in rule: {rule}")]
    TypeMismatch {
        expected: String,
        found: String,
        rule: String,
    },

    /// Invalid aggregation usage.
    #[error("Invalid aggregation: {message} in rule: {rule}")]
    InvalidAggregation { message: String, rule: String },

    /// Unsupported feature for target SQL dialect.
    #[error("Unsupported feature for {dialect}: {feature}")]
    UnsupportedDialect { dialect: String, feature: String },

    /// Recursive predicate without proper handling.
    #[error("Invalid recursion in predicate '{predicate}': {reason}")]
    InvalidRecursion { predicate: String, reason: String },

    /// Internal compiler error (bug).
    #[error("Internal compiler error: {message}")]
    Internal { message: String },

    /// Generic compilation error with rule context.
    #[error("Compile error: {message}")]
    Generic { message: String, rule: String },
}

impl ErrorHelp for CompileError {
    fn help(&self) -> String {
        match self {
            CompileError::UnknownPredicate { name, .. } => {
                format!(
                    r#"The predicate `{name}` is used but not defined.

## How To Fix

1. **Define the predicate:**
   ```synalog
   {name}(args) :- ...;
   ```

2. **Or import it from another file:**
   ```synalog
   import 'path/to/file.l';
   ```

3. **Or check for typos** in the predicate name

> **Note:** Predicate names are case-sensitive."#,
                    name = name
                )
            }
            CompileError::TypeMismatch { expected, found, .. } => {
                format!(
                    r#"Type mismatch: expected `{expected}` but found `{found}`.

## How To Fix

1. Ensure the expression produces the correct type
2. Use explicit type conversion if needed:
   ```synalog
   Cast(expr, "{expected}")
   ```
3. Check that variables are bound to values of the expected type"#,
                    expected = expected,
                    found = found
                )
            }
            CompileError::InvalidAggregation { message, .. } => {
                format!(
                    r#"Invalid aggregation: {message}

## Common Issues

1. Aggregation variable must be bound by a predicate in the same rule
2. Cannot aggregate over variables that appear in the head
3. Use grouping variables in the head to group results

## Aggregation Functions

| Function | Syntax |
|----------|--------|
| Sum | `total? += value` |
| Count | `count? += 1` |
| Min | `min? Min= value` |
| Max | `max? Max= value` |
| List | `list? List= value` |"#,
                    message = message
                )
            }
            CompileError::UnsupportedDialect { dialect, feature } => {
                let engines = crate::compiler::dialects::SUPPORTED_ENGINES
                    .iter()
                    .map(|e| format!("`{}`", e))
                    .collect::<Vec<_>>()
                    .join(", ");
                format!(
                    r#"The feature `{feature}` is not supported in **{dialect}** SQL dialect.

## Options

1. Use a different SQL dialect that supports this feature
2. Rewrite the logic to avoid this feature
3. Check the dialect documentation for alternatives

## Supported Dialects

{engines}"#,
                    feature = feature,
                    dialect = dialect,
                    engines = engines
                )
            }
            CompileError::InvalidRecursion { predicate, reason } => {
                format!(
                    r#"Invalid recursion in `{predicate}`: {reason}

## How To Fix

1. Ensure recursive rules have a **base case** (non-recursive rule)
2. Recursion must be **linear** (predicate appears once in body)
3. Avoid mutual recursion through negation
4. Check that the recursion terminates

## Example Valid Recursion

```synalog
# Base case
Ancestor(x, y) :- Parent(x, y);

# Recursive case
Ancestor(x, z) :- Parent(x, y), Ancestor(y, z);
```"#,
                    predicate = predicate,
                    reason = reason
                )
            }
            CompileError::Internal { message } => {
                format!(
                    r#"Internal compiler error: {message}

This is likely a **bug in the compiler**.

## Please Report This Issue

Include:
1. The full error message
2. The input Synalog code that triggered the error
3. The command you ran

**Report at:** https://github.com/anthropics/synalog/issues"#,
                    message = message
                )
            }
            CompileError::Generic { message, rule } => {
                format!(
                    r#"Compilation error in rule `{rule}`: {message}

## Review Checklist

- [ ] All predicates used in the body are defined
- [ ] All variables in the head appear in the body
- [ ] The rule follows Synalog syntax rules"#,
                    rule = rule,
                    message = message
                )
            }
        }
    }
}

impl CompileError {
    /// Create a generic compile error.
    pub fn generic(message: impl Into<String>, rule: impl Into<String>) -> Self {
        CompileError::Generic {
            message: message.into(),
            rule: rule.into(),
        }
    }

    /// Create an internal error (for bugs).
    pub fn internal(message: impl Into<String>) -> Self {
        CompileError::Internal {
            message: message.into(),
        }
    }

    /// Get the rule text if available.
    pub fn rule_text(&self) -> Option<&str> {
        match self {
            CompileError::UnknownPredicate { rule, .. } => Some(rule),
            CompileError::TypeMismatch { rule, .. } => Some(rule),
            CompileError::InvalidAggregation { rule, .. } => Some(rule),
            CompileError::InvalidRecursion { .. } => None,
            CompileError::UnsupportedDialect { .. } => None,
            CompileError::Internal { .. } => None,
            CompileError::Generic { rule, .. } => Some(rule),
        }
    }
}

// ============================================================================
// Verify Errors
// ============================================================================

/// Errors that occur during verification.
#[derive(Error, Debug, Clone)]
pub enum VerifyError {
    /// Variable in head not bound in body.
    #[error("Unbound variable '{var}' in head of rule: {rule}")]
    UnboundHeadVar { var: String, rule: String },

    /// Variable only appears in negated context.
    #[error("Unsafe negation: variable '{var}' only appears negated in: {rule}")]
    UnsafeNegation { var: String, rule: String },

    /// Variable in aggregation not bound outside.
    #[error("Unsafe aggregation: variable '{var}' not bound outside aggregate in: {rule}")]
    UnsafeAggregation { var: String, rule: String },

    /// Negative recursion cycle detected.
    #[error("Negative recursion cycle: {}", predicates.join(" -> "))]
    NegativeCycle { predicates: Vec<String> },

    /// Recursive predicate has no base case.
    #[error("Recursive predicate '{predicate}' has no base case")]
    NoBaseCase { predicate: String, rule: String },

    /// Trivial infinite loop.
    #[error("Trivial infinite loop: '{predicate}' calls itself with same arguments")]
    TrivialLoop { predicate: String, rule: String },

    /// Recursive predicate without @Recursive bound.
    #[error("Recursive predicate '{predicate}' missing @Recursive annotation")]
    UnboundedRecursion { predicate: String, rule: String },

    /// Predicate called with wrong arity.
    #[error("Arity mismatch for '{predicate}': expected {expected}, got {actual}")]
    ArityMismatch {
        predicate: String,
        expected: usize,
        actual: usize,
    },

    /// Named call references a column the definition does not provide.
    #[error("Unknown column '{column}' for predicate '{predicate}'")]
    UnknownColumn { predicate: String, column: String },

    /// Mode error (input variable not bound).
    #[error("Unbound input variable '{var}' for predicate '{predicate}' in: {rule}")]
    UnboundInput {
        var: String,
        predicate: String,
        rule: String,
    },

    /// Potential SQL injection.
    #[error("Unsafe literal '{literal}' in: {rule}")]
    UnsafeLiteral { literal: String, rule: String },

    /// Invalid predicate name.
    #[error("Invalid predicate name: {name}")]
    InvalidPredicateName { name: String },

    /// Predicate name collides with a built-in library predicate.
    #[error("Reserved predicate name '{predicate}': it is a built-in library predicate and cannot be redefined")]
    ReservedPredicateName { predicate: String },

    /// Raw-SQL `SqlExpr` escape hatch used in a user rule.
    #[error("Unsafe SqlExpr in rule '{predicate}': raw SQL bypasses verification and portability")]
    UnsafeSqlExpr { predicate: String },

    /// Positional arguments used where named arguments are required.
    #[error("Positional arguments in '{predicate}': Synalog requires named arguments — use `field_name: value` instead of positional arguments")]
    PositionalArguments { predicate: String },

    /// Multiple verification errors.
    #[error("Verification failed with {} error(s)", .0.len())]
    Multiple(Vec<VerifyError>),
}

impl ErrorHelp for VerifyError {
    fn help(&self) -> String {
        match self {
            VerifyError::UnboundHeadVar { var, rule } => {
                format!(
                    r#"Variable `{var}` appears in the head but is not bound in the body.

## Why This Is An Error

In Synalog, every variable in the head (output) must get its value from somewhere in the body. This is called **range restriction** and ensures queries produce finite results.

## How To Fix

The variable `{var}` needs to appear in a **positive context** in the body.

Variables are bound by:
- Appearing in a predicate: `Table({var}: ...)`
- Using `in` with a range: `{var} in Range(10)`
- Assignment: `{var} == <expression using other bound variables>`

> **Note:** Variables in comparisons (`>`, `<`, `==`) or negations (`~`) are NOT bound by those.

## Examples

```synalog
# WRONG: y is in head but not bound in body
{rule}

# FIXED Option 1: Bind y from another predicate
Test(x, y) :- Source(x), OtherTable(x, y);

# FIXED Option 2: Compute y from x
Test(x, y) :- Source(x), y == x * 2;

# FIXED Option 3: Remove y if not needed
Test(x) :- Source(x);
```"#,
                    var = var,
                    rule = rule
                )
            }
            VerifyError::UnsafeNegation { var, rule } => {
                format!(
                    r#"Variable `{var}` appears inside a negation (`~`) but is not bound by a positive predicate.

## Why This Is An Error

Negation in Synalog means "there is no row matching this pattern". To check that something doesn't exist, we must first know what values we're checking.

The rule `{rule}` uses `~Predicate(..., {var}, ...)` but `{var}` has no value yet.

## How To Fix

Bind `{var}` with a positive predicate **before** the negation.

## Examples

```synalog
# WRONG: x only appears in negation, we don't know what x values to check
NotInB(x) :- ~B(x);

# FIXED: First get x from A, then check it's not in B
NotInB(x) :- A(x), ~B(x);
# Reads as: "x is in A AND x is not in B"

# WRONG: y inside negation is not bound
Test(x) :- Source(x), ~Other(x, y);

# FIXED: Either bind y first, or use existential pattern
Test(x) :- Source(x), y in Range(10), ~Other(x, y);

# Or if checking "no Other exists for any y":
Test(x) :- Source(x), ~Exists(x);
Exists(x) :- Other(x, _);
```"#,
                    var = var,
                    rule = rule
                )
            }
            VerifyError::UnsafeAggregation { var, rule } => {
                format!(
                    r#"Variable `{var}` is used inside an aggregation but not bound by a predicate.

## Why This Is An Error

Aggregations like `Sum`, `Count`, `Min`, `Max` iterate over values. The variable being aggregated must come from a predicate so we know what values to aggregate.

The rule `{rule}` aggregates over `{var}` but `{var}` is not bound.

## How To Fix

Add a predicate that provides values for `{var}`.

## Synalog Aggregation Syntax

```synalog
# Sum: total? += value
TotalSales(total? += amount) distinct :- Sales(amount:);

# Count: count? += 1
CountItems(count? += 1) distinct :- Items(_);

# Min/Max: result? Min= value or result? Max= value
MinPrice(min? Min= price) distinct :- Products(price:);

# Grouped aggregation
SalesByProduct(product:, total? += amount) distinct :-
  Sales(product:, amount:);
```

## Example Fix

```synalog
# WRONG: y is aggregated but not bound
Test(x, total) :- Numbers(x), total == Sum(y);

# FIXED: Bind y from a predicate
Test(x, total? += y) distinct :- Numbers(x), Values(x, y);
```"#,
                    var = var,
                    rule = rule
                )
            }
            VerifyError::NegativeCycle { predicates } => {
                let cycle_str = predicates.join(" -> ~");
                format!(
                    r#"Negative recursion cycle detected: `~{cycle_str}`

## Why This Is An Error

The predicates form a cycle through negation, creating a **logical paradox**. This makes it impossible to determine a consistent truth value.

### Example of the paradox:

```synalog
P(x) :- Base(x), ~Q(x);   -- P is true when Q is false
Q(x) :- Base(x), ~P(x);   -- Q is true when P is false
```

If P is true, then Q must be false, but then P must be false... **contradiction!**

## How To Fix

Break the negative cycle by:
1. Define one predicate independently (without negating the other)
2. Use a different logical structure

## Examples

```synalog
# WRONG: P and Q negatively depend on each other
P(x) :- Base(x), ~Q(x);
Q(x) :- Base(x), ~P(x);

# FIXED: Define P with a condition, Q as "not P"
P(x) :- Base(x), Condition(x);
Q(x) :- Base(x), ~P(x);

# OR: Use disjoint conditions
P(x) :- Base(x), x % 2 == 0;  # even numbers
Q(x) :- Base(x), x % 2 == 1;  # odd numbers
```"#,
                    cycle_str = cycle_str
                )
            }
            VerifyError::NoBaseCase { predicate, rule } => {
                format!(
                    r#"Recursive predicate `{predicate}` has no base case.

## Why This Is An Error

Recursive predicates need at least one non-recursive rule (base case) to terminate.
Without a base case, the recursion has no way to stop.

**Rule:** `{rule}`

## How To Fix

Add a non-recursive rule that defines the starting point.

## Examples

```synalog
# WRONG: No base case - infinite recursion
Ancestor(x:, y:) :- Ancestor(x:, z:), Parent(z:, y:);

# FIXED: Add a base case
Ancestor(x:, y:) :- Parent(x:, y:);  # Base case
Ancestor(x:, y:) :- Ancestor(x:, z:), Parent(z:, y:);  # Recursive case
```

## Common Pattern

```synalog
# Base case: direct relationship
Reachable(from:, to:) :- Edge(from:, to:);

# Recursive case: extend the path
Reachable(from:, to:) :- Reachable(from:, mid:), Edge(mid:, to:);
```"#,
                    predicate = predicate,
                    rule = rule
                )
            }
            VerifyError::TrivialLoop { predicate, rule } => {
                format!(
                    r#"Trivial infinite loop: `{predicate}` calls itself with identical arguments.

## Why This Is An Error

The rule `{predicate}(x) :- {predicate}(x)` creates an infinite loop because:
- To compute `{predicate}(x)`, we need `{predicate}(x)`
- This never terminates

**Rule:** `{rule}`

## How To Fix

The recursive call must use **different arguments** that progress toward a base case.

## Examples

```synalog
# WRONG: Same arguments - infinite loop
Count(n:) :- Count(n:);

# FIXED: Arguments change (progress toward base case)
Count(n:) :- n == 0;  # Base case
Count(n:) :- Count(m:), m == n - 1, n > 0;  # n decreases each step
```"#,
                    predicate = predicate,
                    rule = rule
                )
            }
            VerifyError::UnboundedRecursion { predicate, rule } => {
                format!(
                    r#"Recursive predicate `{predicate}` is missing `@Recursive` annotation.

## Why This Is An Error

Recursive predicates can run indefinitely without a bound. The `@Recursive` annotation
limits the number of iterations, preventing infinite loops at runtime.

**Rule:** `{rule}`

## How To Fix

Add a `@Recursive` annotation specifying the predicate and iteration limit:

```synalog
@Recursive({predicate}, 100);  # Limit to 100 iterations
```

## Example

```synalog
# Define the recursion bound
@Recursive(Reachable, 10);

# Base case
Reachable(from:, to:) :- Edge(from:, to:);

# Recursive case (will run at most 10 iterations)
Reachable(from:, to:) :- Reachable(from:, mid:), Edge(mid:, to:);
```

## Choosing the Limit

- Use a limit that covers your expected maximum depth
- For graph traversal: diameter of the graph
- For hierarchies: maximum depth of the tree
- When unsure, start with 10-100 and adjust as needed"#,
                    predicate = predicate,
                    rule = rule
                )
            }
            VerifyError::ArityMismatch { predicate, expected, actual } => {
                format!(
                    r#"Predicate `{predicate}` called with **{actual}** argument(s) but defined with **{expected}**.

## Why This Is An Error

Each predicate has a fixed number of fields. All uses must be consistent.

## How To Fix

Check how `{predicate}` is defined elsewhere and use the same number of arguments.

## Examples

```synalog
# If Person is defined with 2 fields:
Person(name: "Alice", age: 30);
Person(name: "Bob", age: 25);

# WRONG: using 3 fields
Result(n) :- Person(name: n, age: a, city: c);

# FIXED: use 2 fields
Result(n) :- Person(name: n, age: _);
```

## Common Causes

- Typo in predicate name (using wrong predicate)
- Forgetting a field or adding an extra one
- Different definitions of the same predicate in different places"#,
                    predicate = predicate,
                    expected = expected,
                    actual = actual
                )
            }
            VerifyError::UnknownColumn { predicate, column } => {
                format!(
                    r#"Predicate `{predicate}` has no column named `{column}`.

## Why This Is An Error

Named arguments must reference columns the predicate actually provides. Referencing a **subset** of the columns is fine; referencing a column that does not exist is not.

## How To Fix

Check how `{predicate}` is defined and use one of its column names.

## Examples

```synalog
# If Person is defined with columns name and age:
Person(name: "Alice", age: 30);

# WRONG: 'city' is not a column of Person
Result(c) :- Person(city: c);

# FIXED: reference existing columns (any subset works)
Result(n) :- Person(name: n);
```

## Common Causes

- Typo in the column name
- Confusing column order: `Pred(column_name: variable)` — LEFT is the column, RIGHT is your variable
- The column exists in the underlying table but was not included in the concept definition"#,
                    predicate = predicate,
                    column = column
                )
            }
            VerifyError::UnboundInput { var, predicate, rule } => {
                format!(
                    r#"Variable `{var}` used as input to `{predicate}` but not yet bound.

## Why This Is An Error

Some predicates require certain arguments to have known values before calling. Variable `{var}` is used in `{predicate}` before it gets a value.

**Rule:** `{rule}`

## How To Fix

Reorder the predicates so `{var}` is bound first, or bind it with another predicate.

## Example

```synalog
# WRONG: lookup_key not bound when calling Lookup
Result(value) :- Lookup(key: lookup_key, value:);

# FIXED: get lookup_key from Keys first
Result(value) :- Keys(lookup_key), Lookup(key: lookup_key, value:);
```"#,
                    var = var,
                    predicate = predicate,
                    rule = rule
                )
            }
            VerifyError::UnsafeLiteral { literal, rule } => {
                format!(
                    r#"Potentially unsafe string literal detected: `{literal}`

## Why This Is An Error

The literal contains characters that could cause issues when compiled to SQL, potentially allowing **SQL injection attacks**.

**Rule:** `{rule}`

## How To Fix

- Remove or escape special characters (quotes, semicolons, etc.)
- Avoid string concatenation with user input
- Use parameterized queries for dynamic values

## Problematic Patterns

```
"'; DROP TABLE users; --"  # SQL injection
"value'); DELETE FROM"     # injection attempt
```

## Safe Patterns

```
"simple_string"
"user_name_123"
```"#,
                    literal = literal,
                    rule = rule
                )
            }
            VerifyError::InvalidPredicateName { name } => {
                format!(
                    r#"Invalid predicate name: `{name}`

## Why This Is An Error

Predicate names must be valid identifiers.

## Rules For Predicate Names

- Must start with a letter (`A-Z`, `a-z`) or `@`
- Can contain letters, numbers, underscores
- `@` prefix is for annotations: `@Engine`, `@OrderBy`
- Names are case-sensitive: `Person` != `person`

## Valid Examples

```
Person, UserAccount, item_123, @Engine
```

## Invalid Examples

```
123User      # starts with number
user-name    # contains hyphen
my.predicate # contains dot
```"#,
                    name = name
                )
            }
            VerifyError::ReservedPredicateName { predicate } => {
                format!(
                    r#"Reserved predicate name: `{predicate}`

## Why This Is An Error

`{predicate}` is part of Synalog's built-in library (e.g. `Num`, `Str`,
`ArgMin`, `ArgMax`, `Today`, `Now`, ...). The library definition is injected
into every compiled program, so redefining it collides with the built-in and
compilation fails with a confusing error.

## How To Fix

Rename your predicate. Built-in library predicates can be *used* freely; they
just cannot be *redefined*.

```synalog
# WRONG
{predicate}(value: 1);

# FIXED
My{predicate}(value: 1);
```"#,
                    predicate = predicate
                )
            }
            VerifyError::UnsafeSqlExpr { predicate } => {
                format!(
                    r#"Unsafe `SqlExpr` in rule: `{predicate}`

## Why This Is An Error

`SqlExpr` injects a raw SQL string straight into the compiled query. That
string is **not** parsed, type-checked, or verified, and it is rarely portable
across engines — the very guarantees Synalog exists to provide. It is reserved
for the built-in library; user programs must not reach for it.

## How To Fix

Express the logic in Synalog. For temporal math, stay on the string→int
pipeline: pull parts out with `Substr`, convert with `ToInt64`, do the
arithmetic, and reassemble with `ToString` (see the temporal docs).

```synalog
# WRONG — raw SQL escape hatch
TenMinutesAgo(timestamp:) :-
  Now(timestamp: now),
  timestamp == SqlExpr("{{t}} - INTERVAL 10 MINUTE", {{t: now}});

# FIXED — arithmetic on extracted integer parts
NowMinutes(total:) :-
  Now(timestamp:),
  total == ToInt64(Substr(ToString(timestamp), 12, 2)) * 60
         + ToInt64(Substr(ToString(timestamp), 15, 2));
```"#,
                    predicate = predicate
                )
            }
            VerifyError::PositionalArguments { predicate } => {
                format!(
                    r#"Positional arguments in: `{predicate}`

## Why This Is An Error

Synalog uses **named** arguments only. Positional arguments compile to synthetic
`col0`, `col1`, … column names that do not match real database schemas, which
defeats the point of compiling to portable SQL. Naming every argument also keeps
the rule readable and lets the verifier catch column typos.

## How To Fix

Give every argument an explicit `field_name: value`. Use the shorthand
`Predicate(field:)` when the variable shares the column's name.

```synalog
# WRONG — positional arguments
Customer(id, name) :- customers(id, name);

# FIXED — named arguments
Customer(id:, name:) :- customers(id:, name:);
```

Note: function calls (`Substr(s, 1, 2)`) and annotations (`@OrderBy(P, "c")`)
are not affected — only rule heads and predicate references must be named.
"#,
                    predicate = predicate
                )
            }
            VerifyError::Multiple(errors) => {
                let mut help = format!(
                    "# Verification Errors\n\n\
                     Found **{}** verification error(s). Each must be fixed.\n\n\
                     > Errors are often related — fixing one may resolve others.\n\n",
                    errors.len()
                );
                for (i, err) in errors.iter().enumerate() {
                    help.push_str(&format!(
                        "---\n\n## Error {}/{}\n\n**{}**\n\n{}\n\n",
                        i + 1,
                        errors.len(),
                        err,
                        err.help()
                    ));
                }
                help
            }
        }
    }
}

impl VerifyError {
    /// Check if this is a safety error (variable binding).
    pub fn is_safety_error(&self) -> bool {
        matches!(
            self,
            VerifyError::UnboundHeadVar { .. }
                | VerifyError::UnsafeNegation { .. }
                | VerifyError::UnsafeAggregation { .. }
        )
    }

    /// Check if this is a stratification error.
    pub fn is_stratification_error(&self) -> bool {
        matches!(self, VerifyError::NegativeCycle { .. })
    }

    /// Get the rule text if available.
    pub fn rule_text(&self) -> Option<&str> {
        match self {
            VerifyError::UnboundHeadVar { rule, .. } => Some(rule),
            VerifyError::UnsafeNegation { rule, .. } => Some(rule),
            VerifyError::UnsafeAggregation { rule, .. } => Some(rule),
            VerifyError::UnboundInput { rule, .. } => Some(rule),
            VerifyError::UnsafeLiteral { rule, .. } => Some(rule),
            _ => None,
        }
    }
}

// ============================================================================
// Conversion traits for backward compatibility
// ============================================================================

/// Extension trait for adding context to errors.
pub trait ErrorContext<T> {
    /// Add context to an error.
    fn context(self, msg: impl Into<String>) -> Result<T>;

    /// Add context with a closure (lazy evaluation).
    fn with_context<F: FnOnce() -> String>(self, f: F) -> Result<T>;
}

impl<T, E: Into<SynalogError>> ErrorContext<T> for std::result::Result<T, E> {
    fn context(self, msg: impl Into<String>) -> Result<T> {
        self.map_err(|e| {
            let inner = e.into();
            SynalogError::Other(format!("{}: {}", msg.into(), inner))
        })
    }

    fn with_context<F: FnOnce() -> String>(self, f: F) -> Result<T> {
        self.map_err(|e| {
            let inner = e.into();
            SynalogError::Other(format!("{}: {}", f(), inner))
        })
    }
}

// ============================================================================
// Verification Result (for multiple errors)
// ============================================================================

/// Result of verification containing potentially multiple errors.
#[derive(Debug, Default)]
pub struct VerifyResult {
    /// List of errors found.
    pub errors: Vec<VerifyError>,
    /// List of warnings.
    pub warnings: Vec<String>,
}

impl VerifyResult {
    /// Create an empty (valid) result.
    pub fn ok() -> Self {
        Self::default()
    }

    /// Check if verification passed.
    pub fn is_valid(&self) -> bool {
        self.errors.is_empty()
    }

    /// Add an error.
    pub fn add_error(&mut self, error: VerifyError) {
        self.errors.push(error);
    }

    /// Add a warning.
    pub fn add_warning(&mut self, warning: impl Into<String>) {
        self.warnings.push(warning.into());
    }

    /// Merge another result into this one.
    pub fn merge(&mut self, other: VerifyResult) {
        self.errors.extend(other.errors);
        self.warnings.extend(other.warnings);
    }

    /// Convert to Result, failing if any errors.
    pub fn into_result(self) -> std::result::Result<(), VerifyError> {
        if self.errors.is_empty() {
            Ok(())
        } else if self.errors.len() == 1 {
            Err(self.errors.into_iter().next().unwrap())
        } else {
            Err(VerifyError::Multiple(self.errors))
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_parse_error_display() {
        let err = ParseError::syntax_simple("unexpected token '}'");
        assert!(err.to_string().contains("unexpected token"));
    }

    #[test]
    fn test_compile_error_display() {
        let err = CompileError::UnknownPredicate {
            name: "Foo".to_string(),
            rule: "Test(x) :- Foo(x)".to_string(),
        };
        assert!(err.to_string().contains("Unknown predicate 'Foo'"));
    }

    #[test]
    fn test_verify_error_display() {
        let err = VerifyError::UnboundHeadVar {
            var: "y".to_string(),
            rule: "Test(x, y) :- Source(x)".to_string(),
        };
        assert!(err.to_string().contains("Unbound variable 'y'"));
    }

    #[test]
    fn test_negative_cycle_display() {
        let err = VerifyError::NegativeCycle {
            predicates: vec!["A".to_string(), "B".to_string(), "C".to_string()],
        };
        assert!(err.to_string().contains("A -> B -> C"));
    }

    #[test]
    fn test_verify_result() {
        let mut result = VerifyResult::ok();
        assert!(result.is_valid());

        result.add_error(VerifyError::UnboundHeadVar {
            var: "x".to_string(),
            rule: "Test(x) :- Source()".to_string(),
        });
        assert!(!result.is_valid());
    }
}
