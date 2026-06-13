// Modified from: logica/compiler/universe.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

use std::cell::RefCell;
use std::collections::{HashMap, HashSet};
use crate::parser::{Json, CompilationMode};
use crate::compiler::{CompileResult, CompileError};
use crate::compiler::annotations::Annotations;
use crate::compiler::dialects::{self, Dialect};
use crate::compiler::expr_translate::SubqueryTranslator;
use crate::compiler::rule_translate;
use crate::compiler::universe::Logica;

/// A compiled Logica program ready to generate SQL.
///
/// Uses `RefCell` for interior mutability to match Python's lazy compilation
/// pattern where `TranslateTable` triggers CTE name allocation and dependency
/// compilation on-demand during `AsSql`.
pub struct LogicaProgram {
    /// (predicate_name, rule_json) for all non-annotation rules.
    rules: Vec<(String, Json)>,
    /// Set of all defined predicate names (non-annotation).
    defined_predicates: HashSet<String>,
    /// Parsed annotations.
    annotations: Annotations,
    /// SQL dialect.
    dialect: Box<dyn Dialect>,
    /// Flag values for FlagValue() function.
    flag_values: HashMap<String, String>,
    /// Table aliases for undefined predicates.
    table_aliases: HashMap<String, String>,
    /// Cache of already-compiled predicates.
    compiled_cache: RefCell<HashMap<String, String>>,
    /// Shared names allocator (like Python's execution-level allocator).
    allocator: RefCell<rule_translate::NamesAllocator>,
    /// Map: predicate_name → allocated CTE table name.
    table_to_defined_table_map: RefCell<HashMap<String, String>>,
    /// Map: allocated_cte_name → SQL implementing it.
    table_to_with_sql_map: RefCell<HashMap<String, String>>,
    /// Map: parent_predicate → list of dependency predicate names (ordering).
    with_dependencies: RefCell<HashMap<String, Vec<String>>>,
    /// Stack tracking which predicate is being compiled (for dependency edges).
    workflow_stack: RefCell<Vec<String>>,
    /// Dependency edges accumulated during compilation (for concertina).
    dependency_edges: RefCell<Vec<(String, String)>>,
    /// Data dependency edges (external/unknown tables).
    data_dependency_edges: RefCell<Vec<(String, String)>>,
    /// Predicate → transitive dependencies (from functors).
    args_of: HashMap<String, HashSet<String>>,
}

impl LogicaProgram {
    /// Create a new program from parsed JSON output.
    pub fn new(
        parsed: &Json,
        user_flags: HashMap<String, String>,
        table_aliases: HashMap<String, String>,
    ) -> CompileResult<Self> {
        let po = parsed.as_object();
        let raw_rule_list: Vec<Json> = po["rule"].as_array().to_vec();

        // Step 1: Unfold recursion (like Python's self.UnfoldRecursion(rules))
        // Get engine first for recursion parameters
        let temp_rules: Vec<(String, Json)> = raw_rule_list.iter().map(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str().to_string();
            (name, r.clone())
        }).collect();
        let temp_annotations = Annotations::extract(&temp_rules, CompilationMode::Logica)?;
        let engine = temp_annotations.engine().to_string();

        let unfolded_rules = crate::compiler::functors::unfold_recursion(&raw_rule_list, &engine)?;

        // Step 2: Run @Make functors (like Python's self.RunMakes(rules))
        let (extended_rules, args_of) = crate::compiler::functors::run_makes_with_deps(&unfolded_rules)?;

        // Step 3: Add library program rules
        let dialect = dialects::get(&engine)?;
        let lib_program = dialect.library_program();
        let mut all_rules = extended_rules;
        if !lib_program.is_empty() {
            if let Ok(lib_parsed) = crate::parser::parse_file(lib_program, None, &[]) {
                for r in lib_parsed.as_object()["rule"].as_array() {
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
        let annotations = Annotations::extract(&rules, CompilationMode::Logica)?;

        // Build defined predicates set (non-annotation)
        let defined_predicates: HashSet<String> = rules
            .iter()
            .filter(|(name, _)| !name.starts_with('@'))
            .map(|(name, _)| name.clone())
            .collect();

        // Merge flag values
        let mut flag_values = annotations.flag_values.clone();
        flag_values.extend(user_flags);

        Ok(LogicaProgram {
            rules,
            defined_predicates,
            annotations,
            dialect,
            flag_values,
            table_aliases,
            compiled_cache: RefCell::new(HashMap::new()),
            allocator: RefCell::new(rule_translate::NamesAllocator::new()),
            table_to_defined_table_map: RefCell::new(HashMap::new()),
            table_to_with_sql_map: RefCell::new(HashMap::new()),
            with_dependencies: RefCell::new(HashMap::new()),
            workflow_stack: RefCell::new(Vec::new()),
            dependency_edges: RefCell::new(Vec::new()),
            data_dependency_edges: RefCell::new(Vec::new()),
            args_of,
        })
    }

    /// Get the engine name.
    pub fn engine(&self) -> &str {
        self.annotations.engine()
    }

    /// Get all defined (non-annotation) predicate names.
    pub fn defined_predicates(&self) -> &HashSet<String> {
        &self.defined_predicates
    }

    /// Compile a single predicate to SQL (like Python's PredicateSql).
    /// Called both for the main predicate and for dependencies via TranslateWithedTable.
    pub fn predicate_sql(&self, name: &str) -> CompileResult<String> {
        // Check cache
        if let Some(cached) = self.compiled_cache.borrow().get(name) {
            return Ok(cached.clone());
        }

        // Check if grounded (external table)
        if let Some(ground) = self.annotations.ground(name) {
            return Ok(ground.table_name);
        }

        // Collect rules for this predicate
        let pred_rules: Vec<Json> = self.rules
            .iter()
            .filter(|(n, _)| n == name)
            .map(|(_, r)| r.clone())
            .collect();

        if pred_rules.is_empty() {
            return Err(CompileError::new(
                format!("Predicate '{}' is not defined", name),
                "",
            ));
        }

        let num_rules = pred_rules.len();

        // Apply ORDER BY and LIMIT
        let order_by = self.annotations.order_by_clause(name);
        let limit = self.annotations.limit_clause(name);

        let final_sql = if num_rules == 1 {
            let sql = self.single_rule_sql(&pred_rules[0])?;
            format!("{}{}{}", sql, order_by, limit)
        } else {
            // Multi-rule: Python embeds order_by/limit in the format string
            // 'SELECT * FROM (\n%s\n) AS UNUSED_TABLE_NAME %s %s'
            self.multi_rule_sql(name, &pred_rules, &order_by, &limit)?
        };

        // Cache the result
        self.compiled_cache.borrow_mut().insert(name.to_string(), final_sql.clone());

        Ok(final_sql)
    }

    /// Compile a single rule to SQL using the program's shared allocator.
    /// Matches Python's SingleRuleSql: extract → RunInjections → Eliminate → Constraints → AsSql
    fn single_rule_sql(&self, rule: &Json) -> CompileResult<String> {
        self.single_rule_sql_ext(rule, None, false)
    }

    /// Extended single rule SQL compilation with external vocabulary and combine support.
    fn single_rule_sql_ext(
        &self,
        rule: &Json,
        external_vocabulary: Option<&HashMap<String, String>>,
        is_combine: bool,
    ) -> CompileResult<String> {
        // Take the allocator out, give to extract_rule_structure
        let alloc = self.allocator.replace(rule_translate::NamesAllocator::new());

        // Decorate combine rule if needed
        let decorated;
        let rule_to_use = if is_combine {
            let var = {
                let mut a = alloc;
                let v = a.alloc_var();
                // Put alloc back temporarily
                *self.allocator.borrow_mut() = a;
                v
            };
            let alloc2 = self.allocator.replace(rule_translate::NamesAllocator::new());
            decorated = rule_translate::decorate_combine_rule(rule, &var);
            // Restore alloc for extraction
            *self.allocator.borrow_mut() = alloc2;
            &decorated
        } else {
            // Put alloc back for extraction
            *self.allocator.borrow_mut() = alloc;
            rule
        };

        let alloc = self.allocator.replace(rule_translate::NamesAllocator::new());
        let mut structure = rule_translate::extract_rule_structure_with_vocabulary(
            rule_to_use,
            Some(alloc),
            external_vocabulary.cloned(),
        )?;

        // Run injections: inline single-rule predicates (like Python's RunInjections)
        self.run_injections(&mut structure)?;

        // Finalize: eliminate internal variables + convert to constraints + GROUP BY
        rule_translate::finalize_rule_structure(&mut structure);
        structure.sort_unnestings()?;

        // Put allocator back
        let alloc_back = std::mem::replace(&mut structure.allocator, rule_translate::NamesAllocator::new());
        *self.allocator.borrow_mut() = alloc_back;

        let translator = ProgramSubqueryTranslator {
            program: self,
        };
        structure.as_sql(&translator, self.dialect.as_ref(), &self.flag_values)
    }

    /// Compile a predicate SQL with optional external vocabulary.
    fn predicate_sql_with_vocabulary(
        &self,
        name: &str,
        _external_vocabulary: Option<HashMap<String, String>>,
    ) -> CompileResult<String> {
        // For now, just call predicate_sql (external vocabulary for inline predicates)
        self.predicate_sql(name)
    }

    /// Inline single-rule predicates referenced in the body.
    /// Like Python's RunInjections.
    fn run_injections(&self, s: &mut rule_translate::RuleStructure) -> CompileResult<()> {
        let mut iterations = 0;
        loop {
            iterations += 1;
            if iterations > 100 {
                return Err(CompileError::new(
                    "Injection recursion too deep".to_string(), &s.full_rule_text));
            }

            let mut new_tables = indexmap::IndexMap::new();
            let mut changed = false;
            let old_tables: Vec<_> = s.tables.iter()
                .map(|(k, v)| (k.clone(), v.clone()))
                .collect();

            for (table_alias, predicate_name) in &old_tables {
                let rules: Vec<Json> = self.rules.iter()
                    .filter(|(n, _)| n == predicate_name)
                    .map(|(_, r)| r.clone())
                    .collect();

                let is_injectable = rules.len() == 1
                    && !rules[0].as_object().contains_key("distinct_denoted")
                    && self.annotations.ok_injection(predicate_name);

                if is_injectable {
                    // Extract the injected predicate's rule structure
                    let alloc = std::mem::replace(
                        &mut s.allocator,
                        rule_translate::NamesAllocator::new(),
                    );
                    let mut rs = rule_translate::extract_rule_structure(&rules[0], Some(alloc))?;
                    rs.eliminate_internal_variables_no_unfold();

                    // Take allocator back
                    s.allocator = std::mem::replace(
                        &mut rs.allocator,
                        rule_translate::NamesAllocator::new(),
                    );

                    // Add injected tables
                    for (k, v) in &rs.tables {
                        new_tables.insert(k.clone(), v.clone());
                    }

                    // InjectStructure: merge rs into s
                    s.vars_map.extend(rs.vars_map);
                    s.inv_vars_map.extend(rs.inv_vars_map);
                    s.vars_unification.extend(rs.vars_unification);
                    s.unnestings.extend(rs.unnestings);
                    s.constraints.extend(rs.constraints);
                    s.synonym_log.extend(rs.synonym_log);

                    // Handle variable mappings: replace table references
                    // Preserve inv_vars_map entries not in vars_map (e.g. unnesting vars)
                    let mut new_vars_map = HashMap::new();
                    let mut new_inv_vars_map: HashMap<String, (String, String)> = s.inv_vars_map
                        .iter()
                        .filter(|(_, (tbl, _))| tbl.is_empty()) // Keep unnesting entries
                        .map(|(k, v)| (k.clone(), v.clone()))
                        .collect();
                    for ((tbl, field), clause_var) in &s.vars_map {
                        if tbl != table_alias {
                            new_vars_map.insert(
                                (tbl.clone(), field.clone()),
                                clause_var.clone(),
                            );
                            new_inv_vars_map.insert(
                                clause_var.clone(),
                                (tbl.clone(), field.clone()),
                            );
                        } else {
                            // Variable from the injected table: unify with the
                            // injected predicate's SELECT expression
                            if let Some(select_expr) = rs.select.get(field.as_str()) {
                                s.vars_unification.push((
                                    Json::Object({
                                        let mut m = crate::parser::JsonObject::new();
                                        m.insert(
                                            "variable".into(),
                                            Json::Object({
                                                let mut vm = crate::parser::JsonObject::new();
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
                            }
                            // Variable removed from maps (it's being replaced)
                        }
                    }
                    s.vars_map = new_vars_map;
                    s.inv_vars_map = new_inv_vars_map;

                    changed = true;
                } else {
                    new_tables.insert(table_alias.clone(), predicate_name.clone());
                }
            }

            if !changed || s.tables == new_tables {
                break;
            }
            s.tables = new_tables;
        }
        Ok(())
    }

    /// Combine multiple rules with UNION ALL.
    /// Matches Python's formatting: Indent2 then another 2-space indent.
    fn multi_rule_sql(&self, _name: &str, rules: &[Json], order_by: &str, limit: &str) -> CompileResult<String> {
        let mut sql_parts = Vec::with_capacity(rules.len());

        for rule in rules {
            let sql = self.single_rule_sql(rule)?;
            // Indent2: 2-space indent (matching Python's Indent2)
            let indented: String = sql.split('\n')
                .map(|l| format!("  {}", l))
                .collect::<Vec<_>>()
                .join("\n");
            // Wrap in newlines: '\n%s\n' % Indent2(sql)
            sql_parts.push(format!("\n{}\n", indented));
        }

        // Another 2-space indent on each line (matching Python's list comprehension)
        // Use split('\n') not lines() to preserve trailing empty parts
        let parts: Vec<String> = sql_parts.iter()
            .map(|p| {
                p.split('\n')
                    .map(|l| format!("  {}", l))
                    .collect::<Vec<_>>()
                    .join("\n")
            })
            .collect();

        // Python: 'SELECT * FROM (\n%s\n) AS UNUSED_TABLE_NAME %s %s'
        Ok(format!(
            "SELECT * FROM (\n{}\n) AS UNUSED_TABLE_NAME {} {}",
            parts.join(" UNION ALL\n"),
            order_by,
            limit,
        ))
    }

    /// Translate a table that should be defined in a WITH clause.
    /// Like Python's TranslateWithedTable: allocates CTE name, compiles dependency,
    /// records WITH dependency ordering.
    fn translate_withed_table(&self, table: &str) -> CompileResult<String> {
        let parent_table = {
            let stack = self.workflow_stack.borrow();
            stack.last().cloned().unwrap_or_default()
        };

        if !self.table_to_defined_table_map.borrow().contains_key(table) {
            // Allocate CTE name using shared allocator
            let table_name = self.allocator.borrow_mut().alloc_table(Some(table));
            self.table_to_defined_table_map.borrow_mut()
                .insert(table.to_string(), table_name.clone());

            // Compile the dependency
            let implementation = self.predicate_sql(table)?;
            self.table_to_with_sql_map.borrow_mut()
                .insert(table_name, implementation);
        }

        // Record dependency ordering (deepest first)
        if !parent_table.is_empty() {
            let mut deps = self.with_dependencies.borrow_mut();
            let dep_list = deps.entry(parent_table).or_default();
            if !dep_list.contains(&table.to_string()) {
                dep_list.push(table.to_string());
            }
        }

        Ok(self.table_to_defined_table_map.borrow()[table].clone())
    }

    /// Generate the full SQL for a predicate with WITH clauses.
    /// Matches Python's FormattedPredicateSql flow:
    /// 1. Compile main predicate (triggers lazy CTE allocation via TranslateTable)
    /// 2. Generate WITH prefix from accumulated maps
    pub fn formatted_predicate_sql(&self, name: &str) -> CompileResult<String> {
        // Reset compilation state for fresh compilation
        self.compiled_cache.borrow_mut().clear();
        *self.allocator.borrow_mut() = rule_translate::NamesAllocator::new();
        self.table_to_defined_table_map.borrow_mut().clear();
        self.table_to_with_sql_map.borrow_mut().clear();
        self.with_dependencies.borrow_mut().clear();
        self.workflow_stack.borrow_mut().clear();
        self.dependency_edges.borrow_mut().clear();
        self.data_dependency_edges.borrow_mut().clear();

        // Push the main predicate onto the workflow stack
        self.workflow_stack.borrow_mut().push(name.to_string());

        // Step 1: Compile the main predicate SQL (like Python's PredicateSql call)
        // This triggers lazy compilation of dependencies via translate_table → translate_withed_table
        let main_sql = self.predicate_sql(name)?;

        // Step 2: Generate WITH prefix (like Python's GenerateWithClauses)
        let with_signature = self.generate_with_clauses(name);

        let sql = if let Some(with_sig) = with_signature {
            format!("{}\n{}", with_sig, main_sql)
        } else {
            main_sql
        };

        // Add trailing semicolon (like Python's FormatSql)
        Ok(format!("{};", sql))
    }

    /// Generate WITH ... prefix from accumulated dependency maps.
    /// Like Python's GenerateWithClauses.
    fn generate_with_clauses(&self, predicate_name: &str) -> Option<String> {
        let deps = self.with_dependencies.borrow();
        let dependencies = deps.get(predicate_name)?;

        if dependencies.is_empty() {
            return None;
        }

        let defined_map = self.table_to_defined_table_map.borrow();
        let with_sql_map = self.table_to_with_sql_map.borrow();

        let mut with_bodies = Vec::new();
        for dep in dependencies {
            if let Some(table_name) = defined_map.get(dep.as_str()) {
                if let Some(sql) = with_sql_map.get(table_name) {
                    with_bodies.push(format!("{} AS ({})", table_name, sql));
                }
            }
        }

        if with_bodies.is_empty() {
            return None;
        }

        Some(format!("WITH {}", with_bodies.join(",\n")))
    }

    /// Compile a predicate and build a `Logica` execution object for concertina.
    ///
    /// This combines `formatted_predicate_sql` with building the execution state
    /// needed by the concertina workflow engine. Like Python's pattern:
    ///   `program.FormattedPredicateSql(name)` → then read `program.execution`.
    pub fn compile_predicate_execution(&self, name: &str) -> CompileResult<(String, Logica)> {
        let sql = self.formatted_predicate_sql(name)?;

        let mut execution = Logica::new();
        execution.main_predicate = Some(name.to_string());
        execution.preamble = self.annotations.preamble();
        execution.dependency_edges = self.dependency_edges.borrow().clone();
        execution.data_dependency_edges = self.data_dependency_edges.borrow().clone();
        execution.table_to_defined_table_map = self.table_to_defined_table_map.borrow().clone();
        execution.table_to_with_sql_map = self.table_to_with_sql_map.borrow().clone();
        execution.dependencies_of = self.args_of.clone();
        execution.iterations = self.annotations.iterations()?;

        // table_to_export_map: the main predicate's full SQL
        execution.table_to_export_map.insert(name.to_string(), sql.clone());

        Ok((sql, execution))
    }

    /// Get the annotations.
    pub fn annotations(&self) -> &Annotations {
        &self.annotations
    }
}

/// Subquery translator that uses the program to resolve table references.
/// Like Python's SubqueryTranslator.TranslateTable.
struct ProgramSubqueryTranslator<'a> {
    program: &'a LogicaProgram,
}

impl<'a> SubqueryTranslator for ProgramSubqueryTranslator<'a> {
    fn translate_table(
        &self,
        predicate: &str,
        external_vocabulary: Option<&HashMap<String, String>>,
    ) -> CompileResult<String> {
        // Built-in temporal concepts: inline a one-row relation using the
        // dialect's native current-date/timestamp SQL. No runtime table needed.
        match predicate {
            "Today" => return Ok(self.program.dialect.today_relation_sql()),
            "Now" => return Ok(self.program.dialect.now_relation_sql()),
            _ => {}
        }

        // Check table aliases
        if let Some(alias) = self.program.table_aliases.get(predicate) {
            return Ok(alias.clone());
        }

        // Check grounded — record dependency edge.
        if let Some(ground) = self.program.annotations.ground(predicate) {
            let parent = self.program.workflow_stack.borrow().last().cloned().unwrap_or_default();
            if !parent.is_empty() {
                self.program.dependency_edges.borrow_mut()
                    .push((predicate.to_string(), parent));
            }
            return Ok(ground.table_name);
        }

        // Check if already has an allocated CTE name
        if self.program.table_to_defined_table_map.borrow().contains_key(predicate) {
            return Ok(self.program.table_to_defined_table_map.borrow()[predicate].clone());
        }

        // If defined predicate with @With: lazily allocate CTE name and compile
        // (like Python's TranslateTable → TranslateWithedTable)
        if self.program.defined_predicates.contains(predicate) {
            if self.program.annotations.use_with(predicate) {
                return self.program.translate_withed_table(predicate);
            }
            // Non-with predicate: inline subquery
            let sql = self.program.predicate_sql_with_vocabulary(
                predicate, external_vocabulary.cloned())?;
            return Ok(format!("({})", sql));
        }

        // Unknown predicate — treat as raw table name.
        // Record data dependency edge (like Python's data_dependency_edges).
        let parent = self.program.workflow_stack.borrow().last().cloned().unwrap_or_default();
        if !parent.is_empty() {
            self.program.data_dependency_edges.borrow_mut()
                .push((predicate.to_string(), parent));
        }
        Ok(predicate.to_string())
    }

    fn translate_rule(
        &self,
        rule: &Json,
        external_vocabulary: &HashMap<String, String>,
        is_combine: bool,
    ) -> CompileResult<String> {
        self.program.single_rule_sql_ext(rule, Some(external_vocabulary), is_combine)
    }
}

#[cfg(test)]
#[path = "program_test.rs"]
mod program_test;
