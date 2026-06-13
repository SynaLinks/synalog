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
//   - NeedsClingo() — check DuckDB @Engine clingo flag.
// Implemented: PerformIterationClosure, SelectAsRecord, iterations initialization, type_inference module.

use std::collections::{HashMap, HashSet};
use std::cell::RefCell;
use indexmap::IndexMap;

use crate::parser::{Json, JsonObject, CompilationMode};
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
    pub copy_to_file: Option<String>,
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

/// Enable direct usage of SQL strings as table names.
/// If table is `` `(...)` ``, strip the backtick-paren wrapper.
pub fn unquote_parenthesised(table: &str) -> String {
    if table.len() > 4 && table.starts_with("`(") && table.ends_with(")`") {
        table[2..table.len() - 2].to_string()
    } else {
        table.to_string()
    }
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
#[derive(Debug, Clone)]
pub struct IterationDef {
    pub predicates: Vec<String>,
    pub repetitions: i64,
    pub stop_signal: Option<String>,
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
// LogicaProgram — full program compilation (Python's `class LogicaProgram`)
// ---------------------------------------------------------------------------

/// Representing a Logica program. Can produce SQL for predicates.
///
/// This is the full-featured version matching Python's `LogicaProgram`,
/// including execution state, UDFs, grounding, exports, and flag substitution.
pub struct LogicaProgram {
    /// Raw rules before functor expansion (for Clingo).
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
    /// Dollar parameters found in the program.
    pub dollar_params: Vec<String>,
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
    /// Compilation mode (Synalog or Logica).
    pub mode: CompilationMode,
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
        Self::new_with_mode(parsed, table_aliases, user_flags, CompilationMode::Logica)
    }

    /// Create a new program with explicit compilation mode.
    pub fn new_with_mode(
        parsed: &Json,
        table_aliases: HashMap<String, String>,
        user_flags: HashMap<String, String>,
        mode: CompilationMode,
    ) -> CompileResult<Self> {
        Self::new_with_mode_and_engine(parsed, table_aliases, user_flags, mode, None)
    }

    /// Create a new program with explicit compilation mode and an optional
    /// engine override.
    ///
    /// When `engine_override` is `Some`, it takes precedence over any `@Engine`
    /// annotation in the source (and over the default engine). This lets callers
    /// select the SQL dialect programmatically instead of writing `@Engine(...)`.
    pub fn new_with_mode_and_engine(
        parsed: &Json,
        table_aliases: HashMap<String, String>,
        user_flags: HashMap<String, String>,
        mode: CompilationMode,
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
        let temp_annotations = Annotations::extract(&temp_rules, mode)?;
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

        // Extract dollar params
        let dollar_params = Self::extract_dollar_params_from_rules(&all_rules);

        // Extract annotations (recompute after functors added rules)
        let mut annotations = Annotations::extract(&rules, mode)?;
        // An explicit engine override wins over any `@Engine` annotation so that
        // dialect-dependent behavior (dataset selection, type-checking, SQLite
        // specifics) stays consistent with the dialect chosen above.
        if let Some(e) = engine_override {
            annotations.engine = e.to_string();
        }

        // Build flag values
        let mut flag_values = annotations.flag_values.clone();
        flag_values.extend(user_flags.clone());

        // Check dollar params are defined
        for param in &dollar_params {
            if !flag_values.contains_key(param) {
                return Err(CompileError::new(
                    format!("Parameter ${{{0}}} is undefined.", param),
                    format!("Undefined parameter: {}", param),
                ));
            }
        }

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

        Ok(LogicaProgram {
            raw_rules: raw_rule_list,
            preparsed_rules: unfolded_rules.clone(),
            rules,
            defined_predicates,
            library_predicates,
            dollar_params,
            table_aliases,
            annotations,
            flag_values,
            custom_udfs: IndexMap::new(),
            custom_udf_psql_type: HashMap::new(),
            custom_aggregation_semigroup,
            custom_udf_definitions: IndexMap::new(),
            execution: RefCell::new(None),
            allocator: RefCell::new(NamesAllocator::new()),
            user_flags,
            functors_args_of,
            typing_preamble,
            predicate_signatures,
            predicate_types,
            required_type_definitions: HashMap::new(),
            mode,
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
            return Some(type_to_psql(&ty));
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
        let operand_ty = || operand.map(|o| self.operand_type(o, body)).unwrap_or(Type::Number);
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
        Type::Number
    }

    /// Extract `${param}` dollar parameters from rule JSON trees.
    fn extract_dollar_params_from_rules(rules: &[Json]) -> Vec<String> {
        let mut params = HashSet::new();
        for rule in rules {
            Self::collect_dollar_params(rule, &mut params);
        }
        params.into_iter().collect()
    }

    fn collect_dollar_params(node: &Json, params: &mut HashSet<String>) {
        let mut stack: Vec<&Json> = vec![node];
        while let Some(current) = stack.pop() {
            match current {
                Json::Str(s) => {
                    Self::extract_dollar_params_from_string(s, params);
                }
                Json::Object(o) => {
                    for (_, v) in o.iter() {
                        stack.push(v);
                    }
                }
                Json::Array(a) => {
                    for v in a {
                        stack.push(v);
                    }
                }
                _ => {}
            }
        }
    }

    fn extract_dollar_params_from_string(s: &str, params: &mut HashSet<String>) {
        use regex::Regex;
        use std::sync::LazyLock;
        static RE: LazyLock<Regex> =
            LazyLock::new(|| Regex::new(r"\$\{(.*?)\}").unwrap());

        for cap in RE.captures_iter(s) {
            let p = &cap[1];
            // Exclude built-in date params
            if !p.starts_with("YYYY") && p != "MM" && p != "DD" {
                params.insert(p.to_string());
            }
        }
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
        NamesAllocator::with_custom_udfs(udfs)
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

                let is_injectable = rules.len() == 1
                    && !rules[0].as_object().contains_key("distinct_denoted")
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
                    let mut new_vars_map = HashMap::new();
                    let mut new_inv_vars_map: HashMap<String, (String, String)> = s.inv_vars_map
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
        self.formatted_predicate_sql_impl(name, None)
    }

    fn formatted_predicate_sql_impl(
        &self,
        name: &str,
        pagination: Option<&Pagination>,
    ) -> CompileResult<String> {
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

        // Apply flag substitution
        let sql = self.use_flags_as_parameters(&sql);

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

        // Flags comment
        if !exec_ref.flags_comment.is_empty() {
            result.push_str(&exec_ref.flags_comment);
        }

        // Preamble
        if !exec_ref.preamble.is_empty() {
            result.push_str(&self.use_flags_as_parameters(&exec_ref.preamble));
        }

        // Type definitions from type inference (only for engines that need explicit types)
        let engine = self.annotations.engine();
        let needs_type_definitions = engine == "duckdb" || engine == "psql";
        if needs_type_definitions && !self.typing_preamble.is_empty() {
            result.push_str(&self.typing_preamble);
        }

        // UDF definitions
        let udf_defs = exec_ref.needed_udf_definitions();
        if !udf_defs.is_empty() {
            result.push_str(&udf_defs.join("\n\n"));
            result.push_str("\n\n");
        }

        // Defines and exports
        if !exec_ref.defines_and_exports.is_empty() {
            result.push_str(&exec_ref.defines_and_exports.join("\n\n"));
            result.push_str("\n\n");
        }

        result.push_str(&format_sql(&sql));
        Ok(self.use_flags_as_parameters(&result))
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
        self.formatted_predicate_sql_impl(name, Some(pagination))
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

        let mut pagination_clause = String::new();
        if let Some(limit) = effective_limit {
            pagination_clause.push_str(&format!("\nLIMIT {}", limit));
        }
        if let Some(offset) = pagination.offset {
            if offset > 0 {
                pagination_clause.push_str(&format!("\nOFFSET {}", offset));
            }
        }

        if pagination_clause.is_empty() {
            query
        } else {
            format!(
                "SELECT * FROM (\n{}\n) AS _paginated{};",
                query.trim_end_matches(';'),
                pagination_clause
            )
        }
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
    pub fn formatted_predicate_sql_with_search(
        &self,
        name: &str,
        pattern: &str,
        pagination: &Pagination,
    ) -> CompileResult<String> {
        let columns = self.predicate_columns(name);
        if columns.is_empty() {
            return Err(CompileError::new(
                format!("No columns found for predicate '{}'.", name),
                "",
            ));
        }

        let base_sql = self.formatted_predicate_sql(name)?;
        let dialect = dialects::get(self.annotations.engine())?;

        // Build per-column regex conditions using the dialect
        let conditions: Vec<String> = columns
            .iter()
            .map(|col| {
                let cast_col = format!("CAST({} AS TEXT)", col);
                dialect.regex_match_condition(&cast_col, pattern)
            })
            .collect();

        let where_clause = conditions.join(" OR ");

        // Build effective limit
        let annotation_limit = self.annotations.limit_of(name);
        let effective_limit = match (pagination.limit, annotation_limit) {
            (Some(pl), Some(al)) => Some(pl.min(al as u64)),
            (Some(pl), None) => Some(pl),
            (None, Some(al)) => Some(al as u64),
            (None, None) => None,
        };

        let mut suffix = String::new();
        if let Some(limit) = effective_limit {
            suffix.push_str(&format!("\nLIMIT {}", limit));
        }
        if let Some(offset) = pagination.offset {
            if offset > 0 {
                suffix.push_str(&format!("\nOFFSET {}", offset));
            }
        }

        Ok(format!(
            "SELECT * FROM (\n{}\n) AS _searched\nWHERE {}{};",
            base_sql.trim_end_matches(';'),
            where_clause,
            suffix,
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

        let iterations: Vec<IterationDef> = {
            let exec = self.execution.borrow();
            let exec_ref = exec.as_ref().unwrap();
            exec_ref.iterations.values().cloned().collect()
        };

        for iteration in &iterations {
            let iteration_preds: HashSet<&str> = iteration.predicates.iter()
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

    /// Run flag substitution to fixed point (Python's `UseFlagsAsParameters`).
    pub fn use_flags_as_parameters(&self, sql: &str) -> String {
        let mut result = sql.to_string();
        let mut prev = String::new();
        let mut num_subs = 0;
        while result != prev {
            num_subs += 1;
            prev = result.clone();
            if num_subs > 100 {
                // Recursive flags — warn and break to avoid infinite loop
                eprintln!("[WARNING] Recursive flag references detected, stopping substitution");
                break;
            }
            for (flag, value) in &self.flag_values {
                result = result.replace(&format!("${{{}}}", flag), value);
            }
        }
        result
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
            let dependency_sql = self.use_flags_as_parameters(&dependency_sql);

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
                let stmt = self.use_flags_as_parameters(&stmt);

                exec_ref
                    .table_to_export_map
                    .insert(table.to_string(), stmt.clone());
                exec_ref.export_statements.push(stmt.clone());
                export_statement = Some(stmt);
            }
        }

        // Step 5: Build copy_to_file statement if specified (DuckDB file export)
        if let Some(ref copy_file) = ground.copy_to_file {
            let copy_stmt = format!(
                "COPY {} TO '{}' (FORMAT 'json', ARRAY true);",
                ground.table_name, copy_file
            );
            let mut exec = self.execution.borrow_mut();
            let exec_ref = exec.as_mut().unwrap();
            exec_ref.defines_and_exports.push(copy_stmt);
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

        Ok(unquote_parenthesised(table))
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
fn type_to_psql(t: &Type) -> String {
    match t {
        Type::Number => "numeric".to_string(),
        Type::String => "text".to_string(),
        Type::Bool => "bool".to_string(),
        Type::List(element) => format!("{}[]", type_to_psql(element)),
        // Any / Atomic / Record: fall back to numeric (best effort).
        _ => "numeric".to_string(),
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
