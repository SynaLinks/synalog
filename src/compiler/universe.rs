// Modified from: logica/compiler/universe.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// Original work: Copyright 2020 Google LLC, licensed under the Apache License, Version 2.0.
// Modifications: Copyright 2025-2026 Yoan Sallami (Synalinks Team), licensed under the Apache License, Version 2.0.

//! Port of Python's `compiler/universe.py`.
//!
//! Contains:
//! - `Logica` — Predicate execution accumulated state (defines, exports, dependency graph).
//! - `UniverseAnnotations` — Full annotation parsing (Preamble, AttachedDatabases, UDFs, etc.).
//! - `LogicaProgram` — Representing a Logica program; produces SQL for predicates.
//! - `UniverseSubqueryTranslator` — Table/rule translation with grounding, WITH clauses, exports.
//! - Helper functions: `format_sql`, `indent2`, `inject_structure`, `field_values_as_list`.

// Remaining missing features from Python universe.py:
//   - Type inference integration: ShouldTypecheck(), TypeInferenceForStructure per-rule,
//     CheckOrderByClause(), UpdateExecutionWithTyping(). The type_inference module provides
//     TypesGraphBuilder and TypeInference classes, but integration is not yet complete.
//   - UDF compilation: BuildUdfs(), FunctionSql(), TurnPositionalIntoNamed().
//     Fields custom_udfs/custom_udf_definitions exist but are never populated.
//   - TVF support: TvfSignature(), @CompileAsTvf handling.
//   - Annotation validation: CheckAnnotatedObjects() — verify annotations target existing predicates.
// Implemented: PerformIterationClosure, SelectAsRecord, iterations initialization, type_inference module.

use std::collections::{HashMap, HashSet};
use std::cell::RefCell;
use indexmap::IndexMap;

use crate::parser::{Json, JsonObject};
use crate::compiler::{CompileResult, CompileError};
use crate::compiler::annotations::{Annotations, Ground};
use crate::compiler::dialects::{self, Dialect};
use crate::compiler::expr_translate::SubqueryTranslator;
use crate::compiler::rule_translate::{self, NamesAllocator, RuleStructure};
use crate::compiler::type_inference::{Type, TypesGraphBuilder, TypeInference};

// ---------------------------------------------------------------------------
// Named tuple equivalents
// ---------------------------------------------------------------------------

/// Information about a predicate's compilation characteristics.
#[derive(Debug, Clone)]
pub struct PredicateInfo {
    pub embeddable: bool,
}

/// Extended ground information (superset of `annotations::Ground`).
#[derive(Debug, Clone)]
pub struct GroundInfo {
    pub table_name: String,
    pub overwrite: bool,
}

/// Pagination options for query compilation.
#[derive(Debug, Clone, Default)]
pub struct Pagination {
    /// Maximum number of rows to return.
    /// Combined with @Limit annotation: actual = min(limit, @Limit)
    pub limit: Option<u64>,
    /// Number of rows to skip.
    pub offset: Option<u64>,
}

// ---------------------------------------------------------------------------
// Helper functions
// ---------------------------------------------------------------------------

/// Append a semicolon to a SQL string (Python's `FormatSql`).
pub fn format_sql(s: &str) -> String {
    format!("{};", s)
}

/// Indent every line of `s` by 2 spaces (Python's `Indent2`).
pub fn indent2(s: &str) -> String {
    s.split('\n')
        .map(|l| format!("  {}", l))
        .collect::<Vec<_>>()
        .join("\n")
}

/// Merge `source` RuleStructure fields into `target` (Python's `InjectStructure`).
pub fn inject_structure(target: &mut RuleStructure, source: &RuleStructure) {
    target.vars_map.extend(source.vars_map.clone());
    target.inv_vars_map.extend(source.inv_vars_map.clone());
    target.vars_unification.extend(source.vars_unification.clone());
    target.unnestings.extend(source.unnestings.clone());
    target.constraints.extend(source.constraints.clone());
    target.synonym_log.extend(source.synonym_log.clone());
}

/// Convert field values dict (keyed "1", "2", …) to a list. Returns `None` on
/// non-contiguous keys (Python's `FieldValuesAsList`).
pub fn field_values_as_list(field_values: &HashMap<String, Json>) -> Option<Vec<Json>> {
    let mut result = Vec::new();
    let count = field_values.iter()
        .filter(|(k, _)| k.as_str() != "__rule_text")
        .count();
    for i in 0..count {
        let key = (i + 1).to_string();
        match field_values.get(&key) {
            Some(v) => result.push(v.clone()),
            None => return None,
        }
    }
    Some(result)
}

/// Format a recursion-too-deep error message.
pub fn recursion_error_message() -> String {
    "Recursion in this rule is too deep. It is running over the recursion limit. \
     If this is intentional, consider using @Recursive annotation."
        .to_string()
}

/// The SQL naming a table the program reads but does not define: a dotted
/// path of names (`sales.Orders`), or one in backticks whose parts may hold
/// '-' (`` `my-project.sales.orders` ``), each part then quoted for the
/// engine. Anything else is refused: a table name never carries SQL.
pub fn table_reference(table: &str, dialect: &dyn dialects::Dialect) -> CompileResult<String> {
    if !is_table_name(table) {
        return Err(CompileError::new(
            format!("'{}' is not a table name: write names of letters, digits and '_', joined by '.'", table),
            table.to_string(),
        ));
    }
    match table.strip_prefix('`').and_then(|t| t.strip_suffix('`')) {
        Some(inner) if dialect.name() == "bigquery" => Ok(format!("`{}`", inner)),
        Some(inner) => Ok(inner.split('.').map(|p| dialect.quote_identifier(p)).collect::<Vec<_>>().join(".")),
        None => Ok(table.to_string()),
    }
}

/// Whether `table` names a table, as `table_reference` takes it.
pub fn is_table_name(table: &str) -> bool {
    if let Some(inner) = table.strip_prefix('`').and_then(|t| t.strip_suffix('`')) {
        return inner.split('.').all(|p| {
            !p.is_empty() && p.chars().all(|c| c.is_ascii_alphanumeric() || c == '_' || c == '-')
        });
    }
    table.split('.').all(|part| {
        part.chars().next().is_some_and(|c| c.is_ascii_alphabetic() || c == '_')
            && part.chars().all(|c| c.is_ascii_alphanumeric() || c == '_')
    })
}

// ---------------------------------------------------------------------------
// Logica — execution state accumulator (Python's `class Logica`)
// ---------------------------------------------------------------------------

/// Predicate execution accumulated data.
///
/// Stores DEFINE TABLE, EXPORT DATA, dependency edges, and universe annotations
/// that accumulate during a single predicate's compilation.
pub struct Logica {
    /// DEFINE TABLE statements.
    pub defines: Vec<String>,
    /// EXPORT DATA statements.
    pub export_statements: Vec<String>,
    /// Combined defines and exports in order.
    pub defines_and_exports: Vec<String>,
    /// Predicate → allocated CTE table name.
    pub table_to_defined_table_map: HashMap<String, String>,
    /// Allocated CTE name → SQL body.
    pub table_to_with_sql_map: HashMap<String, String>,
    /// Parent predicate → list of WITH dependencies (ordering).
    pub table_to_with_dependencies: HashMap<String, Vec<String>>,
    /// Track which parent predicates had WITH tables compiled for them.
    pub with_compilation_done_for_parent: HashMap<String, HashSet<String>>,
    /// Dependency edges for the execution graph.
    pub dependency_edges: Vec<(String, String)>,
    /// Data dependency edges (for unknown/external tables).
    pub data_dependency_edges: Vec<(String, String)>,
    /// Predicate → full export SQL.
    pub table_to_export_map: HashMap<String, String>,
    /// SQL of the main predicate being compiled.
    pub main_predicate_sql: Option<String>,
    /// Query preamble (engine init, type defs, etc.).
    pub preamble: String,
    /// Workflow stack: inverse path from final to current predicate.
    pub workflow_predicates_stack: Vec<String>,
    /// Comment showing flag values.
    pub flags_comment: String,
    /// Whether we are compiling a UDF (disables WITH).
    pub compiling_udf: bool,
    /// Reference to annotations.
    pub annotations: Option<Annotations>,
    /// Custom UDF format strings: function name → SQL template.
    pub custom_udfs: IndexMap<String, String>,
    /// Custom UDF CREATE FUNCTION definitions.
    pub custom_udf_definitions: IndexMap<String, String>,
    /// Custom aggregation semigroups: aggregation → semigroup function.
    pub custom_aggregation_semigroup: HashMap<String, String>,
    /// Main predicate name.
    pub main_predicate: Option<String>,
    /// Predicates used by the main predicate (from functors).
    pub used_predicates: Vec<String>,
    /// Predicate → transitive dependencies (from functors).
    pub dependencies_of: HashMap<String, HashSet<String>>,
    /// Iteration definitions from @Iteration.
    pub iterations: HashMap<String, IterationDef>,
    /// SQL dialect.
    pub dialect: Option<Box<dyn Dialect>>,
    /// Deferred WITH compilations: (predicate, Option<cte_name>, parent_table).
    /// When cte_name is Some, the compiled SQL is stored in table_to_with_sql_map.
    /// When None, the compilation is for side-effects only (re-compilation for new parent).
    pub pending_with_compilations: Vec<(String, Option<String>, String)>,
}

/// Definition of an @Iteration block.
/// One step of a plan (see `LogicaProgram::formatted_predicate_plan`).
#[derive(Debug, Clone, PartialEq)]
pub enum PlanStep {
    /// The engine's setup (schema, types, functions): a script of its own.
    Setup(String),
    /// One statement to run. The plan's last step is the query whose rows are
    /// the predicate's.
    Sql(String),
    /// A recursion's iteration: its `body` statements run again, at most
    /// `repetitions` times, until `changed` (a query returning one number)
    /// returns 0.
    Loop { body: Vec<String>, repetitions: i64, changed: String },
}

/// Most repetitions a script writes out: past this, it would be huge.
const MAX_SCRIPT_REPETITIONS: i64 = 1000;

/// A plan as one SQL script: each loop written out, every repetition of it,
/// since a script cannot stop when nothing changes.
pub fn script_of(plan: &[PlanStep]) -> CompileResult<String> {
    let mut setup = String::new();
    let mut statements: Vec<String> = Vec::new();
    for step in plan {
        match step {
            PlanStep::Setup(sql) => setup.push_str(sql),
            PlanStep::Sql(sql) => statements.push(sql.clone()),
            PlanStep::Loop { body, repetitions, .. } => {
                if *repetitions + 1 > MAX_SCRIPT_REPETITIONS {
                    return Err(CompileError::new(
                        format!(
                            "This recursion takes more steps than a SQL script can hold (about {} at most): \
                             run it with synalog (`synalog ... run`, `synalog.execute()`), which stops \
                             when the recursion converges, or give @Recursive fewer steps.",
                            2 * MAX_SCRIPT_REPETITIONS
                        ),
                        "",
                    ));
                }
                for _ in 0..*repetitions {
                    statements.extend(body.iter().cloned());
                }
            }
        }
    }
    let last = statements.pop().unwrap_or_default();
    let mut script = setup;
    if !statements.is_empty() {
        script.push_str(&statements.join("\n\n"));
        script.push_str("\n\n");
    }
    script.push_str(&last);
    Ok(script)
}

#[derive(Debug, Clone)]
pub struct IterationDef {
    pub predicates: Vec<String>,
    pub repetitions: i64,
    pub stop_signal: Option<String>,
    /// Semi-naive evaluation: the table every step's new rows are added to.
    /// The iteration's predicates are then the new rows and the next delta,
    /// and it converges when the delta is empty.
    pub accumulate: Option<String>,
}

impl Default for Logica {
    fn default() -> Self {
        Self::new()
    }
}

impl Logica {
    pub fn new() -> Self {
        Logica {
            defines: Vec::new(),
            export_statements: Vec::new(),
            defines_and_exports: Vec::new(),
            table_to_defined_table_map: HashMap::new(),
            table_to_with_sql_map: HashMap::new(),
            table_to_with_dependencies: HashMap::new(),
            with_compilation_done_for_parent: HashMap::new(),
            dependency_edges: Vec::new(),
            data_dependency_edges: Vec::new(),
            table_to_export_map: HashMap::new(),
            main_predicate_sql: None,
            preamble: String::new(),
            workflow_predicates_stack: Vec::new(),
            flags_comment: String::new(),
            compiling_udf: false,
            annotations: None,
            custom_udfs: IndexMap::new(),
            custom_udf_definitions: IndexMap::new(),
            custom_aggregation_semigroup: HashMap::new(),
            main_predicate: None,
            used_predicates: Vec::new(),
            dependencies_of: HashMap::new(),
            iterations: HashMap::new(),
            dialect: None,
            pending_with_compilations: Vec::new(),
        }
    }

    pub fn add_define(&mut self, define: String) {
        self.defines.push(define);
    }

    /// Get UDF definitions needed for a specific predicate.
    pub fn predicate_specific_preamble(&self, predicate_name: &str) -> String {
        let deps = match self.dependencies_of.get(predicate_name) {
            Some(d) => d,
            None => return String::new(),
        };
        let mut needed_udfs: Vec<String> = deps
            .iter()
            .filter_map(|f| self.custom_udf_definitions.get(f).cloned())
            .collect();
        needed_udfs.sort();

        let mut needed_semigroups = Vec::new();
        for f in deps {
            if let Some(sg) = self.custom_aggregation_semigroup.get(f) {
                if let Some(sg_def) = self.custom_udf_definitions.get(sg) {
                    needed_semigroups.push(sg_def.clone());
                    needed_udfs.retain(|u| u != sg_def);
                }
            }
        }
        needed_semigroups.extend(needed_udfs);
        needed_semigroups.join("\n")
    }

    /// Get all needed UDF definitions for the used predicates.
    pub fn needed_udf_definitions(&self) -> Vec<String> {
        let mut needed_udfs: Vec<String> = self
            .used_predicates
            .iter()
            .filter_map(|f| self.custom_udf_definitions.get(f).cloned())
            .collect();
        needed_udfs.sort();

        let mut needed_semigroups = HashSet::new();
        for f in &self.used_predicates {
            if let Some(sg) = self.custom_aggregation_semigroup.get(f) {
                if let Some(sg_def) = self.custom_udf_definitions.get(sg) {
                    needed_semigroups.insert(sg_def.clone());
                    needed_udfs.retain(|u| u != sg_def);
                }
            }
        }
        let mut result: Vec<String> = needed_semigroups.into_iter().collect();
        result.extend(needed_udfs);
        result
    }

    /// Full preamble: flags comment + preamble + defines.
    pub fn full_preamble(&self) -> String {
        let mut parts = vec![self.flags_comment.clone(), self.preamble.clone()];
        parts.extend(self.defines.clone());
        parts.join("\n")
    }

    /// Whether predicate should use WITH, taking UDF compilation into account.
    pub fn with_for(&self, predicate_name: &str) -> bool {
        if self.compiling_udf {
            return false;
        }
        self.annotations
            .as_ref()
            .map(|a| a.use_with(predicate_name))
            .unwrap_or(true)
    }
}

// ---------------------------------------------------------------------------
// Record-type collection (PostgreSQL composite-type DDL)
// ---------------------------------------------------------------------------

/// Recursively find record-literal nodes anywhere in `node` and register their
/// (and any nested) record types into `out`, keyed by content-addressed name.
fn collect_record_types(node: &Json, out: &mut IndexMap<String, Type>) {
    match node {
        Json::Object(o) => {
            for key in ["record", "the_record"] {
                if let Some(rec) = o.get(key) {
                    if rec.is_object() && record_is_all_named(rec) {
                        let ty = crate::compiler::expr_translate::record_literal_type(rec);
                        register_record_type(&ty, out);
                    }
                }
            }
            for v in o.values() {
                collect_record_types(v, out);
            }
        }
        Json::Array(items) => items.iter().for_each(|it| collect_record_types(it, out)),
        _ => {}
    }
}

/// True if `rec` is a record node whose fields are all named (string `field`).
/// Positional/synthetic records (e.g. negation's `Combine`) are not composite
/// types and must be skipped.
fn record_is_all_named(rec: &Json) -> bool {
    rec.as_object()
        .get("field_value")
        .map(|fvs| {
            let arr = fvs.as_array();
            !arr.is_empty()
                && arr.iter().all(|fv| {
                    fv.as_object()
                        .get("field")
                        .map(|f| f.is_string())
                        .unwrap_or(false)
                })
        })
        .unwrap_or(false)
}

/// Register a record `Type` and all nested record types (dependencies first).
/// Empty records (no named fields) are skipped — they are not valid composites.
fn register_record_type(ty: &Type, out: &mut IndexMap<String, Type>) {
    if let Type::Record { fields, .. } = ty {
        if fields.is_empty() {
            return;
        }
        for t in fields.values() {
            register_record_type(t, out);
        }
        out.entry(dialects::record_type_name(ty))
            .or_insert_with(|| ty.clone());
    }
    // A list of records holds records of a type too.
    if let Type::List(inner) = ty {
        register_record_type(inner, out);
    }
}

/// The record type a field's type holds, as a record or a list's element.
fn held_record(t: &Type) -> Option<&Type> {
    match t {
        Type::Record { .. } => Some(t),
        Type::List(inner) => held_record(inner),
        _ => None,
    }
}

/// Emit the `CREATE TYPE` for `name`, recursing into nested record types first
/// so dependencies are declared before the types that use them. Idempotent and
/// single-line so the golden-test normalizer strips it.
fn emit_record_type(
    name: &str,
    types: &IndexMap<String, Type>,
    dialect: &dyn Dialect,
    emitted: &mut HashSet<String>,
    out: &mut String,
) {
    if !emitted.insert(name.to_string()) {
        return;
    }
    let Some(Type::Record { fields, .. }) = types.get(name) else {
        return;
    };
    for t in fields.values() {
        if let Some(r) = held_record(t) {
            emit_record_type(&dialects::record_type_name(r), types, dialect, emitted, out);
        }
    }
    out.push_str(&format!(
        "DO $$ BEGIN if not exists (select 1 from pg_type where typname = '{name}') \
         then create type {name} as ({}); end if; END $$;\n",
        dialects::psql_record_columns(&types[name])
    ));
}

// ---------------------------------------------------------------------------
// LogicaProgram — full program compilation (Python's `class LogicaProgram`)
// ---------------------------------------------------------------------------

/// Representing a Logica program. Can produce SQL for predicates.
///
/// This is the full-featured version matching Python's `LogicaProgram`,
/// including execution state, UDFs, grounding, exports, and flag substitution.
pub struct LogicaProgram {
    /// Raw rules before functor expansion.
    pub raw_rules: Vec<Json>,
    /// Pre-parsed rules (after recursion unfolding, before Make).
    pub preparsed_rules: Vec<Json>,
    /// (predicate_name, rule_json) for all rules after functor/library expansion.
    pub rules: Vec<(String, Json)>,
    /// Set of all defined predicate names.
    pub defined_predicates: HashSet<String>,
    /// Predicates defined by the dialect's library program (subset of
    /// `defined_predicates`), as opposed to the user's own rules.
    pub library_predicates: HashSet<String>,
    /// Table aliases for undefined predicates.
    pub table_aliases: HashMap<String, String>,
    /// Parsed annotations.
    pub annotations: Annotations,
    /// Compiled flag values (defaults + user overrides).
    pub flag_values: HashMap<String, String>,
    /// Custom UDF format strings.
    pub custom_udfs: IndexMap<String, String>,
    /// Custom UDF psql return types.
    pub custom_udf_psql_type: HashMap<String, String>,
    /// Custom aggregation semigroups.
    pub custom_aggregation_semigroup: HashMap<String, String>,
    /// Custom UDF CREATE FUNCTION SQL.
    pub custom_udf_definitions: IndexMap<String, String>,
    /// Execution state (set during `formatted_predicate_sql`).
    pub execution: RefCell<Option<Logica>>,
    /// The column names of the program, lowercase, which table aliases avoid.
    pub column_names: HashSet<String>,
    /// The functions the program defines, which shadow built-ins of their name.
    pub defined_functions: HashSet<String>,
    /// Shared names allocator for the current compilation pass.
    /// Set at start of `formatted_predicate_sql`, shared across all sub-compilations.
    pub allocator: RefCell<NamesAllocator>,
    /// User-provided flags.
    pub user_flags: HashMap<String, String>,
    /// Functors state (from @Make processing).
    pub functors_args_of: HashMap<String, HashSet<String>>,
    /// Type-checking preamble (if typechecking enabled).
    pub typing_preamble: String,
    /// Predicate signatures from type inference.
    pub predicate_signatures: HashMap<String, Json>,
    /// Inferred column types per predicate (from type inference).
    pub predicate_types: HashMap<String, HashMap<String, Type>>,
    /// Required type definitions from type inference.
    pub required_type_definitions: HashMap<String, String>,
    /// The record types compiled queries build (PostgreSQL declares them).
    pub built_record_types: RefCell<IndexMap<String, Type>>,
}

impl LogicaProgram {
    /// Create a new program from parsed JSON output and user configuration.
    ///
    /// Matches Python's `LogicaProgram.__init__`:
    /// 1. Unfold recursion
    /// 2. Run @Make functors
    /// 3. Add library rules
    /// 4. Extract annotations
    /// 5. Build UDFs
    pub fn new(
        parsed: &Json,
        table_aliases: HashMap<String, String>,
        user_flags: HashMap<String, String>,
    ) -> CompileResult<Self> {
        Self::new_with_engine(parsed, table_aliases, user_flags, None)
    }

    /// Create a new program with an optional engine override.
    ///
    /// When `engine_override` is `Some`, it takes precedence over any `@Engine`
    /// annotation in the source (and over the default engine). This lets callers
    /// select the SQL dialect programmatically instead of writing `@Engine(...)`.
    pub fn new_with_engine(
        parsed: &Json,
        table_aliases: HashMap<String, String>,
        user_flags: HashMap<String, String>,
        engine_override: Option<&str>,
    ) -> CompileResult<Self> {
        let po = parsed.as_object();
        let raw_rule_list: Vec<Json> = po["rule"].as_array().to_vec();

        // Step 1: Unfold recursion
        let temp_rules: Vec<(String, Json)> = raw_rule_list
            .iter()
            .map(|r| {
                let name = r.as_object()["head"].as_object()["predicate_name"]
                    .as_str()
                    .to_string();
                (name, r.clone())
            })
            .collect();
        let temp_annotations = Annotations::extract(&temp_rules)?;
        let engine = match engine_override {
            Some(e) => e.to_string(),
            None => temp_annotations.engine().to_string(),
        };

        let unfolded_rules =
            crate::compiler::functors::unfold_recursion(&raw_rule_list, &engine)?;

        // Step 2: Run @Make functors
        let (extended_rules, functors_args_of) =
            crate::compiler::functors::run_makes_with_deps(&unfolded_rules)?;

        // Step 3: Add library program rules
        let dialect = dialects::get(&engine)?;
        let lib_program = dialect.library_program();
        let mut all_rules = extended_rules;
        let mut library_predicates = HashSet::new();
        if !lib_program.is_empty() {
            if let Ok(lib_parsed) = crate::parser::parse_file(lib_program, None, &[]) {
                for r in lib_parsed.as_object()["rule"].as_array() {
                    library_predicates.insert(
                        r.as_object()["head"].as_object()["predicate_name"]
                            .as_str()
                            .to_string(),
                    );
                    all_rules.push(r.clone());
                }
            }
        }

        // Build (predicate_name, rule) pairs
        let mut rules = Vec::with_capacity(all_rules.len());
        for rule in &all_rules {
            let head = &rule.as_object()["head"];
            let name = head.as_object()["predicate_name"].as_str().to_string();
            rules.push((name, rule.clone()));
        }

        // Extract annotations (recompute after functors added rules)
        let mut annotations = Annotations::extract(&rules)?;
        // An explicit engine override wins over any `@Engine` annotation so that
        // dialect-dependent behavior (dataset selection, type-checking, SQLite
        // specifics) stays consistent with the dialect chosen above.
        if let Some(e) = engine_override {
            annotations.engine = e.to_string();
        }
        // Presto and Trino inline a CTE everywhere it is read: a predicate
        // read by several rules, each read by several more, is copied until
        // the query passes their limit of stages (100 on Presto, 150 on
        // Trino), as edges joined through shared nodes do. A derived predicate
        // read more than once is materialized, as @Ground does.
        if matches!(annotations.engine.as_str(), "presto" | "trino") {
            for name in reused_derived_predicates(&rules) {
                let entry = annotations.annotations.entry(name.clone()).or_default();
                entry.entry("ground".to_string()).or_insert(Json::Str(name));
            }
        }

        // Build flag values
        let mut flag_values = annotations.flag_values.clone();
        flag_values.extend(user_flags.clone());

        // Build defined predicates set
        let defined_predicates: HashSet<String> = rules
            .iter()
            .filter(|(name, _)| !name.starts_with('@'))
            .map(|(name, _)| name.clone())
            .collect();

        // Check distinct consistency
        Self::check_distinct_consistency(&rules)?;

        // Run type checking if enabled for the engine
        let (typing_preamble, predicate_signatures, predicate_types) = if annotations.should_typecheck() {
            Self::run_typechecker(&rules)?
        } else {
            (String::new(), HashMap::new(), HashMap::new())
        };

        // Build custom aggregation semigroups from @BareAggregation annotations
        let custom_aggregation_semigroup: HashMap<String, String> = annotations
            .bare_aggregation
            .iter()
            .map(|(pred, sg)| (pred.clone(), sg.clone()))
            .collect();

        let column_names: HashSet<String> = rules
            .iter()
            .filter_map(|(_, rule)| rule.as_object()["head"].as_object().get("record").cloned())
            .flat_map(|record| {
                record.as_object().get("field_value").map(|f| f.as_array().clone()).unwrap_or_default()
            })
            .filter_map(|fv| {
                let field = &fv.as_object()["field"];
                field.is_string().then(|| field.as_str().to_ascii_lowercase())
            })
            .collect();
        // Functions: predicates every rule of which defines a value.
        let mut value_rules: HashMap<String, bool> = HashMap::new();
        for (name, rule) in &rules {
            let has_value = rule.as_object()["head"].as_object().get("record").is_some_and(|r| {
                r.as_object().get("field_value").is_some_and(|fvs| {
                    fvs.as_array().iter().any(|fv| {
                        let f = &fv.as_object()["field"];
                        f.is_string() && f.as_str() == "logica_value"
                    })
                })
            });
            value_rules.entry(name.clone()).and_modify(|all| *all &= has_value).or_insert(has_value);
        }
        let defined_functions: HashSet<String> =
            value_rules.into_iter().filter(|(_, f)| *f).map(|(n, _)| n).collect();
        let mut allocator = NamesAllocator::new();
        allocator.reserved_aliases = column_names.clone();
        allocator.defined_functions = defined_functions.clone();

        Ok(LogicaProgram {
            raw_rules: raw_rule_list,
            preparsed_rules: unfolded_rules.clone(),
            rules,
            defined_predicates,
            library_predicates,
            table_aliases,
            annotations,
            flag_values,
            custom_udfs: IndexMap::new(),
            custom_udf_psql_type: HashMap::new(),
            custom_aggregation_semigroup,
            custom_udf_definitions: IndexMap::new(),
            execution: RefCell::new(None),
            allocator: RefCell::new(allocator),
            column_names,
            defined_functions,
            user_flags,
            functors_args_of,
            typing_preamble,
            predicate_signatures,
            predicate_types,
            required_type_definitions: HashMap::new(),
            built_record_types: RefCell::new(IndexMap::new()),
        })
    }

    /// Check that all rules of a predicate are consistently distinct-denoted (or not).
    fn check_distinct_consistency(rules: &[(String, Json)]) -> CompileResult<()> {
        let mut is_distinct: HashMap<String, bool> = HashMap::new();
        for (p, r) in rules {
            if p.starts_with('@') {
                continue;
            }
            let distinct_here = r.as_object().contains_key("distinct_denoted");
            if let Some(&distinct_before) = is_distinct.get(p) {
                if distinct_before != distinct_here {
                    return Err(CompileError::new(
                        format!(
                            "Either all rules of a predicate must be distinct denoted \
                             or none. Predicate '{}' violates it.",
                            p
                        ),
                        r.as_object()
                            .get("full_text")
                            .map(|v| v.as_str().to_string())
                            .unwrap_or_default(),
                    ));
                }
            } else {
                is_distinct.insert(p.clone(), distinct_here);
            }
        }
        Ok(())
    }

    /// Run the type checker on all rules.
    /// Returns (typing_preamble, predicate_signatures, predicate_types).
    /// Matches Python's RunTypechecker().
    fn run_typechecker(
        rules: &[(String, Json)],
    ) -> CompileResult<(
        String,
        HashMap<String, Json>,
        HashMap<String, HashMap<String, Type>>,
    )> {
        // Build a parsed program structure for the type graph builder
        let rule_array: Vec<Json> = rules.iter().map(|(_, r)| r.clone()).collect();
        let parsed_program = crate::json_obj! {
            "rule" => Json::Array(rule_array)
        };

        // Build type graphs for all predicates
        let mut builder = TypesGraphBuilder::new();
        let graphs = builder.run(&parsed_program);

        // Run type inference
        let mut inference = TypeInference::new(graphs);
        if let Err(e) = inference.infer() {
            return Err(CompileError::new(
                format!("Type inference error: {}", e),
                String::new(),
            ));
        }

        // Collect the inferred column types per predicate. These feed downstream
        // type-dependent SQL (e.g. PostgreSQL CASTs on combine subqueries).
        let mut predicate_types: HashMap<String, HashMap<String, Type>> = HashMap::new();
        for (name, _) in rules {
            if name.starts_with('@') {
                continue;
            }
            let fields = inference.get_predicate_types(name);
            if !fields.is_empty() {
                predicate_types.entry(name.clone()).or_default().extend(fields);
            }
        }

        // TODO: Implement proper type definition generation for DuckDB/PostgreSQL
        // (typing preamble of `create type logicarecord...` definitions): requires
        // matching Python's type-name hash function and ordering. Not needed for
        // the compiler golden tests, which strip the preamble.
        let typing_preamble = String::new();
        let predicate_signatures = HashMap::new();

        Ok((typing_preamble, predicate_signatures, predicate_types))
    }

    /// PostgreSQL CAST type for a `combine` (aggregating subquery) result, derived
    /// from the aggregation operator and the inferred type of its operand.
    /// Mirrors logica's `combine_psql_type`. Returns None if no aggregation is found.
    pub fn combine_psql_type(&self, combine: &Json) -> Option<String> {
        let head = jget(combine, "head")?;
        let fvs = jget(head, "record").and_then(|r| jget(r, "field_value"))?;
        let arr = match fvs {
            Json::Array(a) => a,
            _ => return None,
        };
        let body = jget(combine, "body");
        for fv in arr {
            let Some(value) = jget(fv, "value") else { continue };
            let Some(agg) = jget(value, "aggregation") else { continue };
            let call = jget(agg, "expression").and_then(|e| jget(e, "call"))?;
            let agg_name = match jget(call, "predicate_name") {
                Some(Json::Str(s)) => s.as_str(),
                _ => return None,
            };
            let operand = jget(call, "record")
                .and_then(|r| jget(r, "field_value"))
                .and_then(|a| match a {
                    Json::Array(items) => items.first(),
                    _ => None,
                })
                .and_then(|f| jget(f, "value"))
                .and_then(|v| jget(v, "expression"));
            let ty = self.aggregation_result_type(agg_name, operand, body);
            return type_to_psql(&ty);
        }
        None
    }

    /// Result `Type` of an aggregation operator applied to an operand expression.
    fn aggregation_result_type(
        &self,
        agg_name: &str,
        operand: Option<&Json>,
        body: Option<&Json>,
    ) -> Type {
        let operand_ty = || operand.map(|o| self.operand_type(o, body)).unwrap_or(Type::Any);
        match agg_name {
            // sum / average / count(+= 1): always numeric.
            "Agg+" | "Avg" => Type::Number,
            "StringAgg" => Type::String,
            // identity-preserving aggregations carry the operand's type.
            "Min" | "Max" => operand_ty(),
            "List" | "Set" | "Array" => Type::List(Box::new(operand_ty())),
            // array concatenation: operand is already a list.
            "Agg++" => operand_ty(),
            _ => operand_ty(),
        }
    }

    /// Best-effort `Type` of an operand expression, resolving variables to their
    /// source predicate column via the combine body and the inferred predicate types.
    fn operand_type(&self, expr: &Json, body: Option<&Json>) -> Type {
        if let Some(lit) = jget(expr, "literal") {
            if jget(lit, "the_string").is_some() {
                return Type::String;
            }
            if jget(lit, "the_bool").is_some() {
                return Type::Bool;
            }
            if jget(lit, "the_number").is_some() {
                return Type::Number;
            }
        }
        if let Some(var) = jget(expr, "variable") {
            if let Some(Json::Str(name)) = jget(var, "var_name") {
                if let Some(body) = body {
                    if let Some((pred, field)) = find_var_binding(name, body) {
                        if let Some(t) = self
                            .predicate_types
                            .get(&pred)
                            .and_then(|fields| fields.get(&field))
                        {
                            return t.clone();
                        }
                    }
                }
            }
        }
        if let Some(call) = jget(expr, "call") {
            if let Some(Json::Str(name)) = jget(call, "predicate_name") {
                match name.as_str() {
                    "++" => return Type::String,
                    "+" | "-" | "*" | "/" | "^" | "%" | "Abs" | "Sqrt" | "Exp" | "Log" | "Sin"
                    | "Cos" | "Round" | "Floor" | "Ceiling" | "Pow" => return Type::Number,
                    "==" | "!=" | "<" | ">" | "<=" | ">=" | "&&" | "||" | "!" | "Like" | "in"
                    | "IsNull" => return Type::Bool,
                    _ => {}
                }
            }
        }
        Type::Any
    }

    /// Get the engine name.
    pub fn engine(&self) -> &str {
        self.annotations.engine()
    }

    /// Get all defined (non-annotation) predicate names.
    pub fn defined_predicates(&self) -> &HashSet<String> {
        &self.defined_predicates
    }

    /// Predicates defined by the user's program, excluding the dialect's
    /// library helpers (`->`, `ArgMin`, ...), sorted for determinism.
    pub fn user_defined_predicates(&self) -> Vec<String> {
        let mut names: Vec<String> = self
            .defined_predicates
            .iter()
            .filter(|name| !self.library_predicates.contains(*name))
            .cloned()
            .collect();
        names.sort();
        names
    }

    /// Create a new names allocator with custom UDFs.
    pub fn new_names_allocator(&self) -> NamesAllocator {
        let udfs: HashMap<String, String> = self.custom_udfs.iter()
            .map(|(k, v)| (k.clone(), v.clone()))
            .collect();
        let mut allocator = NamesAllocator::with_custom_udfs(udfs);
        allocator.reserved_aliases = self.column_names.clone();
        allocator.defined_functions = self.defined_functions.clone();
        allocator
    }

    /// Yield rules for a given predicate.
    pub fn get_predicate_rules(&self, predicate_name: &str) -> Vec<Json> {
        self.rules
            .iter()
            .filter(|(n, _)| n == predicate_name)
            .map(|(_, r)| r.clone())
            .collect()
    }

    /// Initialize execution state for compiling a main predicate.
    /// Matches Python's `InitializeExecution`.
    fn initialize_execution(&self, main_predicate: &str) -> CompileResult<Logica> {
        let mut exec = Logica::new();
        exec.workflow_predicates_stack
            .push(main_predicate.to_string());
        exec.annotations = Some(self.annotations.clone());
        exec.custom_udfs = self.custom_udfs.clone();
        exec.custom_udf_definitions = self.custom_udf_definitions.clone();
        exec.custom_aggregation_semigroup = self.custom_aggregation_semigroup.clone();
        exec.main_predicate = Some(main_predicate.to_string());
        exec.used_predicates = self
            .functors_args_of
            .get(main_predicate)
            .map(|s| s.iter().cloned().collect())
            .unwrap_or_default();
        exec.dependencies_of = self
            .functors_args_of
            .iter()
            .map(|(k, v)| (k.clone(), v.clone()))
            .collect();
        exec.dialect = Some(dialects::get(self.annotations.engine())?);
        // Set dialect-specific preamble (matches Python's InitializeExecution)
        exec.preamble = self.annotations.preamble();
        // Populate iterations from @Iteration annotations
        exec.iterations = self.annotations.iterations()?;
        Ok(exec)
    }

    /// Produce SQL for a predicate (Python's `PredicateSql`).
    /// Uses the shared `self.allocator` RefCell for name allocation.
    ///
    /// `allocator_is_none`: when true, matches Python's `PredicateSql(name, allocator=None)`:
    /// each UNION ALL branch gets a fresh allocator. When false (CTE compilation),
    /// branches share the current allocator.
    ///
    /// Note: external_vocabulary is None for top-level predicate compilation.
    /// It's only passed in nested contexts via `translate_table_in_context`.
    pub fn predicate_sql_ext(
        &self,
        name: &str,
        allocator_is_none: bool,
    ) -> CompileResult<String> {
        let rules = self.get_predicate_rules(name);

        if rules.is_empty() {
            return Err(CompileError::new(
                format!(
                    "No rules are defining '{}', but compilation was requested.",
                    name
                ),
                "",
            ));
        }

        if rules.len() == 1 {
            // Single rule: Python's `SingleRuleSql(rule, allocator, ...)`
            // If allocator_is_none, SingleRuleSql creates a fresh one.
            // If not, it uses the shared one.
            if allocator_is_none {
                *self.allocator.borrow_mut() = self.new_names_allocator();
            }
            let sql = self.single_rule_sql(&rules[0], None, false, true)?;
            assert!(
                !sql.starts_with("/* nil */"),
                "Single rule is nil for predicate '{}'",
                name
            );
            let order_by = self.annotations.order_by_clause(name);
            let limit = self.annotations.limit_clause(name);
            return Ok(format!("{}{}{}", sql, order_by, limit));
        }

        // Multiple rules: UNION ALL
        let mut rules_sql = Vec::new();
        let mut branches = Vec::new();
        for rule in &rules {
            if rule.as_object().contains_key("distinct_denoted") {
                return Err(CompileError::new(
                    format!(
                        "For distinct denoted predicates multiple rules are not \
                         currently supported. Consider taking union of bodies manually."
                    ),
                    rule.as_object()
                        .get("full_text")
                        .map(|v| v.as_str().to_string())
                        .unwrap_or_default(),
                ));
            }
            // Python: SingleRuleSql(rule, allocator, ...)
            // If allocator is None → fresh allocator per branch
            // If allocator is provided → shared across branches
            if allocator_is_none {
                *self.allocator.borrow_mut() = self.new_names_allocator();
            }
            let single_sql = self.single_rule_sql(rule, None, false, false)?;
            if !single_sql.starts_with("/* nil */") {
                rules_sql.push(format!("\n{}\n", indent2(&single_sql)));
                branches.push(single_sql);
            }
        }

        // Spark mis-plans a correlated subquery over a union of constant
        // SELECTs ("key not found" during optimization, Spark 3.5 and 4.0):
        // on Databricks, facts are the rows of one VALUES.
        if self.annotations.engine() == "databricks" && branches.len() > 1 {
            if let Some(rows) = branches.iter().map(|b| constant_select(b)).collect::<Option<Vec<_>>>() {
                let columns: Vec<&String> = rows[0].iter().map(|(_, c)| c).collect();
                if rows.iter().all(|r| r.iter().map(|(_, c)| c).eq(columns.iter().copied())) {
                    let values: Vec<String> = rows
                        .iter()
                        .map(|r| format!("({})", r.iter().map(|(e, _)| e.as_str()).collect::<Vec<_>>().join(", ")))
                        .collect();
                    let cols: Vec<&str> = columns.iter().map(|c| c.as_str()).collect();
                    return Ok(format!(
                        "SELECT * FROM VALUES\n  {}\nAS UNUSED_TABLE_NAME({}){}{}",
                        values.join(",\n  "),
                        cols.join(", "),
                        self.annotations.order_by_clause(name),
                        self.annotations.limit_clause(name),
                    ));
                }
            }
        }

        if rules_sql.is_empty() {
            return Err(CompileError::new(
                format!("All disjuncts are nil for predicate '{}'.", name),
                "",
            ));
        }

        let rules_sql: Vec<String> = rules_sql
            .iter()
            .map(|r| {
                r.split('\n')
                    .map(|l| format!("  {}", l))
                    .collect::<Vec<_>>()
                    .join("\n")
            })
            .collect();

        let order_by = self.annotations.order_by_clause(name);
        let limit = self.annotations.limit_clause(name);

        Ok(format!(
            "SELECT * FROM (\n{}\n) AS UNUSED_TABLE_NAME {} {}",
            rules_sql.join(" UNION ALL\n"),
            order_by,
            limit,
        ))
    }

    /// Produce SQL for a predicate using the shared allocator (allocator is NOT None).
    /// Used for CTE compilation and inline subqueries.
    pub fn predicate_sql(&self, name: &str) -> CompileResult<String> {
        self.predicate_sql_ext(name, false)
    }

    // Note: Python does per-rule type inference via ShouldTypecheck() + TypeInferenceForStructure.
    // The type_inference module is available but not yet integrated here.
    /// Produce SQL for a given rule in the program (Python's `SingleRuleSql`).
    /// Uses the shared `self.allocator` RefCell.
    pub fn single_rule_sql(
        &self,
        rule: &Json,
        external_vocabulary: Option<&HashMap<String, String>>,
        is_combine: bool,
        must_not_be_nil: bool,
    ) -> CompileResult<String> {
        // Get dialect early to check decorate_combine_rule setting
        let dialect = dialects::get(self.annotations.engine())?;

        let r = if is_combine && dialect.decorate_combine_rule() {
            let var = self.allocator.borrow_mut().alloc_var();
            rule_translate::decorate_combine_rule(rule, &var)
        } else {
            rule.clone()
        };

        // Take the shared allocator for rule extraction (matching Python's behavior).
        // This ensures FROM-clause table aliases and CTE names use the same counter.
        let taken = std::mem::take(&mut *self.allocator.borrow_mut());
        let mut s = rule_translate::extract_rule_structure_with_vocabulary(
            &r,
            Some(taken),
            external_vocabulary.cloned(),
        )?;

        self.run_injections(&mut s)?;
        rule_translate::finalize_rule_structure(&mut s);
        s.sort_unnestings()?;

        // Check for nil tables or nil calls in unnestings or select expressions
        fn contains_nil_predicate(json: &Json) -> bool {
            match json {
                Json::Object(o) => {
                    // Check if this is a call to 'nil'
                    if let Some(call) = o.get("call") {
                        if let Some(pn) = call.as_object().get("predicate_name") {
                            if pn.is_string() && pn.as_str() == "nil" {
                                return true;
                            }
                        }
                    }
                    // Also check direct predicate_name (for unnestings)
                    if let Some(pn) = o.get("predicate_name") {
                        if pn.is_string() && pn.as_str() == "nil" {
                            return true;
                        }
                    }
                    o.values().any(|v| contains_nil_predicate(v))
                }
                Json::Array(a) => a.iter().any(|v| contains_nil_predicate(v)),
                _ => false,
            }
        }

        let has_nil_table = s.tables.values().any(|v| v == "nil");
        let has_nil_unnesting = s.unnestings.iter().any(|(_, list_expr)| {
            contains_nil_predicate(list_expr)
        });
        let has_nil_select = s.select.values().any(|expr| contains_nil_predicate(expr));

        if has_nil_table || has_nil_unnesting || has_nil_select {
            // Put allocator back before returning
            *self.allocator.borrow_mut() = std::mem::take(&mut s.allocator);
            if must_not_be_nil {
                return Err(CompileError::new(
                    format!(
                        "Single rule is nil for predicate '{}'. Recursion unfolding failed.",
                        s.this_predicate_name
                    ),
                    rule.as_object()
                        .get("full_text")
                        .map(|v| v.as_str().to_string())
                        .unwrap_or_default(),
                ));
            } else {
                return Ok(
                    "/* nil */ SELECT NULL FROM (SELECT 42 AS MONAD) AS NIRVANA WHERE MONAD = 0"
                        .to_string(),
                );
            }
        }

        // Put allocator back in RefCell for translator access during as_sql.
        *self.allocator.borrow_mut() = std::mem::take(&mut s.allocator);

        let translator = UniverseSubqueryTranslator {
            program: self,
        };

        s.as_sql(&translator, dialect.as_ref(), &self.flag_values)
    }

    /// Inline single-rule predicates referenced in the body (Python's `RunInjections`).
    pub fn run_injections(
        &self,
        s: &mut RuleStructure,
    ) -> CompileResult<()> {
        let mut iterations = 0;
        loop {
            iterations += 1;
            if iterations > 1000 {
                return Err(CompileError::new(
                    recursion_error_message(),
                    &s.full_rule_text,
                ));
            }

            let mut new_tables = IndexMap::new();
            let mut changed = false;
            let old_tables: Vec<_> = s.tables.iter().map(|(k, v)| (k.clone(), v.clone())).collect();

            for (table_name_rsql, table_predicate_rsql) in &old_tables {
                let rules = self.get_predicate_rules(table_predicate_rsql);

                // In a subquery (a negation's, which reads the query around
                // it), a rule with a subquery in its body is not inlined: its
                // subquery would read a table two levels up, which Trino,
                // Presto and Spark cannot correlate. As a table, each level
                // reads its parent.
                let nests_a_subquery = s.external_vocabulary.as_ref().is_some_and(|v| !v.is_empty())
                    && rules[0].as_object().get("body").is_some_and(has_subquery);
                let is_injectable = rules.len() == 1
                    && !rules[0].as_object().contains_key("distinct_denoted")
                    && !nests_a_subquery
                    && self.annotations.ok_injection(table_predicate_rsql);

                if is_injectable {
                    // Share allocator with the injected rule (matching Python)
                    let taken_alloc = std::mem::take(&mut s.allocator);
                    let mut rs = rule_translate::extract_rule_structure(&rules[0], Some(taken_alloc))?;
                    rs.eliminate_internal_variables_no_unfold();
                    s.allocator = std::mem::take(&mut rs.allocator);
                    new_tables.extend(rs.tables.clone());

                    // Inject structure
                    inject_structure(s, &rs);

                    // Rebuild vars_map: replace references to the injected table
                    // Preserve inv_vars_map entries not in vars_map (e.g. unnesting vars)
                    let old_vars: Vec<_> = s
                        .vars_map
                        .iter()
                        .map(|(k, v)| (k.clone(), v.clone()))
                        .collect();
                    let mut new_vars_map = IndexMap::new();
                    let mut new_inv_vars_map: IndexMap<String, (String, String)> = s.inv_vars_map
                        .iter()
                        .filter(|(_, (tbl, _))| tbl.is_empty())
                        .map(|(k, v)| (k.clone(), v.clone()))
                        .collect();

                    for ((table_name, table_var), clause_var) in &old_vars {
                        if table_name != table_name_rsql {
                            new_vars_map
                                .insert((table_name.clone(), table_var.clone()), clause_var.clone());
                            new_inv_vars_map
                                .insert(clause_var.clone(), (table_name.clone(), table_var.clone()));
                        } else {
                            // Variable from the injected table
                            if let Some(select_expr) = rs.select.get(table_var.as_str()) {
                                s.vars_unification.push((
                                    Json::Object({
                                        let mut m = JsonObject::new();
                                        m.insert(
                                            "variable".into(),
                                            Json::Object({
                                                let mut vm = JsonObject::new();
                                                vm.insert(
                                                    "var_name".into(),
                                                    Json::Str(clause_var.clone()),
                                                );
                                                vm
                                            }),
                                        );
                                        m
                                    }),
                                    select_expr.clone(),
                                ));
                            } else if rs.select.contains_key("*") {
                                // Subscript access for star-select
                                let subscript = Json::Object({
                                    let mut m = JsonObject::new();
                                    m.insert(
                                        "literal".into(),
                                        Json::Object({
                                            let mut lm = JsonObject::new();
                                            lm.insert(
                                                "the_symbol".into(),
                                                Json::Object({
                                                    let mut sm = JsonObject::new();
                                                    sm.insert(
                                                        "symbol".into(),
                                                        Json::Str(table_var.clone()),
                                                    );
                                                    sm
                                                }),
                                            );
                                            lm
                                        }),
                                    );
                                    m
                                });
                                s.vars_unification.push((
                                    Json::Object({
                                        let mut m = JsonObject::new();
                                        m.insert(
                                            "variable".into(),
                                            Json::Object({
                                                let mut vm = JsonObject::new();
                                                vm.insert(
                                                    "var_name".into(),
                                                    Json::Str(clause_var.clone()),
                                                );
                                                vm
                                            }),
                                        );
                                        m
                                    }),
                                    Json::Object({
                                        let mut m = JsonObject::new();
                                        m.insert(
                                            "subscript".into(),
                                            Json::Object({
                                                let mut sm = JsonObject::new();
                                                sm.insert("subscript".into(), subscript);
                                                sm.insert(
                                                    "record".into(),
                                                    rs.select["*"].clone(),
                                                );
                                                sm
                                            }),
                                        );
                                        m
                                    }),
                                ));
                            } else if table_var == "*" {
                                // Star access on injected predicate
                                s.vars_unification.push((
                                    Json::Object({
                                        let mut m = JsonObject::new();
                                        m.insert(
                                            "variable".into(),
                                            Json::Object({
                                                let mut vm = JsonObject::new();
                                                vm.insert(
                                                    "var_name".into(),
                                                    Json::Str(clause_var.clone()),
                                                );
                                                vm
                                            }),
                                        );
                                        m
                                    }),
                                    select_as_record(&rs.select),
                                ));
                            } else {
                                return Err(CompileError::new(
                                    format!(
                                        "Predicate '{}' does not have an argument '{}', \
                                         but this rule tries to access it.",
                                        table_predicate_rsql, table_var
                                    ),
                                    &s.full_rule_text,
                                ));
                            }
                        }
                    }
                    s.vars_map = new_vars_map;
                    s.inv_vars_map = new_inv_vars_map;
                    changed = true;
                } else {
                    new_tables.insert(table_name_rsql.clone(), table_predicate_rsql.clone());
                }
            }

            if !changed || s.tables == new_tables {
                break;
            }
            s.tables = new_tables;
        }
        Ok(())
    }

    /// Print top-level formatted SQL statement with defines and exports.
    /// Matches Python's `FormattedPredicateSql`.
    pub fn formatted_predicate_sql(
        &self,
        name: &str,
    ) -> CompileResult<String> {
        self.formatted_predicate_sql_impl(name, None, None)
    }

    /// PostgreSQL composite-type DDL for every record shape in the program.
    ///
    /// psql exposes named record fields only through declared composite types,
    /// so each `ROW(…)::logicarecordNNN` literal emitted by `record_literal`
    /// needs a matching `CREATE TYPE`. We scan every record node in the program
    /// (over-collecting head/argument records is harmless: the DDL is idempotent
    /// and unreferenced types are simply never used), then emit dependency types
    /// before the types that nest them. Names are content-addressed
    /// (`dialects::record_type_name`), so they line up with the casts without any
    /// shared state. Emitted as single-line `DO $$ … logicarecord … END $$;`
    /// blocks, which the golden-test normalizer strips like the placeholder type.
    fn record_type_definitions(&self, dialect: &dyn Dialect, body_sql: &str) -> String {
        let mut types: IndexMap<String, Type> = IndexMap::new();
        for (_, rule) in &self.rules {
            collect_record_types(rule, &mut types);
        }
        for (name, ty) in self.built_record_types.borrow().iter() {
            types.entry(name.clone()).or_insert_with(|| ty.clone());
        }
        // Emit only the types actually cast in the compiled body (`::name`), plus
        // their nested dependencies (pulled in by `emit_record_type`'s recursion).
        // This skips library-helper and other-rule records that the query never
        // builds — some of which use SQL reserved words as field names.
        let referenced: Vec<String> = types
            .keys()
            .filter(|n| body_sql.contains(&format!("::{}", n)))
            .cloned()
            .collect();
        let mut emitted: HashSet<String> = HashSet::new();
        let mut out = String::new();
        for name in &referenced {
            emit_record_type(name, &types, dialect, &mut emitted, &mut out);
        }
        out
    }

    fn formatted_predicate_sql_impl(
        &self,
        name: &str,
        pagination: Option<&Pagination>,
        search: Option<&str>,
    ) -> CompileResult<String> {
        script_of(&self.formatted_predicate_plan(name, pagination, search)?)
    }

    /// The steps that compute a predicate, in order: SQL to run, and a loop
    /// for each deep recursion, whose last step returns the predicate's rows.
    /// A runner that executes the plan stops each loop as soon as it changes
    /// nothing, so a recursion costs the steps its data needs, whatever its
    /// declared depth; `formatted_predicate_sql` writes the loops out instead.
    pub fn formatted_predicate_plan(
        &self,
        name: &str,
        pagination: Option<&Pagination>,
        search: Option<&str>,
    ) -> CompileResult<Vec<PlanStep>> {
        let exec = self.initialize_execution(name)?;
        *self.execution.borrow_mut() = Some(exec);

        // Top-level compilation: allocator=None → fresh allocator per SingleRuleSql.
        // The fresh allocator is created inside predicate_sql_ext when allocator_is_none=true.
        let sql = self.predicate_sql_ext(name, true)?;

        // Process deferred WITH compilations iteratively (DFS post-order).
        // Each predicate_sql call may defer new items. We use a two-phase
        // stack: Compile first, then AddDep, ensuring inner dependencies
        // are added to the WITH list before outer ones.
        {
            enum WorkItem {
                Compile {
                    predicate: String,
                    cte_name: Option<String>,
                },
                AddDep {
                    predicate: String,
                    parent: String,
                },
            }

            let mut stack: Vec<WorkItem> = Vec::new();

            // Seed stack from initial pending items (reverse for correct DFS order)
            {
                let mut exec_ref = self.execution.borrow_mut();
                let exec_inner = exec_ref.as_mut().unwrap();
                let pending = std::mem::take(&mut exec_inner.pending_with_compilations);
                for (pred, cte, parent) in pending.into_iter().rev() {
                    stack.push(WorkItem::AddDep {
                        predicate: pred.clone(),
                        parent: parent.clone(),
                    });
                    stack.push(WorkItem::Compile {
                        predicate: pred,
                        cte_name: cte,
                    });
                }
            }

            while let Some(item) = stack.pop() {
                match item {
                    WorkItem::Compile { predicate, cte_name } => {
                        let result_sql = self.predicate_sql(&predicate)?;

                        if let Some(cn) = cte_name {
                            let mut exec_ref = self.execution.borrow_mut();
                            let exec_inner = exec_ref.as_mut().unwrap();
                            exec_inner.table_to_with_sql_map.insert(cn, result_sql);
                        }

                        // Collect any newly deferred items and push onto stack
                        let mut exec_ref = self.execution.borrow_mut();
                        let exec_inner = exec_ref.as_mut().unwrap();
                        let new_pending =
                            std::mem::take(&mut exec_inner.pending_with_compilations);
                        for (pred, cte, par) in new_pending.into_iter().rev() {
                            stack.push(WorkItem::AddDep {
                                predicate: pred.clone(),
                                parent: par.clone(),
                            });
                            stack.push(WorkItem::Compile {
                                predicate: pred,
                                cte_name: cte,
                            });
                        }
                    }
                    WorkItem::AddDep { predicate, parent } => {
                        let mut exec_ref = self.execution.borrow_mut();
                        let exec_inner = exec_ref.as_mut().unwrap();
                        let dep_list = exec_inner
                            .table_to_with_dependencies
                            .entry(parent)
                            .or_default();
                        if !dep_list.contains(&predicate) {
                            dep_list.push(predicate);
                        }
                    }
                }
            }
        }

        // Iteration closure: if any @Iteration group predicate was compiled,
        // ensure all predicates in that group are compiled too.
        self.perform_iteration_closure()?;

        // Generate WITH prefix
        let with_signature = self.generate_with_clauses(name);

        let sql = if let Some(with_sig) = with_signature {
            format!("{}\n{}", with_sig, sql)
        } else {
            sql
        };

        // Apply a caller-requested regex search filter to the final query
        // only (again, the preamble is assembled around it below). This wraps
        // the query before pagination so the LIMIT/OFFSET apply to the
        // *filtered* rows.
        let sql = match search {
            Some(pattern) => self.search_filter_query(name, sql, pattern)?,
            None => sql,
        };

        // Apply caller-requested pagination to the final query only (the
        // preamble is assembled around it below). @Limit annotations are
        // already inlined by normal compilation; the caller's limit is
        // combined with them via min().
        let sql = match pagination {
            Some(p) => self.paginate_query(name, sql, p),
            None => sql,
        };

        // Get preamble and UDF definitions from execution
        let exec = self.execution.borrow();
        let exec_ref = exec.as_ref().unwrap();

        let mut result = String::new();
        let mut steps: Vec<PlanStep> = Vec::new();

        // Flags comment
        if !exec_ref.flags_comment.is_empty() {
            result.push_str(&exec_ref.flags_comment);
        }

        // Preamble
        if !exec_ref.preamble.is_empty() {
            result.push_str(&exec_ref.preamble);
        }

        // Type definitions. PostgreSQL exposes named record fields only through
        // declared composite types, so generate `CREATE TYPE` DDL for every
        // record shape the program builds (see `record_type_definitions`). Other
        // engines either inline their record types (trino/presto/duckdb) or have
        // none.
        let engine = self.annotations.engine();
        if engine == "psql" {
            let dialect = dialects::get(engine)?;
            result.push_str(&self.record_type_definitions(dialect.as_ref(), &sql));
        } else if engine == "duckdb" && !self.typing_preamble.is_empty() {
            result.push_str(&self.typing_preamble);
        }

        // UDF definitions
        let udf_defs = exec_ref.needed_udf_definitions();
        if !udf_defs.is_empty() {
            result.push_str(&udf_defs.join("\n\n"));
            result.push_str("\n\n");
        }

        if !result.is_empty() {
            steps.push(PlanStep::Setup(result));
        }

        // Defines and exports
        if !exec_ref.defines_and_exports.is_empty() {
            steps.extend(self.plan_statements(exec_ref)?);
        }

        steps.push(PlanStep::Sql(format_sql(&sql)));
        Ok(steps)
    }

    /// The statements that create the program's tables, in an order they can
    /// run in, each `@Iteration` as a loop.
    ///
    /// Deep recursion (`@Recursive` over 20 steps) is compiled as Logica does:
    /// a few steps into tables, then an iteration that recomputes some of those
    /// tables from each other, `repetitions` times at most. Each table comes
    /// after the tables it reads, the iteration's loop after its first run, and
    /// anything reading the iteration after its loop. Without iterations, the
    /// order is the compiler's.
    fn plan_statements(&self, exec: &Logica) -> CompileResult<Vec<PlanStep>> {
        let exports = &exec.table_to_export_map;
        let mut iterations: Vec<(String, IterationDef)> = self
            .annotations
            .iterations()?
            .into_iter()
            .filter(|(_, it)| it.predicates.iter().all(|p| exports.contains_key(p)))
            .collect();
        let as_steps = |statements: &[String]| statements.iter().cloned().map(PlanStep::Sql).collect();
        if iterations.is_empty() {
            return Ok(as_steps(&exec.defines_and_exports));
        }
        iterations.sort_by(|a, b| a.0.cmp(&b.0));

        // The tables, in the compiler's order, each with the statements that
        // follow its creation (its `-- Interacting` comment, a COPY).
        let mut tables: Vec<String> = Vec::new();
        let mut leading: Vec<String> = Vec::new();
        let mut trailing: HashMap<String, Vec<String>> = HashMap::new();
        for statement in &exec.defines_and_exports {
            match exports.iter().find(|(_, stmt)| *stmt == statement) {
                Some((table, _)) if !tables.contains(table) => tables.push(table.clone()),
                _ => match tables.last() {
                    Some(last) => trailing.entry(last.clone()).or_default().push(statement.clone()),
                    None => leading.push(statement.clone()),
                },
            }
        }
        let table_set: HashSet<&String> = tables.iter().collect();
        let mut requires: HashMap<&String, HashSet<&String>> = HashMap::new();
        for (source, target) in exec.dependency_edges.iter().chain(exec.data_dependency_edges.iter()) {
            if let (Some(s), Some(t)) = (table_set.get(source), table_set.get(target)) {
                if s != t {
                    requires.entry(*t).or_default().insert(*s);
                }
            }
        }
        let iteration_of: HashMap<&String, usize> = iterations
            .iter()
            .enumerate()
            .flat_map(|(i, (_, it))| it.predicates.iter().chain(it.accumulate.iter()).map(move |p| (p, i)))
            .filter_map(|(p, i)| table_set.get(p).map(|t| (*t, i)))
            .collect();
        // A semi-naive iteration's predicates run only inside its loop.
        let loop_only: HashSet<&String> = iterations
            .iter()
            .filter(|(_, it)| it.accumulate.is_some())
            .flat_map(|(_, it)| it.predicates.iter())
            .filter_map(|p| table_set.get(p).copied())
            .collect();

        let mut order: Vec<PlanStep> = as_steps(&leading);
        let mut done: HashSet<&String> = HashSet::new();
        // Iterations whose every table ran once, and whose loop is planned.
        let mut finished: HashSet<usize> = HashSet::new();
        while done.len() < tables.len() {
            let ready = tables.iter().find(|t| {
                !done.contains(t)
                    && requires.get(t).is_none_or(|reqs| {
                        reqs.iter().all(|r| {
                            done.contains(r)
                                // Outside an iteration, its tables are ready
                                // once its loop is planned.
                                && match (iteration_of.get(r), iteration_of.get(t)) {
                                    (Some(i), Some(j)) if i == j => true,
                                    (Some(i), _) => finished.contains(i),
                                    _ => true,
                                }
                        })
                    })
            });
            let Some(table) = ready else {
                // A cycle the dependencies do not resolve: keep the compiler's order.
                return Ok(as_steps(&exec.defines_and_exports));
            };
            if loop_only.contains(table) {
                let i = iteration_of[table];
                let iteration = &iterations[i].1;
                order.push(self.semi_naive_loop(iteration, exports)?);
                for p in &iteration.predicates {
                    if let Some(t) = table_set.get(p) {
                        done.insert(*t);
                    }
                }
                finished.insert(i);
                continue;
            }
            done.insert(table);
            order.push(PlanStep::Sql(exports[table].clone()));
            order.extend(as_steps(&trailing.get(table).cloned().unwrap_or_default()));
            if let Some(&i) = iteration_of.get(table) {
                let iteration = &iterations[i].1;
                if iteration.accumulate.is_none()
                    && iteration.predicates.iter().all(|p| table_set.get(p).is_some_and(|t| done.contains(t)))
                {
                    order.push(PlanStep::Loop {
                        body: iteration.predicates.iter().map(|p| exports[p].clone()).collect(),
                        repetitions: iteration.repetitions - 1,
                        changed: self.iteration_changed_query(&iteration.predicates)?,
                    });
                    finished.insert(i);
                }
            }
        }
        Ok(order)
    }

    /// The loop of a semi-naive iteration: the new rows from the delta, added
    /// to the accumulated table, then made the next delta; until the delta is
    /// empty, `repetitions` times at most.
    fn semi_naive_loop(&self, iteration: &IterationDef, exports: &HashMap<String, String>) -> CompileResult<PlanStep> {
        let table = |p: &String| {
            self.annotations
                .ground(p)
                .map(|g| g.table_name)
                .ok_or_else(|| CompileError::new(format!("The iteration's table {} is not grounded.", p), p))
        };
        let (new, next) = (&iteration.predicates[0], &iteration.predicates[1]);
        let full = iteration.accumulate.as_ref().expect("a semi-naive iteration");
        let accumulate = format!("INSERT INTO {} SELECT * FROM {};", table(full)?, table(new)?);
        Ok(PlanStep::Loop {
            body: vec![
                exports[new].clone(),
                accumulate,
                exports[next].clone(),
            ],
            repetitions: iteration.repetitions,
            changed: format!("SELECT COUNT(*) AS changed FROM {}", table(next)?),
        })
    }

    /// The query telling whether one more repetition of an iteration would
    /// change anything: the number of rows that differ between its two halves.
    ///
    /// One repetition computes two consecutive steps of the recursion, each
    /// predicate's upper table from the lower one and the lower from the upper.
    /// When every upper table holds the rows of its lower one, the step
    /// changes nothing: the recursion has converged, and further repetitions
    /// would recompute the same tables.
    fn iteration_changed_query(&self, predicates: &[String]) -> CompileResult<String> {
        let dialect = dialects::get(self.annotations.engine())?;
        let except = dialect.except_distinct();
        let table = |p: &String| {
            self.annotations
                .ground(p)
                .map(|g| g.table_name)
                .ok_or_else(|| CompileError::new(format!("The iteration's table {} is not grounded.", p), p))
        };
        let (upper, lower) = predicates.split_at(predicates.len() / 2);
        let mut counts = Vec::new();
        for (u, l) in upper.iter().zip(lower) {
            let (u, l) = (table(u)?, table(l)?);
            for (a, b) in [(&u, &l), (&l, &u)] {
                counts.push(format!(
                    "(SELECT COUNT(*) FROM (SELECT * FROM {} {} SELECT * FROM {}) AS synalog_changed_{})",
                    a,
                    except,
                    b,
                    counts.len()
                ));
            }
        }
        Ok(format!("SELECT {} AS changed", counts.join(" + ")))
    }

    /// Print top-level formatted SQL with pagination.
    ///
    /// Pagination is applied after all other clauses:
    /// - `limit` is combined with @Limit annotation: actual = min(limit, @Limit)
    /// - `offset` is applied directly
    pub fn formatted_predicate_sql_with_pagination(
        &self,
        name: &str,
        pagination: &Pagination,
    ) -> CompileResult<String> {
        self.formatted_predicate_sql_impl(name, Some(pagination), None)
    }

    /// Wrap the final query in a pagination subquery when the caller asked
    /// for a limit or offset. @Limit annotations are already inlined in
    /// `query`, so a caller limit is combined with them via min() and a
    /// bare @Limit needs no wrapping at all.
    fn paginate_query(&self, name: &str, query: String, pagination: &Pagination) -> String {
        let annotation_limit = self.annotations.limit_of(name);
        let effective_limit = match (pagination.limit, annotation_limit) {
            (Some(pl), Some(al)) => Some(pl.min(al as u64)),
            (Some(pl), None) => Some(pl),
            (None, _) => None,
        };

        let offset = pagination.offset.filter(|o| *o > 0);
        if effective_limit.is_none() && offset.is_none() {
            return query;
        }
        let dialect = dialects::get(self.annotations.engine()).ok();
        if let (Some(d), Some(skip)) = (dialect.as_ref(), offset) {
            if !d.supports_offset() {
                // The rows numbered in order; the page is the numbers after
                // the offset, up to the limit.
                let columns: Vec<String> = self
                    .predicate_columns(name)
                    .iter()
                    .map(|c| dialects::sql_column(c, d.as_ref()))
                    .collect();
                let order = self.annotations.order_by_clause(name);
                let upto = effective_limit.map(|l| format!(" AND synalog_row <= {}", skip + l)).unwrap_or_default();
                return format!(
                    "SELECT {cols} FROM (\nSELECT *, ROW_NUMBER() OVER ({order}) AS synalog_row FROM (\n{query}\n) AS _numbered\n) AS _paginated\nWHERE synalog_row > {skip}{upto}\nORDER BY synalog_row",
                    cols = columns.join(", "),
                    order = order.trim(),
                    query = query.trim_end_matches(';'),
                );
            }
        }
        let pagination_clause = match dialect {
            Some(d) => d.pagination_clause(effective_limit, offset),
            None => String::new(),
        };
        // A subquery's ORDER BY need not survive it (Trino and Presto drop
        // it): the page is taken from the rows ordered again.
        format!(
            "SELECT * FROM (\n{}\n) AS _paginated{}{}",
            query.trim_end_matches(';'),
            self.annotations.order_by_clause(name),
            pagination_clause
        )
    }

    /// Get the column names for a predicate from its rule head(s).
    pub fn predicate_columns(&self, name: &str) -> Vec<String> {
        let rules = self.get_predicate_rules(name);
        if rules.is_empty() {
            return Vec::new();
        }
        let head = &rules[0].as_object()["head"];
        let record = &head.as_object()["record"];
        record.as_object()["field_value"]
            .as_array()
            .iter()
            .map(|fv| fv.as_object()["field"].as_str().to_string())
            .collect()
    }

    /// Produce SQL for a predicate filtered by a regex pattern across all columns.
    /// Each column is cast to text and matched against the pattern.
    ///
    /// Goes through the same path as pagination so the engine preamble (schema,
    /// type and sequence DDL) stays *outside* the wrapped query — only the
    /// final SELECT is wrapped in the search filter, then paginated.
    pub fn formatted_predicate_sql_with_search(
        &self,
        name: &str,
        pattern: &str,
        pagination: &Pagination,
    ) -> CompileResult<String> {
        self.formatted_predicate_sql_impl(name, Some(pagination), Some(pattern))
    }

    /// Wrap a compiled query so it keeps only rows where some column matches
    /// the regex `pattern`. Each column is cast to text and matched via the
    /// dialect's native regex operator; the conditions are OR-ed.
    fn search_filter_query(
        &self,
        name: &str,
        query: String,
        pattern: &str,
    ) -> CompileResult<String> {
        let columns = self.predicate_columns(name);
        if columns.is_empty() {
            return Err(CompileError::new(
                format!("No columns found for predicate '{}'.", name),
                "",
            ));
        }

        let dialect = dialects::get(self.annotations.engine())?;
        let types = self.predicate_types.get(name);
        let where_clause = columns
            .iter()
            .map(|col| {
                // A column is searched in the text ToString gives it: a number
                // as on every engine (`10`, not `10.0`), a boolean as `true` or
                // `false` (not `1` on SQLite).
                let column = dialects::sql_column(col, dialect.as_ref());
                let text = match types.and_then(|t| t.get(col)) {
                    Some(Type::Number) => match dialect.number_to_string() {
                        Some(template) => template.replace("{0}", &column),
                        None => dialect.string_cast(&column),
                    },
                    Some(Type::Bool) => format!(
                        "(CASE WHEN {c} THEN {t} WHEN NOT {c} THEN {f} END)",
                        c = column,
                        t = dialect.str_literal("true"),
                        f = dialect.str_literal("false")
                    ),
                    _ => dialect.string_cast(&column),
                };
                dialect.regex_match_condition(&text, pattern)
            })
            .collect::<Vec<_>>()
            .join(" OR ");

        // Ordered again: the subquery's ORDER BY need not survive it.
        Ok(format!(
            "SELECT * FROM (\n{}\n) AS _searched\nWHERE {}{}",
            query.trim_end_matches(';'),
            where_clause,
            self.annotations.order_by_clause(name),
        ))
    }

    /// Iteration closure: if any predicate of an @Iteration group was compiled,
    /// ensure all predicates in the group are compiled (for side-effect state updates).
    /// Matches Python's `PerformIterationClosure`.
    fn perform_iteration_closure(&self) -> CompileResult<()> {
        let participating_predicates: Vec<String> = {
            let exec = self.execution.borrow();
            let exec_ref = exec.as_ref().unwrap();
            exec_ref.table_to_defined_table_map.keys().cloned().collect()
        };

        // In name order: the order they compile in numbers their tables.
        let iterations: Vec<IterationDef> = {
            let exec = self.execution.borrow();
            let exec_ref = exec.as_ref().unwrap();
            let mut named: Vec<(&String, &IterationDef)> = exec_ref.iterations.iter().collect();
            named.sort_by(|a, b| a.0.cmp(b.0));
            named.into_iter().map(|(_, it)| it.clone()).collect()
        };

        for iteration in &iterations {
            // A semi-naive iteration's accumulated table is what the rest of
            // the program reads: compiling it brings in the iteration.
            let iteration_preds: HashSet<&str> = iteration.predicates.iter()
                .chain(iteration.accumulate.iter())
                .map(|s| s.as_str()).collect();
            for p in &participating_predicates {
                if iteration_preds.contains(p.as_str()) {
                    // This iteration group has a compiled predicate;
                    // ensure all predicates in the group are compiled.
                    for d in &iteration.predicates {
                        // We only need the side-effect (execution state update),
                        // not the resulting SQL.
                        let _ = self.translate_table_in_context(d, None, false);
                    }
                    break;
                }
            }
        }
        Ok(())
    }

    /// Generate WITH ... prefix from accumulated dependency maps.
    /// Matches Python's `GenerateWithClauses`.
    fn generate_with_clauses(&self, predicate_name: &str) -> Option<String> {
        let exec = self.execution.borrow();
        let exec_ref = exec.as_ref()?;

        let dependencies = exec_ref
            .table_to_with_dependencies
            .get(predicate_name)?;

        if dependencies.is_empty() {
            return None;
        }

        let mut with_bodies = Vec::new();
        for dep in dependencies {
            if let Some(table_name) = exec_ref.table_to_defined_table_map.get(dep) {
                if let Some(sql) = exec_ref.table_to_with_sql_map.get(table_name) {
                    with_bodies.push(format!("{} AS ({})", table_name, sql));
                }
            }
        }

        if with_bodies.is_empty() {
            return None;
        }

        Some(format!("WITH {}", with_bodies.join(",\n")))
    }

    /// Translate a table that should be defined in a WITH clause.
    /// Matches Python's `SubqueryTranslator.TranslateWithedTable`.
    fn translate_withed_table(
        &self,
        table: &str,
    ) -> CompileResult<String> {
        // Eager compilation: like Python's TranslateWithedTable, compile the
        // CTE immediately using the current allocator. This ensures CTE names
        // and sub-CTE names are allocated with the same allocator scope as the
        // parent rule's UNION branch.

        let parent_table = {
            let exec = self.execution.borrow();
            exec.as_ref()
                .and_then(|e| e.workflow_predicates_stack.last().cloned())
                .unwrap_or_default()
        };

        let already_defined = {
            let exec = self.execution.borrow();
            exec.as_ref()
                .map(|e| e.table_to_defined_table_map.contains_key(table))
                .unwrap_or(false)
        };

        if !already_defined {
            // Allocate CTE name using the current allocator
            let table_name = {
                let mut alloc = self.allocator.borrow_mut();
                alloc.alloc_table(Some(table))
            };
            {
                let mut exec = self.execution.borrow_mut();
                let exec_ref = exec.as_mut().unwrap();
                exec_ref
                    .table_to_defined_table_map
                    .insert(table.to_string(), table_name.clone());
            }

            // Eagerly compile the CTE SQL (like Python's recursive call).
            // predicate_sql uses self.allocator RefCell internally.
            let result_sql = self.predicate_sql(table)?;
            {
                let mut exec = self.execution.borrow_mut();
                let exec_ref = exec.as_mut().unwrap();
                exec_ref
                    .table_to_with_sql_map
                    .insert(table_name, result_sql);
            }
        } else {
            // Already defined: check if we need to re-compile for this parent
            let already_done = {
                let exec = self.execution.borrow();
                exec.as_ref()
                    .map(|e| {
                        e.with_compilation_done_for_parent
                            .get(&parent_table)
                            .map(|s| s.contains(table))
                            .unwrap_or(false)
                    })
                    .unwrap_or(false)
            };

            if !already_done {
                {
                    let mut exec = self.execution.borrow_mut();
                    let exec_ref = exec.as_mut().unwrap();
                    exec_ref
                        .with_compilation_done_for_parent
                        .entry(parent_table.clone())
                        .or_default()
                        .insert(table.to_string());
                }
                // Re-compile for side-effects (dependency tracking, etc.)
                let _ = self.predicate_sql(table)?;
            }
        }

        // Add dependency edge
        {
            let mut exec = self.execution.borrow_mut();
            let exec_ref = exec.as_mut().unwrap();
            let dep_list = exec_ref
                .table_to_with_dependencies
                .entry(parent_table)
                .or_default();
            if !dep_list.contains(&table.to_string()) {
                dep_list.push(table.to_string());
            }
        }

        let exec = self.execution.borrow();
        let exec_ref = exec.as_ref().unwrap();
        Ok(exec_ref.table_to_defined_table_map[table].clone())
    }

    /// Translate a file-attached (grounded) table.
    /// Matches Python's `SubqueryTranslator.TranslateTableAttachedToFile`.
    fn translate_table_attached_to_file(
        &self,
        table: &str,
        ground: &Ground,
        _allocator: &mut NamesAllocator,
        edge_needed: bool,
    ) -> CompileResult<String> {
        // Step 1: Add dependency edge (short-lived borrow)
        if edge_needed {
            let mut exec = self.execution.borrow_mut();
            if let Some(exec_ref) = exec.as_mut() {
                let parent = exec_ref
                    .workflow_predicates_stack
                    .last()
                    .cloned()
                    .unwrap_or_default();
                exec_ref
                    .dependency_edges
                    .push((table.to_string(), parent));
            }
        }

        // Step 2: Check if already defined (short-lived borrow)
        {
            let exec = self.execution.borrow();
            if let Some(exec_ref) = exec.as_ref() {
                if let Some(name) = exec_ref.table_to_defined_table_map.get(table) {
                    return Ok(name.clone());
                }
            }
        }

        // Step 3: Register the table
        let table_name = ground.table_name.clone();
        let define_statement = format!("-- Interacting with table {}", table_name);
        {
            let mut exec = self.execution.borrow_mut();
            let exec_ref = exec.as_mut().unwrap();
            exec_ref
                .table_to_defined_table_map
                .insert(table.to_string(), table_name.clone());
            exec_ref.add_define(define_statement.clone());
        }

        // Step 4: If defined predicate, compile it and create export
        let mut export_statement = None;
        if self.defined_predicates.contains(table) {
            {
                let mut exec = self.execution.borrow_mut();
                let exec_ref = exec.as_mut().unwrap();
                exec_ref
                    .workflow_predicates_stack
                    .push(table.to_string());
            }

            // Compile dependency (predicate_sql uses RefCell internally)
            let dependency_sql = self.predicate_sql(table)?;

            let with_signature = self.generate_with_clauses(table);
            let dependency_sql = if let Some(with_sig) = with_signature {
                format!("{}\n{}", with_sig, dependency_sql)
            } else {
                dependency_sql
            };

            {
                let mut exec = self.execution.borrow_mut();
                let exec_ref = exec.as_mut().unwrap();
                exec_ref.workflow_predicates_stack.pop();

                let create_or_replace = ground.overwrite
                    && exec_ref
                        .dialect
                        .as_ref()
                        .is_some_and(|d| d.supports_create_or_replace_table());

                let maybe_drop = if ground.overwrite && !create_or_replace {
                    let cascade = exec_ref
                        .dialect
                        .as_ref()
                        .map(|d| d.cascading_deletion_word())
                        .unwrap_or("");
                    format!("DROP TABLE IF EXISTS {}{};\n", ground.table_name, cascade)
                } else {
                    String::new()
                };

                let create_statement = format!(
                    "CREATE {}TABLE {} AS {}",
                    if create_or_replace { "OR REPLACE " } else { "" },
                    ground.table_name,
                    format_sql(&dependency_sql)
                );

                let stmt = format!("{}{}", maybe_drop, create_statement);

                exec_ref
                    .table_to_export_map
                    .insert(table.to_string(), stmt.clone());
                exec_ref.export_statements.push(stmt.clone());
                export_statement = Some(stmt);
            }
        }

        // Step 6: Record in defines_and_exports (short-lived borrow)
        {
            let mut exec = self.execution.borrow_mut();
            let exec_ref = exec.as_mut().unwrap();
            if let Some(ref es) = export_statement {
                exec_ref.defines_and_exports.push(es.clone());
            }
            exec_ref.defines_and_exports.push(define_statement);
        }

        Ok(table_name)
    }

    /// Translate a table to SQL in the FROM clause.
    /// Matches Python's `SubqueryTranslator.TranslateTable`.
    fn translate_table_in_context(
        &self,
        table: &str,
        _external_vocabulary: Option<&HashMap<String, String>>,
        edge_needed: bool,
    ) -> CompileResult<String> {
        // Built-in temporal concepts: inline a one-row relation built from the
        // dialect's native current-date/timestamp SQL — no runtime table needed.
        if table == "Today" || table == "Now" {
            let dialect = dialects::get(self.annotations.engine())?;
            return Ok(if table == "Today" {
                dialect.today_relation_sql()
            } else {
                dialect.now_relation_sql()
            });
        }

        // Check table aliases
        if let Some(alias) = self.table_aliases.get(table) {
            return Ok(alias.clone());
        }

        // Check grounded
        if let Some(ground) = self.annotations.ground(table) {
            let mut alloc = std::mem::take(&mut *self.allocator.borrow_mut());
            let result = self.translate_table_attached_to_file(
                table,
                &ground,
                &mut alloc,
                edge_needed,
            );
            *self.allocator.borrow_mut() = alloc;
            return result;
        }

        // Check defined predicate
        if self.defined_predicates.contains(table) {
            let use_with = {
                let exec = self.execution.borrow();
                exec.as_ref()
                    .map(|e| e.with_for(table))
                    .unwrap_or(self.annotations.use_with(table))
            };

            if use_with {
                return self.translate_withed_table(table);
            }

            // Inline subquery (predicate_sql uses RefCell internally)
            let sql = self.predicate_sql(table)?;
            return Ok(format!("({})", sql));
        }

        // Unknown: data dependency
        if edge_needed {
            let mut exec = self.execution.borrow_mut();
            if let Some(exec_ref) = exec.as_mut() {
                let parent = exec_ref
                    .workflow_predicates_stack
                    .last()
                    .cloned()
                    .unwrap_or_default();
                exec_ref
                    .data_dependency_edges
                    .push((table.to_string(), parent));
            }
        }

        table_reference(table, dialects::get(self.annotations.engine())?.as_ref())
    }
}

// ---------------------------------------------------------------------------
// SubqueryTranslator impl for LogicaProgram
// ---------------------------------------------------------------------------

/// Subquery translator backed by a full `LogicaProgram`.
/// Matches Python's `SubqueryTranslator` class from universe.py.
pub struct UniverseSubqueryTranslator<'a> {
    pub program: &'a LogicaProgram,
}

impl<'a> SubqueryTranslator for UniverseSubqueryTranslator<'a> {
    // edge_needed is always true from trait calls; PerformIterationClosure calls
    // translate_table_in_context directly with edge_needed=false.
    fn translate_table(
        &self,
        predicate: &str,
        external_vocabulary: Option<&HashMap<String, String>>,
    ) -> CompileResult<String> {
        self.program
            .translate_table_in_context(predicate, external_vocabulary, true)
    }

    fn translate_rule(
        &self,
        rule: &Json,
        external_vocabulary: &HashMap<String, String>,
        is_combine: bool,
    ) -> CompileResult<String> {
        self.program
            .single_rule_sql(rule, Some(external_vocabulary), is_combine, false)
    }

    fn combine_psql_type(&self, combine: &Json) -> Option<String> {
        self.program.combine_psql_type(combine)
    }

    fn column_psql_type(&self, predicate: &str, column: &str) -> Option<String> {
        if self.program.annotations.engine() != "psql" {
            return None;
        }
        self.column_type(predicate, column).as_ref().and_then(type_to_psql)
    }

    fn column_type(&self, predicate: &str, column: &str) -> Option<Type> {
        let base = predicate.split("_MultBodyAggAux").next().unwrap_or(predicate);
        self.program
            .predicate_types
            .get(predicate)
            .or_else(|| self.program.predicate_types.get(base))
            .and_then(|fields| fields.get(column))
            .cloned()
    }

    fn register_record_type(&self, ty: &Type) {
        register_record_type(ty, &mut self.program.built_record_types.borrow_mut());
    }
}

// ---------------------------------------------------------------------------
// Combine type-inference helpers
// ---------------------------------------------------------------------------

/// Safely read a field from a JSON object node (None if not an object / absent).
fn jget<'a>(node: &'a Json, key: &str) -> Option<&'a Json> {
    match node {
        Json::Object(o) => o.get(key),
        _ => None,
    }
}

/// Map an inferred `Type` to its PostgreSQL type name (logica's `PsqlType`).
/// None when the type is not known: no cast is better than a wrong one
/// (`CAST('ant' AS numeric)` fails).
fn type_to_psql(t: &Type) -> Option<String> {
    match t {
        Type::Number => Some("numeric".to_string()),
        Type::String => Some("text".to_string()),
        Type::Bool => Some("bool".to_string()),
        Type::List(element) => type_to_psql(element).map(|e| format!("{}[]", e)),
        _ => None,
    }
}

/// Find the (predicate, field) that binds `var_name` in a combine body, by scanning
/// the body's conjunct predicate calls for a field whose value is that variable.
fn find_var_binding(var_name: &str, body: &Json) -> Option<(String, String)> {
    let conjuncts = jget(body, "conjunction").and_then(|c| jget(c, "conjunct"))?;
    let arr = match conjuncts {
        Json::Array(a) => a,
        _ => return None,
    };
    for conj in arr {
        let Some(pred) = jget(conj, "predicate") else { continue };
        let pname = match jget(pred, "predicate_name") {
            Some(Json::Str(s)) => s.clone(),
            _ => continue,
        };
        let Some(Json::Array(items)) =
            jget(pred, "record").and_then(|r| jget(r, "field_value"))
        else {
            continue;
        };
        for item in items {
            let field = match jget(item, "field") {
                Some(Json::Str(s)) => s.clone(),
                Some(Json::Int(n)) => format!("col{}", n),
                _ => continue,
            };
            let bound = jget(item, "value")
                .and_then(|v| jget(v, "expression"))
                .and_then(|e| jget(e, "variable"))
                .and_then(|vv| jget(vv, "var_name"));
            if let Some(Json::Str(vn)) = bound {
                if vn.as_str() == var_name {
                    return Some((pname, field));
                }
            }
        }
    }
    None
}

// ---------------------------------------------------------------------------
// Helpers for record construction
// ---------------------------------------------------------------------------

/// Build a record expression from a select map (Python's `SelectAsRecord`).
fn select_as_record(select: &IndexMap<String, Json>) -> Json {
    let mut field_values = Vec::new();
    for (field, expr) in select {
        // Skip internal value field (both modes)
        if field == "logica_value" || field == "synalog_value" {
            continue;
        }
        field_values.push(Json::Object({
            let mut m = JsonObject::new();
            m.insert("field".into(), Json::Str(field.clone()));
            m.insert(
                "value".into(),
                Json::Object({
                    let mut vm = JsonObject::new();
                    vm.insert("expression".into(), expr.clone());
                    vm
                }),
            );
            m
        }));
    }
    Json::Object({
        let mut m = JsonObject::new();
        m.insert(
            "record".into(),
            Json::Object({
                let mut rm = JsonObject::new();
                rm.insert("field_value".into(), Json::Array(field_values));
                rm
            }),
        );
        m
    })
}

#[cfg(test)]
#[path = "universe_test.rs"]
mod universe_test;

/// Whether a rule body holds a subquery: a negation or another `combine`.
fn has_subquery(json: &Json) -> bool {
    match json {
        Json::Object(o) => o.iter().any(|(key, value)| key == "combine" || has_subquery(value)),
        Json::Array(items) => items.iter().any(has_subquery),
        _ => false,
    }
}

/// The (expression, column) items of a `SELECT` of constants, without FROM,
/// or None.
fn constant_select(sql: &str) -> Option<Vec<(String, String)>> {
    let body = sql.trim().strip_prefix("SELECT")?;
    let upper = body.to_ascii_uppercase();
    if upper.contains(" FROM ") || upper.contains("\nFROM") || upper.contains("SELECT") {
        return None;
    }
    // Top-level commas: outside parentheses and quotes.
    let mut items = Vec::new();
    let (mut depth, mut quote, mut start) = (0i32, None::<char>, 0usize);
    let chars: Vec<(usize, char)> = body.char_indices().collect();
    let mut i = 0;
    while i < chars.len() {
        let (pos, c) = chars[i];
        match quote {
            Some(q) => {
                if c == '\\' {
                    i += 1;
                } else if c == q {
                    quote = None;
                }
            }
            None => match c {
                '\'' | '"' | '`' => quote = Some(c),
                '(' | '[' => depth += 1,
                ')' | ']' => depth -= 1,
                ',' if depth == 0 => {
                    items.push(&body[start..pos]);
                    start = pos + 1;
                }
                _ => {}
            },
        }
        i += 1;
    }
    items.push(&body[start..]);
    items
        .into_iter()
        .map(|item| {
            let item = item.trim();
            let at = item.rfind(" AS ")?;
            let (expr, column) = (item[..at].trim(), item[at + 4..].trim());
            // A record (`STRUCT(1 AS a)`) is not a row value Spark takes.
            let plain = !expr.to_ascii_uppercase().contains(" AS ");
            (plain && !expr.is_empty() && !column.is_empty()).then(|| (expr.to_string(), column.to_string()))
        })
        .collect()
}

/// The predicates read more than once in rule bodies (including negations)
/// whose rules read other predicates, without the ones the compiler writes
/// for recursions, which are tables already.
fn reused_derived_predicates(rules: &[(String, Json)]) -> Vec<String> {
    fn reads(json: &Json, out: &mut Vec<String>) {
        match json {
            Json::Object(o) => {
                if let Some(p) = o.get("predicate").filter(|p| p.is_object()) {
                    if let Some(name) = p.as_object().get("predicate_name") {
                        if name.is_string() {
                            out.push(name.as_str().to_string());
                        }
                    }
                }
                for (_, value) in o.iter() {
                    reads(value, out);
                }
            }
            Json::Array(items) => items.iter().for_each(|i| reads(i, out)),
            _ => {}
        }
    }
    let generated = |name: &str| {
        name.contains("_MultBodyAggAux")
            || name.contains("_recursive")
            || name.contains("_sn_")
            || ["_ROne", "_RZero"].iter().any(|s| name.ends_with(s))
            || name
                .rsplit_once('_')
                .is_some_and(|(_, tail)| {
                    let t = tail.trim_start_matches("ifr").trim_start_matches("fr").trim_start_matches('r');
                    !t.is_empty() && t.len() < tail.len() && t.chars().all(|c| c.is_ascii_digit())
                })
    };
    let mut counts: HashMap<String, usize> = HashMap::new();
    let mut derived: HashSet<String> = HashSet::new();
    for (name, rule) in rules {
        if name.starts_with('@') {
            continue;
        }
        if let Some(body) = rule.as_object().get("body") {
            let mut found = Vec::new();
            reads(body, &mut found);
            if !found.is_empty() {
                derived.insert(name.clone());
            }
            for f in found {
                *counts.entry(f).or_default() += 1;
            }
        }
    }
    let mut out: Vec<String> = counts
        .into_iter()
        .filter(|(name, n)| *n > 1 && derived.contains(name) && !generated(name))
        .map(|(name, _)| name)
        .collect();
    out.sort();
    out
}
