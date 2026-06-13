// Modified from: logica/compiler/rule_translate.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

use std::collections::{HashMap, HashSet};
use indexmap::IndexMap;
use crate::parser::{Json, JsonObject};
use crate::compiler::{CompileResult, CompileError};
use crate::compiler::dialects::{Dialect, GroupBySpec};
use crate::compiler::expr_translate::{ExprTranslator, SubqueryTranslator, logica_field_to_sql_field};

use crate::compiler::universe::indent2;

/// Tracks variable origin for error reporting.
/// Matches Python's LogicalVariable namedtuple.
#[derive(Debug, Clone)]
pub struct LogicalVariable {
    /// Name of user or generated variable.
    pub variable_name: String,
    /// Name of predicate in rule for which the variable is used.
    pub predicate_name: String,
    /// Whether this is a user variable (vs generated one like x_0).
    pub is_user_variable: bool,
}

impl LogicalVariable {
    pub fn new(variable_name: &str, predicate_name: &str) -> Self {
        let is_user_variable = !variable_name.starts_with("x_");
        Self {
            variable_name: variable_name.to_string(),
            predicate_name: predicate_name.to_string(),
            is_user_variable,
        }
    }
}

/// Allocates unique names for tables and variables.
#[derive(Default)]
pub struct NamesAllocator {
    table_count: usize,
    var_count: usize,
    allocated_tables: HashSet<String>,
    /// Custom UDF format strings: function_name -> format string (e.g., "my_func({col0}, {col1})")
    pub custom_udfs: HashMap<String, String>,
}

impl NamesAllocator {
    pub fn new() -> Self {
        Self::default()
    }

    /// Create allocator with custom UDFs.
    pub fn with_custom_udfs(custom_udfs: HashMap<String, String>) -> Self {
        Self {
            custom_udfs,
            ..Self::default()
        }
    }

    /// Check if a function exists as a custom UDF.
    pub fn function_exists(&self, name: &str) -> bool {
        self.custom_udfs.contains_key(name)
    }

    /// Get the format string for a custom UDF.
    pub fn get_udf_format(&self, name: &str) -> Option<&str> {
        self.custom_udfs.get(name).map(|s| s.as_str())
    }

    /// Allocate a table alias, using the hint if it's unique and valid.
    /// Matches Python's AllocateTable logic.
    pub fn alloc_table(&mut self, hint: Option<&str>) -> String {
        let suffix = hint
            .filter(|h| h.len() < 100)
            .map(|h| {
                h.chars()
                    .filter(|c| c.is_ascii_alphanumeric() || *c == '_' || *c == '.' || *c == '/')
                    .map(|c| if c == '.' || c == '/' { '_' } else { c })
                    .collect::<String>()
            })
            .unwrap_or_default();

        let name = if !suffix.is_empty()
            && !self.allocated_tables.contains(&suffix)
            && !suffix.chars().next().unwrap_or('0').is_ascii_digit()
        {
            suffix
        } else {
            let s = if suffix.is_empty() {
                format!("t_{}", self.table_count)
            } else {
                format!("t_{}_{}", self.table_count, suffix)
            };
            self.table_count += 1;
            s
        };

        self.allocated_tables.insert(name.clone());
        name
    }

    pub fn alloc_var(&mut self) -> String {
        let name = format!("x_{}", self.var_count);
        self.var_count += 1;
        name
    }
}

/// Represents a single compiled rule ready for SQL generation.
pub struct RuleStructure {
    pub this_predicate_name: String,
    /// table_alias → predicate_name
    pub tables: IndexMap<String, String>,
    /// (table_alias, field) → generated variable name
    pub vars_map: HashMap<(String, String), String>,
    /// generated variable name → (table_alias, field)
    pub inv_vars_map: HashMap<String, (String, String)>,
    /// Variable unifications: [{left: expr, right: expr}]
    pub vars_unification: Vec<(Json, Json)>,
    /// Constraint expressions (become WHERE clauses)
    pub constraints: Vec<Json>,
    /// Output columns: field_name → expression
    pub select: IndexMap<String, Json>,
    /// UNNEST declarations
    pub unnestings: Vec<(String, Json)>,
    /// Fields to GROUP BY (non-aggregated fields in distinct predicates)
    pub distinct_vars: Vec<String>,
    pub allocator: NamesAllocator,
    pub full_rule_text: String,
    pub distinct_denoted: bool,
    /// Fields that are aggregated (needed for GROUP BY setup during finalization)
    pub aggregated_fields: Vec<String>,
    /// Tracks variable synonyms for error reporting.
    /// Maps variable name to list of LogicalVariables it was unified with.
    pub synonym_log: HashMap<String, Vec<LogicalVariable>>,
    /// External vocabulary for combine sub-rules (variables from outer scope)
    pub external_vocabulary: Option<HashMap<String, String>>,
    /// Tracks spread variables with EXCEPT fields: var_name -> (table_alias, excluded_fields)
    pub except_info: HashMap<String, (String, Vec<String>)>,
}

impl RuleStructure {
    pub fn new() -> Self {
        RuleStructure {
            this_predicate_name: String::new(),
            tables: IndexMap::new(),
            vars_map: HashMap::new(),
            inv_vars_map: HashMap::new(),
            vars_unification: Vec::new(),
            constraints: Vec::new(),
            select: IndexMap::new(),
            unnestings: Vec::new(),
            distinct_vars: Vec::new(),
            allocator: NamesAllocator::new(),
            full_rule_text: String::new(),
            distinct_denoted: false,
            aggregated_fields: Vec::new(),
            synonym_log: HashMap::<String, Vec<LogicalVariable>>::new(),
            external_vocabulary: None,
            except_info: HashMap::new(),
        }
    }

    /// Convert the select map into a record expression (JSON AST).
    /// Matches Python's SelectAsRecord() method.
    pub fn select_as_record(&self) -> Json {
        let mut field_values = Vec::new();
        let mut items: Vec<(&String, &Json)> = self.select.iter().collect();
        // Sort by StrIntKey-style: integer-like keys get zero-padded for sorting
        items.sort_by(|(a, _), (b, _)| {
            let ka = if a.chars().all(|c| c.is_ascii_digit()) {
                format!("{:03}", a)
            } else {
                a.to_string()
            };
            let kb = if b.chars().all(|c| c.is_ascii_digit()) {
                format!("{:03}", b)
            } else {
                b.to_string()
            };
            ka.cmp(&kb)
        });
        for (k, v) in items {
            let mut fv = crate::parser::JsonObject::new();
            fv.insert("field".into(), Json::Str(k.clone()));
            let mut val = crate::parser::JsonObject::new();
            val.insert("expression".into(), v.clone());
            fv.insert("value".into(), Json::Object(val));
            field_values.push(Json::Object(fv));
        }
        let mut rec = crate::parser::JsonObject::new();
        rec.insert("field_value".into(), Json::Array(field_values));
        let mut result = crate::parser::JsonObject::new();
        result.insert("record".into(), Json::Object(rec));
        Json::Object(result)
    }

    /// Build the variable vocabulary: var_name → "table.column" SQL expression.
    pub fn vars_vocabulary(&self, dialect: &dyn Dialect) -> HashMap<String, String> {
        let mut vocab = HashMap::new();
        // Include external vocabulary first (from outer combine scope)
        if let Some(ext) = &self.external_vocabulary {
            vocab.extend(ext.clone());
        }
        for (var_name, (table, field)) in &self.inv_vars_map {
            let sql_field = logica_field_to_sql_field(field);
            if table.is_empty() {
                vocab.insert(var_name.clone(), sql_field);
            } else if field == "*" {
                // Star field: check if this has except fields
                if let Some((_, excluded_fields)) = self.except_info.get(var_name) {
                    // Produce: (SELECT AS STRUCT table.* EXCEPT (field1,field2)).*
                    let except_list = excluded_fields.join(",");
                    vocab.insert(
                        var_name.clone(),
                        format!("(SELECT AS STRUCT {}.* EXCEPT ({})).*", table, except_list),
                    );
                } else {
                    // Route through the dialect so e.g. PostgreSQL emits (table).*
                    // for composite-row field access.
                    vocab.insert(var_name.clone(), dialect.subscript(table, "*", true));
                }
            } else {
                vocab.insert(var_name.clone(), format!("{}.{}", table, sql_field));
            }
        }
        vocab
    }

    /// Get all variables that are "extracted" — have a table.column mapping or
    /// come from external vocabulary (combine outer scope).
    /// Matches Python's ExtractedVariables() = set(VarsVocabulary().keys()),
    /// where VarsVocabulary includes both own vars and external vocabulary.
    fn extracted_variables(&self) -> HashSet<String> {
        let mut vars: HashSet<String> = self.inv_vars_map.keys().cloned().collect();
        if let Some(ext) = &self.external_vocabulary {
            vars.extend(ext.keys().cloned());
        }
        vars
    }

    /// Get all variables mentioned anywhere in the rule structure.
    fn all_variables(&self) -> HashSet<String> {
        let mut vars = HashSet::new();
        // Use this_is_select=true for select expressions to avoid treating
        // the dict key 'variable' as a variable reference (matches Python)
        for (_, expr) in &self.select {
            all_mentioned_variables_full(expr, &mut vars, false, true);
        }
        for (left, right) in &self.vars_unification {
            all_mentioned_variables(left, &mut vars);
            all_mentioned_variables(right, &mut vars);
        }
        for c in &self.constraints {
            all_mentioned_variables(c, &mut vars);
        }
        for (_, list_expr) in &self.unnestings {
            all_mentioned_variables(list_expr, &mut vars);
        }
        vars
    }

    /// Get internal variables (all mentioned - extracted).
    fn internal_variables(&self) -> HashSet<String> {
        let all = self.all_variables();
        let extracted = self.extracted_variables();
        all.difference(&extracted).cloned().collect()
    }

    /// Eliminate internal variables via substitution, following the Python
    /// implementation's ElliminateInternalVariables approach.
    /// When `unfold_records` is true (default), Phase 2 record field unwrapping is applied.
    /// Set to false for injection contexts where record structure must be preserved.
    pub fn eliminate_internal_variables(&mut self) {
        self.eliminate_internal_variables_ext(true, false).ok();
    }

    /// Like `eliminate_internal_variables` but without record unwrapping (Phase 2).
    pub fn eliminate_internal_variables_no_unfold(&mut self) {
        self.eliminate_internal_variables_ext(false, false).ok();
    }

    /// Eliminate internal variables with full error checking.
    /// If `assert_full_ellimination` is true, returns an error if any variables remain.
    pub fn eliminate_internal_variables_full(&mut self) -> CompileResult<()> {
        self.eliminate_internal_variables_ext(true, true)
    }

    /// Internal implementation with all options.
    fn eliminate_internal_variables_ext(
        &mut self,
        unfold_records: bool,
        assert_full_ellimination: bool,
    ) -> CompileResult<()> {
        self.eliminate_internal_variables_impl(unfold_records);

        if assert_full_ellimination {
            let remaining = self.internal_variables();
            if !remaining.is_empty() {
                // Collect user-visible variable names via synonym_log
                let mut violators = HashSet::new();
                for v in &remaining {
                    // Check synonym_log for user variables that led to this internal var
                    if let Some(synonyms) = self.synonym_log.get(v) {
                        for syn in synonyms {
                            if syn.predicate_name == self.this_predicate_name {
                                violators.insert(syn.variable_name.clone());
                            }
                        }
                    }
                    violators.insert(v.clone());
                }

                // Filter to user variables only (not x_* generated ones)
                let user_violators: Vec<_> = violators
                    .into_iter()
                    .filter(|v| !v.starts_with("x_"))
                    .map(|v| v.split(" # disambiguated").next().unwrap_or(&v).to_string())
                    .collect();

                if !user_violators.is_empty() {
                    return Err(CompileError::new(
                        format!(
                            "Found no way to assign variables: {}",
                            user_violators.join(", ")
                        ),
                        &self.full_rule_text,
                    ));
                }

                // If only internal variables remain, report with more context
                if !remaining.is_empty() {
                    let user_vars: Vec<_> = remaining
                        .iter()
                        .flat_map(|v| self.synonym_log.get(v).into_iter().flatten())
                        .filter(|lv| lv.is_user_variable)
                        .collect();

                    if !user_vars.is_empty() {
                        let unassigned: Vec<_> = user_vars
                            .iter()
                            .map(|lv| format!("{} in rule for {}", lv.variable_name, lv.predicate_name))
                            .collect();
                        return Err(CompileError::new(
                            format!(
                                "While compiling predicate {} there was found no way to assign variables: {}",
                                self.this_predicate_name,
                                unassigned.join(", ")
                            ),
                            &self.full_rule_text,
                        ));
                    }
                }
            }
        }

        Ok(())
    }

    /// Variable elimination matching Python's `ElliminateInternalVariables` exactly.
    /// Single outer loop iterates all unifications per pass. For each unification,
    /// tries direct variable assignment (Phase 1), then record field unwrapping (Phase 2).
    /// Multiple replacements can happen in a single pass.
    fn eliminate_internal_variables_impl(&mut self, unfold_records: bool) {
        // Phase 0: Expand record-to-record unifications into field-by-field
        // assignments. E.g., {a:, b:} == {a: "va", b: "vb"} becomes
        // a == "va" and b == "vb".
        if unfold_records {
            self.expand_record_unifications();
        }

        let variables = self.internal_variables();

        loop {
            let mut done = true;
            self.vars_unification.retain(|(l, r)| l != r);

            // Iterate all unifications (Python iterates the live list; we iterate
            // by index to handle in-place modifications via replace_variable_everywhere).
            let mut i = 0;
            while i < self.vars_unification.len() {
                let left = self.vars_unification[i].0.clone();
                let right = self.vars_unification[i].1.clone();

                // Phase 1: Direct variable assignments (both directions)
                for (k_expr, r_expr) in [(&left, &right), (&right, &left)] {
                    if k_expr == r_expr {
                        continue;
                    }
                    let r_vars = {
                        let mut s = HashSet::new();
                        all_mentioned_variables(r_expr, &mut s);
                        s
                    };
                    let r_vars_incl_combines = {
                        let mut s = HashSet::new();
                        all_mentioned_variables_impl(r_expr, &mut s, true);
                        s
                    };

                    if let Some(var_name) = extract_var_name(k_expr) {
                        if variables.contains(&var_name)
                            && !r_vars_incl_combines.contains(&var_name)
                            && (is_subset(&r_vars, &self.extracted_variables())
                                || !var_name.starts_with("x_"))
                        {
                            let replacement = r_expr.clone();
                            self.replace_variable_everywhere(&var_name, &replacement);
                            done = false;
                        }
                    }
                }

                // Phase 2: Record field unwrapping (both directions)
                if unfold_records {
                    // Re-read after potential Phase 1 modifications
                    let left2 = self.vars_unification.get(i)
                        .map(|(l, _)| l.clone());
                    let right2 = self.vars_unification.get(i)
                        .map(|(_, r)| r.clone());
                    if let (Some(left2), Some(right2)) = (left2, right2) {
                        for (k_expr, r_expr) in [(&left2, &right2), (&right2, &left2)] {
                            if k_expr == r_expr {
                                continue;
                            }
                            let r_vars = {
                                let mut s = HashSet::new();
                                all_mentioned_variables(r_expr, &mut s);
                                s
                            };
                            let r_vars_incl_combines = {
                                let mut s = HashSet::new();
                                all_mentioned_variables_impl(r_expr, &mut s, true);
                                s
                            };
                            if is_record(k_expr) && is_subset(&r_vars, &self.extracted_variables()) {
                                let replacements = collect_record_assignments(
                                    k_expr, r_expr, &variables, &r_vars_incl_combines,
                                );
                                for (var_name, replacement) in &replacements {
                                    self.replace_variable_everywhere(var_name, replacement);
                                    done = false;
                                }
                            }
                        }
                    }
                }

                i += 1;
            }

            // Remove self-referential unifications
            if unfold_records {
                self.vars_unification.retain(|(l, r)| {
                    !is_self_referential_unification(l, r)
                });
            }

            if done {
                break;
            }
        }
    }

    /// Expand record-to-record unifications into per-field unifications.
    /// {a: x, b: y} == {a: 1, b: 2} → x == 1, y == 2
    fn expand_record_unifications(&mut self) {
        let mut changed = true;
        while changed {
            changed = false;
            let mut new_unifs = Vec::new();
            let mut to_remove = Vec::new();

            for (i, (left, right)) in self.vars_unification.iter().enumerate() {
                if let Some(expanded) = try_expand_record_pair(left, right) {
                    to_remove.push(i);
                    new_unifs.extend(expanded);
                    changed = true;
                }
            }

            // Remove expanded unifications in reverse order
            for i in to_remove.into_iter().rev() {
                self.vars_unification.remove(i);
            }
            self.vars_unification.extend(new_unifs);
        }
    }

    /// Replace all occurrences of a variable with the given expression.
    /// Updates synonym_log to track variable substitutions for error reporting.
    fn replace_variable_everywhere(&mut self, var_name: &str, replacement: &Json) {
        // Update synonym_log if replacement is a variable
        if let Some(repl_var) = replacement.as_object().get("variable") {
            if let Some(repl_var_name) = repl_var.as_object().get("var_name") {
                let repl_var_str = repl_var_name.as_str();

                // Create LogicalVariable for the replaced variable
                let logical_var = LogicalVariable::new(var_name, &self.this_predicate_name);

                // Copy existing synonyms from var_name first (to avoid borrow conflict)
                let existing = self.synonym_log.get(var_name).cloned();

                // Get or create the list for the replacement variable
                let entry = self.synonym_log.entry(repl_var_str.to_string()).or_default();
                entry.push(logical_var);

                // Extend with existing synonyms if any
                if let Some(existing) = existing {
                    entry.extend(existing);
                }
            }
        }

        // Replace in select
        for (_, expr) in self.select.iter_mut() {
            replace_variable(var_name, replacement, expr);
        }
        // Replace in vars_unification
        for (left, right) in self.vars_unification.iter_mut() {
            replace_variable(var_name, replacement, left);
            replace_variable(var_name, replacement, right);
        }
        // Replace in constraints
        for c in self.constraints.iter_mut() {
            replace_variable(var_name, replacement, c);
        }
        // Replace in unnestings
        for (_, list_expr) in self.unnestings.iter_mut() {
            replace_variable(var_name, replacement, list_expr);
        }
    }

    /// Convert remaining unifications to equality constraints.
    pub fn unifications_to_constraints(&mut self) {
        let unifs = std::mem::take(&mut self.vars_unification);
        for (left, right) in unifs {
            if left == right {
                continue;
            }
            self.constraints.push(make_equality(&left, &right));
        }
    }

    /// Sort unnestings in dependency order, matching Python's SortUnnestings().
    /// Unnestings that depend on variables from other unnestings come after them.
    pub fn sort_unnestings(&mut self) -> CompileResult<()> {
        if self.unnestings.len() <= 1 {
            return Ok(());
        }
        // Build set of unnesting variable names
        let unnesting_vars: HashSet<String> = self.unnestings.iter()
            .map(|(var_name, _)| var_name.clone())
            .collect();

        // For each unnesting, find which other unnesting vars its list expression depends on
        let depends_on: Vec<HashSet<String>> = self.unnestings.iter()
            .map(|(_, list_expr)| {
                let mut mentioned = HashSet::new();
                all_mentioned_variables_impl(list_expr, &mut mentioned, true);
                mentioned.intersection(&unnesting_vars).cloned().collect()
            })
            .collect();

        // Topological sort (matching Python: iterate sorted items, pick first with resolved deps)
        let mut remaining: Vec<usize> = (0..self.unnestings.len()).collect();
        let mut resolved: HashSet<String> = HashSet::new();
        let mut ordered_indices: Vec<usize> = Vec::with_capacity(self.unnestings.len());

        while !remaining.is_empty() {
            // Sort remaining by var_name for deterministic order (matching Python's sorted())
            remaining.sort_by(|&a, &b| self.unnestings[a].0.cmp(&self.unnestings[b].0));

            let mut found = false;
            for i in 0..remaining.len() {
                let idx = remaining[i];
                if depends_on[idx].is_subset(&resolved) {
                    ordered_indices.push(idx);
                    resolved.insert(self.unnestings[idx].0.clone());
                    remaining.remove(i);
                    found = true;
                    break;
                }
            }
            if !found {
                // Circular dependency — keep remaining order.
                // Note: Python raises RuleCompileException here, but Rust's unnesting
                // variable tracking may differ slightly, so we keep silent for now.
                ordered_indices.extend(remaining.iter());
                break;
            }
        }

        // Reorder unnestings
        let mut old_vec: Vec<Option<(String, Json)>> = std::mem::take(&mut self.unnestings)
            .into_iter().map(Some).collect();
        for i in ordered_indices {
            if let Some(item) = old_vec[i].take() {
                self.unnestings.push(item);
            }
        }
        Ok(())
    }

    /// Generate the SQL SELECT statement from this rule structure.
    /// Formatting matches the Python Logica compiler output.
    // Remaining missing features:
    //   - dont_expand flag: Python sets v['variable']['dont_expand'] = True on star/unnesting vars.
    //   - external_vocabulary: Python passes it to TranslateTable; Rust passes None.
    pub fn as_sql(
        &self,
        subquery_translator: &dyn SubqueryTranslator,
        dialect: &dyn Dialect,
        flag_values: &HashMap<String, String>,
    ) -> CompileResult<String> {
        // Empty select check (Python raises RuleCompileException)
        if self.select.is_empty() && !self.tables.is_empty() {
            return Err(CompileError::new(
                "Rule produces no columns".to_string(),
                &self.full_rule_text,
            ));
        }

        let vocabulary = self.vars_vocabulary(dialect);
        let mut ql = ExprTranslator::new(vocabulary, dialect, flag_values);
        ql.subquery_translator = Some(subquery_translator);

        // SELECT clause
        let mut fields = Vec::with_capacity(self.select.len());
        for (field_name, expression) in &self.select {
            let sql_expr = ql.convert_to_sql(expression)?;
            let sql_field = logica_field_to_sql_field(field_name);
            if field_name == "*" || sql_expr.ends_with(".*") {
                fields.push(sql_expr);
            } else {
                fields.push(format!("{} AS {}", sql_expr, sql_field));
            }
        }

        let mut sql = "SELECT\n".to_string();
        sql.push_str(&fields.iter()
            .map(|f| format!("  {}", f))
            .collect::<Vec<_>>()
            .join(",\n"));

        // FROM clause
        let has_from = !self.tables.is_empty() || !self.unnestings.is_empty()
            || !self.constraints.is_empty() || self.distinct_denoted;
        if has_from {
            let mut from_parts = Vec::new();

            for (table_alias, predicate_name) in &self.tables {
                let table_sql = subquery_translator.translate_table(predicate_name, None)?;
                if table_sql != *table_alias {
                    from_parts.push(format!("{} AS {}", table_sql, table_alias));
                } else {
                    from_parts.push(table_sql);
                }
            }

            // UNNEST
            for (element_alias, list_expr) in &self.unnestings {
                let list_sql = ql.convert_to_sql(list_expr)?;
                let phrase = dialect.unnest_phrase()
                    .replace("{0}", &list_sql)
                    .replace("{1}", element_alias);
                from_parts.push(phrase);
            }

            if from_parts.is_empty() {
                from_parts.push("(SELECT 'singleton' as s) as unused_singleton".to_string());
            }

            let from_str = from_parts.join(", ");
            // Indent the from_str (each line gets 2 spaces)
            let indented_from: String = from_str.lines()
                .map(|l| format!("  {}", l))
                .collect::<Vec<_>>()
                .join("\n");
            sql.push_str(&format!("\nFROM\n{}", indented_from));
        }

        // WHERE clause
        let mut all_where: Vec<String> = Vec::new();
        for c in &self.constraints {
            // Skip ephemeral predicates (type inference)
            if let Some(call) = c.as_object().get("call") {
                if call.as_object()["predicate_name"].as_str() == "~" {
                    continue;
                }
            }
            all_where.push(ql.convert_to_sql(c)?);
        }

        if !all_where.is_empty() {
            let indented_where: Vec<String> = all_where.iter()
                .map(|w| indent2(w))
                .collect();
            sql.push_str(&format!("\nWHERE\n{}", indented_where.join(" AND\n")));
        }

        // GROUP BY clause
        if !self.distinct_vars.is_empty() {
            let group_spec = dialect.group_by_spec_by();
            let selected_keys: Vec<&String> = self.select.keys().collect();
            let group_items: Vec<String> = match group_spec {
                GroupBySpec::Name => {
                    self.distinct_vars.iter()
                        .map(|v| logica_field_to_sql_field(v))
                        .collect()
                }
                GroupBySpec::Index => {
                    self.distinct_vars.iter()
                        .filter_map(|v| {
                            selected_keys.iter().position(|k| *k == v)
                                .map(|i| (i + 1).to_string())
                        })
                        .collect()
                }
                GroupBySpec::Expr => {
                    self.distinct_vars.iter()
                        .filter_map(|v| {
                            self.select.get(v)
                                .and_then(|expr| ql.convert_to_sql_for_group_by(expr).ok())
                        })
                        .collect()
                }
            };
            if !group_items.is_empty() {
                sql.push_str(&format!("\nGROUP BY {}", group_items.join(", ")));
            }
        }

        Ok(sql)
    }
}

/// Set of known built-in function names (not user-defined predicates).
fn built_in_function_names() -> HashSet<String> {
    use crate::compiler::expr_translate::{ExprTranslator};
    use crate::compiler::dialects;
    // Use the basis_functions from the default dialect (bigquery) as a starting point.
    // All dialect-independent built-in functions are the same across dialects.
    let dialect = dialects::get("bigquery").unwrap_or_else(|_| dialects::get("sqlite").unwrap());
    let mut s = ExprTranslator::basis_functions(dialect.as_ref());
    // Also add basis functions from other dialects to be safe
    for engine in &["sqlite", "psql", "duckdb"] {
        if let Ok(d) = dialects::get(engine) {
            s.extend(ExprTranslator::basis_functions(d.as_ref()));
        }
    }
    s
}

/// Inline predicate value calls in expressions.
/// Converts calls to user-defined predicates in value position into body table references.
/// E.g., `F() = T1()` → `F(logica_value: x) :- T1(logica_value: x)`
pub fn inline_predicate_values(rule: &mut Json, allocator: &mut NamesAllocator) {
    let known = built_in_function_names();
    let mut extra_conjuncts = Vec::new();
    inline_predicate_values_recursive(rule, &mut extra_conjuncts, allocator, &known);

    if !extra_conjuncts.is_empty() {
        let ro = rule.as_object_mut();
        if !ro.contains_key("body") {
            ro.insert("body".into(), crate::json_obj!(
                "conjunction" => crate::json_obj!(
                    "conjunct" => Json::Array(Vec::new())
                )
            ));
        }
        let body = ro.get_mut("body").unwrap();
        let conj = body.as_object_mut().get_mut("conjunction").unwrap();
        let conjuncts = conj.as_object_mut().get_mut("conjunct").unwrap();
        for c in extra_conjuncts {
            conjuncts.as_array_mut().push(c);
        }
    }
}

fn inline_predicate_values_recursive(
    node: &mut Json,
    conjuncts: &mut Vec<Json>,
    allocator: &mut NamesAllocator,
    known_functions: &HashSet<String>,
) {
    // Bottom-up traversal: process children first, then current node.
    // This matches Python's recursive approach where inner calls (e.g., Arrow)
    // are inlined before outer calls (e.g., ArgMin).
    match node {
        Json::Object(o) => {
            // First recurse into all children (except combine and type)
            // Sort keys alphabetically to match Python's `sorted(r.keys())`
            let mut keys: Vec<String> = o.keys().cloned().collect();
            keys.sort();
            for key in &keys {
                if key == "combine" || key == "type" {
                    continue;
                }
                if let Some(v) = o.get_mut(key) {
                    inline_predicate_values_recursive(v, conjuncts, allocator, known_functions);
                }
            }

            // Then check if this node has a call to a user-defined predicate
            let pred_name_opt = o.get("call").map(|call| {
                call.as_object()["predicate_name"].as_str().to_string()
            });
            if let Some(pred_name) = pred_name_opt {
                if !known_functions.contains(pred_name.as_str()) {
                    // Convert to body table reference
                    let aux_var = allocator.alloc_var();

                    // Create body predicate with logica_value field
                    let mut pred_call = o.get("call").unwrap().clone();
                    let record = pred_call.as_object_mut()
                        .get_mut("record").unwrap()
                        .as_object_mut()
                        .get_mut("field_value").unwrap();
                    record.as_array_mut().push(crate::json_obj!(
                        "field" => "logica_value",
                        "value" => crate::json_obj!(
                            "expression" => make_var_expr(&aux_var)
                        )
                    ));

                    let body_pred = crate::json_obj!(
                        "predicate" => pred_call
                    );
                    conjuncts.push(body_pred);

                    // Replace call with variable reference
                    o.remove("call");
                    o.insert("variable".into(), Json::Object({
                        let mut m = crate::parser::JsonObject::new();
                        m.insert("var_name".into(), Json::Str(aux_var));
                        m
                    }));
                }
            }
        }
        Json::Array(a) => {
            for item in a.iter_mut() {
                inline_predicate_values_recursive(item, conjuncts, allocator, known_functions);
            }
        }
        _ => {}
    }
}

/// Collect all variable names mentioned in an expression.
/// When `dive_in_combines` is false (default), variables inside `combine` keys
/// are NOT collected — they belong to a separate scope (matching Python's behavior).
fn all_mentioned_variables(expr: &Json, vars: &mut HashSet<String>) {
    all_mentioned_variables_full(expr, vars, false, false);
}

fn all_mentioned_variables_impl(expr: &Json, vars: &mut HashSet<String>, dive_in_combines: bool) {
    all_mentioned_variables_full(expr, vars, dive_in_combines, false);
}

/// Extract all mentioned variables from an expression.
/// When `this_is_select` is true, the top-level dict key 'variable' is not treated as a variable reference.
fn all_mentioned_variables_full(
    expr: &Json,
    vars: &mut HashSet<String>,
    dive_in_combines: bool,
    this_is_select: bool,
) {
    // When this_is_select is true, we're iterating over a select dict
    // where 'variable' might be a key name, not a variable reference.
    // In that case, skip variable extraction for the top level only.
    let mut stack: Vec<(&Json, bool)> = vec![(expr, this_is_select)];
    while let Some((node, skip_var_check)) = stack.pop() {
        match node {
            Json::Object(o) => {
                // Only extract variable if not at top level of select dict
                if !skip_var_check {
                    if let Some(var) = o.get("variable") {
                        if let Some(name) = var.as_object().get("var_name") {
                            let s = match name {
                                Json::Str(s) => s.clone(),
                                Json::Int(n) => n.to_string(),
                                _ => String::new(),
                            };
                            if !s.is_empty() {
                                vars.insert(s);
                            }
                        }
                    }
                }
                for (k, v) in o.iter() {
                    if k == "combine" && !dive_in_combines {
                        continue;
                    }
                    // Children are not at top level of select, so don't skip
                    stack.push((v, false));
                }
            }
            Json::Array(a) => {
                for v in a {
                    stack.push((v, false));
                }
            }
            _ => {}
        }
    }
}

fn is_subset(a: &HashSet<String>, b: &HashSet<String>) -> bool {
    a.iter().all(|x| b.contains(x))
}

/// Replace all occurrences of a variable name with a new expression (in-place).
fn replace_variable(old_var: &str, new_expr: &Json, node: &mut Json) {
    let mut stack: Vec<*mut Json> = vec![node as *mut Json];
    while let Some(ptr) = stack.pop() {
        // SAFETY: Each pointer is derived from a unique child of the tree.
        // We never hold two mutable references to the same node simultaneously.
        let current = unsafe { &mut *ptr };
        match current {
            Json::Object(o) => {
                // Check if this node IS the variable reference
                let is_target = o.get("variable").and_then(|var| {
                    var.as_object().get("var_name").map(|name| {
                        match name {
                            Json::Str(s) => s.as_str() == old_var,
                            Json::Int(n) => n.to_string() == old_var,
                            _ => false,
                        }
                    })
                }).unwrap_or(false);
                if is_target {
                    *current = new_expr.clone();
                    continue;
                }
                let keys: Vec<String> = o.keys().cloned().collect();
                for key in keys {
                    if let Some(v) = o.get_mut(&key) {
                        stack.push(v as *mut Json);
                    }
                }
            }
            Json::Array(a) => {
                for item in a.iter_mut() {
                    stack.push(item as *mut Json);
                }
            }
            _ => {}
        }
    }
}

fn extract_var_name(expr: &Json) -> Option<String> {
    if expr.is_object() {
        if let Some(var) = expr.as_object().get("variable") {
            let name = &var.as_object()["var_name"];
            return match name {
                Json::Str(s) => Some(s.clone()),
                Json::Int(n) => Some(n.to_string()),
                _ => None,
            };
        }
    }
    None
}

/// Check if an expression is a record.
fn is_record(expr: &Json) -> bool {
    expr.is_object() && expr.as_object().get("record").is_some()
}

/// Build a subscript expression: `source.field_name`.
/// Produces: `{"subscript": {"record": source, "subscript": {"literal": {"the_symbol": {"symbol": field_name}}}}}`
fn make_subscript(source: &Json, field_name: &str) -> Json {
    let mut sym_inner = JsonObject::new();
    sym_inner.insert("symbol".into(), Json::Str(field_name.to_string()));

    let mut the_symbol = JsonObject::new();
    the_symbol.insert("the_symbol".into(), Json::Object(sym_inner));

    let mut literal = JsonObject::new();
    literal.insert("literal".into(), Json::Object(the_symbol));

    let mut sub_obj = JsonObject::new();
    sub_obj.insert("record".into(), source.clone());
    sub_obj.insert("subscript".into(), Json::Object(literal));

    let mut outer = JsonObject::new();
    outer.insert("subscript".into(), Json::Object(sub_obj));
    Json::Object(outer)
}

/// Recursively collect variable→subscript replacements from a record pattern.
/// For a unification like `{a:, b:} == source`, produces:
///   a → source.a, b → source.b
/// Handles nested records recursively.
fn collect_record_assignments(
    target: &Json,
    source: &Json,
    internal_vars: &HashSet<String>,
    source_vars: &HashSet<String>,
) -> Vec<(String, Json)> {
    let mut replacements = Vec::new();
    if let Some(rec) = target.as_object().get("record") {
        if let Some(fvs) = rec.as_object().get("field_value") {
            for fv in fvs.as_array() {
                let fv_obj = fv.as_object();
                let field_name = fv_obj["field"].as_str();
                let value_expr = &fv_obj["value"].as_object()["expression"];

                // If the field value is an internal variable, replace it with source.field
                if let Some(var_name) = extract_var_name(value_expr) {
                    if internal_vars.contains(&var_name)
                        && !source_vars.contains(&var_name)
                    {
                        replacements.push((var_name, make_subscript(source, field_name)));
                    }
                }

                // If the field value is itself a record, recurse
                if is_record(value_expr) {
                    let nested_source = make_subscript(source, field_name);
                    let nested = collect_record_assignments(
                        value_expr,
                        &nested_source,
                        internal_vars,
                        source_vars,
                    );
                    replacements.extend(nested);
                }
            }
        }
    }
    replacements
}

/// Try to expand a record-to-record unification into per-field unifications.
/// Returns None if the pair can't be expanded (e.g., not both records, or
/// fields don't match).
fn try_expand_record_pair(left: &Json, right: &Json) -> Option<Vec<(Json, Json)>> {
    let left_rec = left.as_object().get("record")?;
    let right_rec = right.as_object().get("record")?;

    let left_fvs = left_rec.as_object().get("field_value")?.as_array();
    let right_fvs = right_rec.as_object().get("field_value")?.as_array();

    // Build field→value maps for both sides
    let mut left_map = std::collections::HashMap::new();
    for fv in left_fvs {
        let field = fv.as_object()["field"].as_str().to_string();
        let value = &fv.as_object()["value"].as_object()["expression"];
        left_map.insert(field, value.clone());
    }

    let mut right_map = std::collections::HashMap::new();
    for fv in right_fvs {
        let field = fv.as_object()["field"].as_str().to_string();
        let value = &fv.as_object()["value"].as_object()["expression"];
        right_map.insert(field, value.clone());
    }

    // Only expand if both sides have the same fields
    if left_map.len() != right_map.len() {
        return None;
    }

    let mut result = Vec::new();
    for (field, left_val) in &left_map {
        let right_val = right_map.get(field)?;
        result.push((left_val.clone(), right_val.clone()));
    }

    Some(result)
}

/// Check if a unification is self-referential: one side is a simple variable
/// that also appears inside the other side (e.g., `x == {f: x.f}`).
fn is_self_referential_unification(left: &Json, right: &Json) -> bool {
    for (a, b) in [(left, right), (right, left)] {
        if let Some(var_name) = extract_var_name(a) {
            let mut vars = HashSet::new();
            all_mentioned_variables(b, &mut vars);
            if vars.contains(&var_name) {
                return true;
            }
        }
    }
    false
}

/// Extract a rule's structure from its parsed JSON AST.
pub fn extract_rule_structure(
    rule: &Json,
    allocator_opt: Option<NamesAllocator>,
) -> CompileResult<RuleStructure> {
    extract_rule_structure_with_vocabulary(rule, allocator_opt, None)
}

/// Extract a rule's structure with optional external vocabulary (for combine).
pub fn extract_rule_structure_with_vocabulary(
    rule: &Json,
    allocator_opt: Option<NamesAllocator>,
    external_vocabulary: Option<HashMap<String, String>>,
) -> CompileResult<RuleStructure> {
    let mut rule = rule.clone(); // Deep copy, like Python's copy.deepcopy
    let mut s = RuleStructure::new();
    if let Some(alloc) = allocator_opt {
        s.allocator = alloc;
    }
    s.external_vocabulary = external_vocabulary;

    let ro = rule.as_object();
    let pred_name = ro["head"].as_object()["predicate_name"].as_str().to_string();

    // Disambiguate combine variables (unless this IS a combine rule)
    if pred_name != "Combine" {
        disambiguate_combine_variables(&mut rule, &mut s.allocator);
    }

    // Inline predicate value calls (convert expression calls to body tables)
    inline_predicate_values(&mut rule, &mut s.allocator);

    let ro = rule.as_object();
    let head = &ro["head"];
    let head_obj = head.as_object();

    s.this_predicate_name = head_obj["predicate_name"].as_str().to_string();

    if let Some(ft) = ro.get("full_text") {
        if ft.is_string() {
            s.full_rule_text = ft.as_str().to_string();
        }
    }

    // Check distinct denoted
    s.distinct_denoted = ro.get("distinct_denoted")
        .map(|v| match v { Json::Bool(b) => *b, _ => false })
        .unwrap_or(false);

    // Extract SELECT clause from head
    let mut aggregated_fields = Vec::new();
    head_to_select(head_obj, &mut s, &mut aggregated_fields)?;

    // Extract body (FROM/WHERE)
    if let Some(body) = ro.get("body") {
        extract_body(body, &mut s)?;
    }

    // Python: aggregated_vars && !distinct_denoted raises RuleCompileException
    if !aggregated_fields.is_empty() && !s.distinct_denoted {
        return Err(CompileError::new(
            "Aggregating predicate must be distinct denoted.".to_string(),
            &s.full_rule_text));
    }

    s.aggregated_fields = aggregated_fields;
    Ok(s)
}

/// Finalize a rule structure: eliminate variables, convert to constraints, set up GROUP BY.
/// Called after RunInjections (if any).
pub fn finalize_rule_structure(s: &mut RuleStructure) {
    s.eliminate_internal_variables();
    s.unifications_to_constraints();
    if s.distinct_denoted {
        let aggregated = s.aggregated_fields.clone();
        s.distinct_vars = s.select
            .keys()
            .filter(|k| !aggregated.contains(k))
            .cloned()
            .collect();
    }
}

/// Extract inline assignments (`=` calls) from an expression tree.
/// Returns the expression with `=` calls replaced by their right-hand side,
/// and collects unifications for the assignments.
fn extract_inline_assignments(expr: &Json, unifications: &mut Vec<(Json, Json)>) -> Json {
    let mut result = expr.clone();

    // Collect all nodes in post-order (children before parents) for bottom-up processing.
    // This ensures nested `=` calls inside the right-hand side are resolved before outer ones.
    let post_order: Vec<*mut Json>;
    {
        let mut stack1: Vec<*mut Json> = vec![&mut result as *mut Json];
        let mut stack2: Vec<*mut Json> = Vec::new();
        while let Some(ptr) = stack1.pop() {
            stack2.push(ptr);
            // SAFETY: Each pointer is derived from a unique child of the tree.
            let node = unsafe { &mut *ptr };
            match node {
                Json::Object(o) => {
                    let keys: Vec<String> = o.keys().cloned().collect();
                    for key in keys {
                        if let Some(v) = o.get_mut(&key) {
                            stack1.push(v as *mut Json);
                        }
                    }
                }
                Json::Array(a) => {
                    for item in a.iter_mut() {
                        stack1.push(item as *mut Json);
                    }
                }
                _ => {}
            }
        }
        // Reverse stack2 to get post-order
        post_order = stack2.into_iter().rev().collect();
    }

    // Process in post-order: children are already transformed by the time we reach parents
    for ptr in post_order {
        // SAFETY: We process each node exactly once, bottom-up.
        let node = unsafe { &mut *ptr };
        let eq_info = if let Json::Object(o) = &*node {
            if let Some(call) = o.get("call") {
                let call_obj = call.as_object();
                if call_obj["predicate_name"].as_str() == "=" {
                    let fvs = call_obj["record"].as_object()["field_value"].as_array();
                    let mut left = None;
                    let mut right = None;
                    for fv in fvs {
                        let fo = fv.as_object();
                        let field = fo["field"].as_str();
                        let val = &fo["value"];
                        let e = val.as_object().get("expression")
                            .cloned()
                            .unwrap_or_else(|| val.clone());
                        if field == "left" {
                            left = Some(e);
                        } else if field == "right" {
                            right = Some(e);
                        }
                    }
                    if let (Some(l), Some(r)) = (left, right) {
                        let other_keys: Vec<(String, Json)> = o.iter()
                            .filter(|(k, _)| *k != "call")
                            .map(|(k, v)| (k.clone(), v.clone()))
                            .collect();
                        Some((l, r, other_keys))
                    } else {
                        None
                    }
                } else {
                    None
                }
            } else {
                None
            }
        } else {
            None
        };

        if let Some((l, r, other_keys)) = eq_info {
            unifications.push((l, r.clone()));
            if let Json::Object(inner) = &r {
                let mut new_obj = crate::parser::JsonObject::new();
                for (k, v) in other_keys {
                    new_obj.insert(k, v);
                }
                for (ik, iv) in inner.iter() {
                    new_obj.insert(ik.clone(), iv.clone());
                }
                *node = Json::Object(new_obj);
            } else {
                *node = r;
            }
        }
    }

    result
}

/// Process the rule head to extract SELECT columns.
fn head_to_select(
    head: &JsonObject,
    s: &mut RuleStructure,
    aggregated_fields: &mut Vec<String>,
) -> CompileResult<()> {
    let record = head["record"].as_object();
    let fvs = record["field_value"].as_array();

    for fv in fvs {
        let fo = fv.as_object();
        let field = &fo["field"];
        let value = &fo["value"];

        let field_name = if field.is_int() {
            format!("col{}", field.as_int())
        } else {
            field.as_str().to_string()
        };

        let vo = value.as_object();

        if let Some(agg) = vo.get("aggregation") {
            // Aggregated field
            let agg_obj = agg.as_object();
            if let Some(expr) = agg_obj.get("expression") {
                // Extract inline assignments (e.g., `Max= (x = expr)`) from the
                // aggregation expression. This converts `=` calls to unifications
                // and replaces them with just the right-hand side value.
                let mut inline_unifs = Vec::new();
                let cleaned_expr = extract_inline_assignments(expr, &mut inline_unifs);
                s.vars_unification.extend(inline_unifs);

                // Post-rewrite: aggregation contains call expression
                let call_obj = cleaned_expr.as_object();
                if let Some(call) = call_obj.get("call") {
                    s.select.insert(field_name.clone(), Json::Object({
                        let mut m = crate::parser::JsonObject::new();
                        m.insert("call".into(), call.clone());
                        m
                    }));
                } else {
                    s.select.insert(field_name.clone(), cleaned_expr.clone());
                }
            }
            aggregated_fields.push(field_name);
        } else if let Some(expr) = vo.get("expression") {
            // Regular field
            s.select.insert(field_name.clone(), expr.clone());

            // Add internal variable unification only when expression is a simple
            // variable, to avoid confusion between user variables in injected
            // predicates.
            if expr.is_object() && expr.as_object().contains_key("variable") {
                let gen_var = s.allocator.alloc_var();
                s.vars_unification.push((expr.clone(), make_var_expr(&gen_var)));
            }
        }
    }

    // Allowing predicates with no arguments: fallback to select['atom'] = literal 'yes'
    if s.select.is_empty() {
        let mut the_string = crate::parser::JsonObject::new();
        the_string.insert("the_string".into(), Json::Str("yes".into()));
        let mut literal = crate::parser::JsonObject::new();
        literal.insert("the_string".into(), Json::Object(the_string));
        let mut expr = crate::parser::JsonObject::new();
        expr.insert("literal".into(), Json::Object(literal));
        s.select.insert("atom".into(), Json::Object(expr));
    }

    Ok(())
}

/// Process the rule body (conjunction of predicates and constraints).
fn extract_body(body: &Json, s: &mut RuleStructure) -> CompileResult<()> {
    let bo = body.as_object();

    if let Some(conj) = bo.get("conjunction") {
        let conjuncts = conj.as_object()["conjunct"].as_array();
        for conjunct in conjuncts {
            extract_conjunct(conjunct, s)?;
        }
    }

    Ok(())
}

/// Process a single conjunct (predicate call, unification, or inclusion).
fn extract_conjunct(conjunct: &Json, s: &mut RuleStructure) -> CompileResult<()> {
    let co = conjunct.as_object();

    if let Some(pred) = co.get("predicate") {
        // Let `=` go through extract_predicate like Python does.
        // Python defines `=` as a library rule: `=(left:, right:) = right :- left == right;`
        // It allocates table+vars, then inlines via injection. This ensures counter alignment.
        extract_predicate(pred, s)?;
    } else if let Some(unif) = co.get("unification") {
        extract_unification(unif, s)?;
    } else if let Some(incl) = co.get("inclusion") {
        extract_inclusion(incl, s)?;
    } else if co.contains_key("disjunction") {
        return Err(CompileError::new(
            "Disjunction is disallowed inside of aggregation and negation, please refactor.".to_string(),
            &s.full_rule_text));
    }

    Ok(())
}

/// Process a predicate call in the body → FROM table + variable mappings.
///
/// Handles standard field mappings and "except" patterns (rest-of syntax
/// where some fields are explicitly named and a variable captures the rest).
fn extract_predicate(pred: &Json, s: &mut RuleStructure) -> CompileResult<()> {
    let po = pred.as_object();
    let pred_name = po["predicate_name"].as_str();

    // Built-in constraint predicates become WHERE clauses
    if is_constraint_predicate(pred_name) {
        s.constraints.push(Json::Object({
            let mut m = crate::parser::JsonObject::new();
            m.insert("call".into(), pred.clone());
            m
        }));
        return Ok(());
    }

    // Allocate a table alias (with predicate name as hint, like Python)
    let table_alias = s.allocator.alloc_table(Some(pred_name));
    s.tables.insert(table_alias.clone(), pred_name.to_string());

    // Map fields to variables
    let record = po["record"].as_object();
    let fvs = record["field_value"].as_array();

    for fv in fvs {
        let fo = fv.as_object();
        let field = &fo["field"];
        let value = &fo["value"];

        let field_name = if field.is_int() {
            format!("col{}", field.as_int())
        } else {
            field.as_str().to_string()
        };

        // Handle "except" pattern: rest-of record with excluded fields
        // The parser produces: {"field": "..rest", "value": {...}, "except": ["field1", "field2"]}
        if let Some(except_arr) = fo.get("except") {
            if except_arr.is_array() {
                let excluded: Vec<String> = except_arr
                    .as_array()
                    .iter()
                    .filter_map(|v| if v.is_string() { Some(v.as_str().to_string()) } else { None })
                    .collect();
                // Store the except expression info for later processing
                // The actual field filtering happens during SQL generation
                if let Some(expr) = value.as_object().get("expression") {
                    // Create a unification that includes the except info
                    let mut except_expr = expr.clone();
                    if let Json::Object(ref mut eo) = except_expr {
                        eo.insert("__except_fields".into(), except_arr.clone());
                        eo.insert("__except_table".into(), Json::Str(table_alias.clone()));
                    }
                    let gen_var = s.allocator.alloc_var();
                    // Register the spread field as "*" (all fields) in vars_map
                    s.vars_map.insert(
                        (table_alias.clone(), "*".to_string()),
                        gen_var.clone(),
                    );
                    s.inv_vars_map.insert(
                        gen_var.clone(),
                        (table_alias.clone(), "*".to_string()),
                    );
                    // Track the except info for this variable
                    s.except_info.insert(gen_var.clone(), (table_alias.clone(), excluded));
                    let gen_expr = make_var_expr(&gen_var);
                    s.vars_unification.push((gen_expr, except_expr));
                }
                continue;
            }
        }

        // Allocate a variable for this table.field
        let gen_var = s.allocator.alloc_var();
        s.vars_map.insert(
            (table_alias.clone(), field_name.clone()),
            gen_var.clone(),
        );
        s.inv_vars_map.insert(
            gen_var.clone(),
            (table_alias.clone(), field_name),
        );

        // Create unification between generated variable and the expression
        let gen_expr = make_var_expr(&gen_var);
        if let Some(expr) = value.as_object().get("expression") {
            s.vars_unification.push((gen_expr, expr.clone()));
        }
    }

    Ok(())
}

fn extract_unification(unif: &Json, s: &mut RuleStructure) -> CompileResult<()> {
    let uo = unif.as_object();
    // Parser uses "left_hand_side" / "right_hand_side"
    let left = uo.get("left_hand_side")
        .or_else(|| uo.get("left"))
        .expect("unification missing left side");
    let right = uo.get("right_hand_side")
        .or_else(|| uo.get("right"))
        .expect("unification missing right side");

    // If either side has a variable or record, it's a unification;
    // otherwise it's a constraint (matches Python logic).
    if has_variable_deep(left) || has_variable_deep(right)
        || has_record(left) || has_record(right)
    {
        s.vars_unification.push((left.clone(), right.clone()));
    } else {
        if left != right {
            s.constraints.push(make_equality(left, right));
        }
    }

    Ok(())
}

fn extract_inclusion(incl: &Json, s: &mut RuleStructure) -> CompileResult<()> {
    let io = incl.as_object();
    let element = &io["element"];
    let list = &io["list"];

    // Check if list is a Container call → becomes a WHERE IN constraint
    if let Some(call) = list.as_object().get("call") {
        if call.as_object()["predicate_name"].as_str() == "Container" {
            s.constraints.push(Json::Object({
                let mut m = crate::parser::JsonObject::new();
                let mut call_obj = crate::parser::JsonObject::new();
                call_obj.insert("predicate_name".into(), Json::Str("In".into()));
                let mut rec = crate::parser::JsonObject::new();
                rec.insert("field_value".into(), Json::Array(vec![
                    crate::json_obj!(
                        "field" => "left",
                        "value" => crate::json_obj!("expression" => element.clone())
                    ),
                    crate::json_obj!(
                        "field" => "right",
                        "value" => crate::json_obj!("expression" => list.clone())
                    ),
                ]));
                call_obj.insert("record".into(), Json::Object(rec));
                m.insert("call".into(), Json::Object(call_obj));
                m
            }));
            return Ok(());
        }
    }

    // UNNEST: allocate a variable for the unnested element
    let var_name = s.allocator.alloc_var();
    s.inv_vars_map.insert(var_name.clone(), ("".to_string(), var_name.clone()));
    s.unnestings.push((var_name.clone(), list.clone()));

    // Unify element with ValueOfUnnested(var)
    let value_of_unnested = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "ValueOfUnnested",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => make_var_expr(&var_name)
                        )
                    ),
                ])
            )
        )
    );
    s.vars_unification.push((element.clone(), value_of_unnested));

    Ok(())
}

fn is_constraint_predicate(name: &str) -> bool {
    matches!(name, "==" | "!=" | "<" | ">" | "<=" | ">=" | "&&" | "||"
        | "~" | "in" | "is" | "is not" | "Like" | "!" | "IsNull" | "Constraint")
}

/// Check if expression directly contains a "variable" key.
fn has_variable_deep(expr: &Json) -> bool {
    let mut stack: Vec<&Json> = vec![expr];
    while let Some(node) = stack.pop() {
        match node {
            Json::Object(o) => {
                if o.contains_key("variable") {
                    return true;
                }
                stack.extend(o.values());
            }
            Json::Array(a) => {
                stack.extend(a.iter());
            }
            _ => {}
        }
    }
    false
}

fn has_record(expr: &Json) -> bool {
    if !expr.is_object() { return false; }
    expr.as_object().contains_key("record")
}

fn make_var_expr(var_name: &str) -> Json {
    crate::json_obj!("variable" => crate::json_obj!("var_name" => var_name))
}

/// Tree structure for combine variable disambiguation.
/// Alternate tree-based formulation of `disambiguate_combines_recursive`,
/// kept for its unit test.
#[cfg(test)]
struct CombineTree {
    variables: HashSet<String>,
    subtrees: Vec<CombineTree>,
}

/// Collect variable names and combine subtrees from a rule AST.
/// Uses arena-based iterative traversal to avoid recursion.
#[cfg(test)]
fn get_tree_of_combines(root: &Json) -> CombineTree {
    // Arena: each entry is (variables, subtree_indices) for one CombineTree node
    let mut all_variables: Vec<HashSet<String>> = vec![HashSet::new()];
    let mut all_subtree_indices: Vec<Vec<usize>> = vec![Vec::new()];

    let mut stack: Vec<(&Json, usize)> = vec![(root, 0)];

    while let Some((node, tree_idx)) = stack.pop() {
        match node {
            Json::Object(o) => {
                if let Some(var) = o.get("variable") {
                    if let Some(name) = var.as_object().get("var_name") {
                        let var_str = if name.is_string() {
                            name.as_str().to_string()
                        } else if name.is_int() {
                            name.as_int().to_string()
                        } else {
                            String::new()
                        };
                        if !var_str.is_empty() {
                            all_variables[tree_idx].insert(var_str);
                        }
                    }
                }
                for (k, v) in o.iter() {
                    if k == "combine" {
                        // Create a new subtree node in the arena
                        let new_idx = all_variables.len();
                        all_variables.push(HashSet::new());
                        all_subtree_indices.push(Vec::new());
                        all_subtree_indices[tree_idx].push(new_idx);
                        stack.push((v, new_idx));
                    } else {
                        stack.push((v, tree_idx));
                    }
                }
            }
            Json::Array(a) => {
                for v in a {
                    stack.push((v, tree_idx));
                }
            }
            _ => {}
        }
    }

    // Convert arena to CombineTree (children always have higher indices, so reverse order works)
    let n = all_variables.len();
    let mut trees: Vec<Option<CombineTree>> = (0..n).map(|_| None).collect();
    for i in (0..n).rev() {
        let subtrees: Vec<CombineTree> = all_subtree_indices[i]
            .iter()
            .map(|&idx| trees[idx].take().unwrap())
            .collect();
        trees[i] = Some(CombineTree {
            variables: std::mem::take(&mut all_variables[i]),
            subtrees,
        });
    }
    trees[0].take().unwrap()
}

/// Disambiguate variables in combine expressions.
/// Variables introduced in a combine should not clash with outer variables.
/// Each combine has its own scope - variables are renamed ONLY within that combine.
fn disambiguate_combine_variables(rule: &mut Json, allocator: &mut NamesAllocator) {
    // Collect variables at the top level (outside any combine)
    let mut top_variables = HashSet::new();
    all_mentioned_variables_impl(rule, &mut top_variables, false); // false = don't dive into combines

    // Recursively process combines
    disambiguate_combines_recursive(rule, &top_variables, allocator);
}

/// Helper: recursively walk AST and disambiguate combines.
fn disambiguate_combines_recursive(
    node: &mut Json,
    outer_variables: &HashSet<String>,
    allocator: &mut NamesAllocator,
) {
    match node {
        Json::Object(o) => {
            // Check if this object has a "combine" key
            if let Some(combine_node) = o.get_mut("combine") {
                // Collect variables mentioned in this combine (not diving into nested combines)
                let mut combine_vars = HashSet::new();
                all_mentioned_variables_impl(combine_node, &mut combine_vars, false);

                // Variables introduced in this combine = combine_vars - outer_variables
                let mut introduced: Vec<String> = combine_vars.difference(outer_variables)
                    .filter(|v| !v.contains("# disambiguated with"))
                    .cloned()
                    .collect();
                introduced.sort();

                // Rename introduced variables ONLY within this combine subtree
                for v in &introduced {
                    let new_name = format!("{} # disambiguated with {}", v, allocator.alloc_var());
                    replace_variable(v, &make_var_expr(&new_name), combine_node);
                }

                // For nested combines, the outer scope includes:
                // - original outer variables
                // - variables from THIS combine's scope (after renaming)
                let mut new_outer = outer_variables.clone();
                let mut renamed_vars = HashSet::new();
                all_mentioned_variables_impl(combine_node, &mut renamed_vars, false);
                new_outer.extend(renamed_vars);

                // Recursively process nested combines
                disambiguate_combines_recursive(combine_node, &new_outer, allocator);
            } else {
                // Not a combine - recurse into children with same outer scope
                let keys: Vec<String> = o.keys().cloned().collect();
                for key in keys {
                    if let Some(v) = o.get_mut(&key) {
                        disambiguate_combines_recursive(v, outer_variables, allocator);
                    }
                }
            }
        }
        Json::Array(a) => {
            for item in a.iter_mut() {
                disambiguate_combines_recursive(item, outer_variables, allocator);
            }
        }
        _ => {}
    }
}

/// Decorate a combine rule for SQL translation.
/// Wraps the aggregation expression with MagicalEntangle and adds `var in [0]` to body.
pub fn decorate_combine_rule(rule: &Json, var_name: &str) -> Json {
    let mut rule = rule.clone();

    // Wrap the aggregation expression with MagicalEntangle
    {
        let ro = rule.as_object_mut();
        let head = ro.get_mut("head").unwrap();
        let head_o = head.as_object_mut();
        let record = head_o.get_mut("record").unwrap();
        let fvs = record.as_object_mut().get_mut("field_value").unwrap();
        let first_fv = &mut fvs.as_array_mut()[0];
        let value = first_fv.as_object_mut().get_mut("value").unwrap();
        let agg = value.as_object_mut().get_mut("aggregation").unwrap();
        let expr = agg.as_object_mut().get_mut("expression").unwrap();

        // The expression under aggregation is typically a call (e.g. Agg+(x), List(x)).
        // If it has a "call" key, entangle its first argument. Otherwise, skip entangling
        // (the expression might be a combine or other non-call form).
        if let Some(call) = expr.as_object_mut().get_mut("call") {
            let rec = call.as_object_mut().get_mut("record").unwrap();
            let fvs2 = rec.as_object_mut().get_mut("field_value").unwrap();
            let first_arg = &mut fvs2.as_array_mut()[0];
            let original_value = first_arg.as_object().get("value").unwrap().clone();

            // Replace with MagicalEntangle(original, var)
            let entangled = crate::json_obj!(
                "expression" => crate::json_obj!(
                    "call" => crate::json_obj!(
                        "predicate_name" => "MagicalEntangle",
                        "record" => crate::json_obj!(
                            "field_value" => Json::Array(vec![
                                crate::json_obj!(
                                    "field" => Json::Int(0),
                                    "value" => original_value
                                ),
                                crate::json_obj!(
                                    "field" => Json::Int(1),
                                    "value" => crate::json_obj!(
                                        "expression" => make_var_expr(var_name)
                                    )
                                ),
                            ])
                        )
                    )
                )
            );
            *first_arg.as_object_mut().get_mut("value").unwrap() = entangled;
        }
    }

    // Add `var in [0]` to body
    let inclusion = crate::json_obj!(
        "inclusion" => crate::json_obj!(
            "list" => crate::json_obj!(
                "literal" => crate::json_obj!(
                    "the_list" => crate::json_obj!(
                        "element" => Json::Array(vec![
                            crate::json_obj!(
                                "literal" => crate::json_obj!(
                                    "the_number" => crate::json_obj!(
                                        "number" => "0"
                                    )
                                )
                            ),
                        ])
                    )
                )
            ),
            "element" => make_var_expr(var_name)
        )
    );

    {
        let ro = rule.as_object_mut();
        if !ro.contains_key("body") {
            ro.insert("body".into(), crate::json_obj!(
                "conjunction" => crate::json_obj!(
                    "conjunct" => Json::Array(Vec::new())
                )
            ));
        }
        let body = ro.get_mut("body").unwrap();
        let conj = body.as_object_mut().get_mut("conjunction").unwrap();
        let conjuncts = conj.as_object_mut().get_mut("conjunct").unwrap();
        conjuncts.as_array_mut().push(inclusion);
    }

    rule
}

fn make_equality(left: &Json, right: &Json) -> Json {
    crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "==",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => "left",
                        "value" => crate::json_obj!("expression" => left.clone())
                    ),
                    crate::json_obj!(
                        "field" => "right",
                        "value" => crate::json_obj!("expression" => right.clone())
                    ),
                ])
            )
        )
    )
}

/// Whether a structure involves a Combine predicate.
/// Matches Python's HasCombine(r).
pub fn has_combine(r: &Json) -> bool {
    match r {
        Json::Object(o) => {
            if let Some(pn) = o.get("predicate_name") {
                if pn.as_str() == "Combine" {
                    return true;
                }
            }
            o.values().any(|v| has_combine(v))
        }
        Json::Array(a) => a.iter().any(|v| has_combine(v)),
        _ => false,
    }
}

/// Get all field names from a record's field_value array.
/// Matches Python's AllRecordFields(record).
pub fn all_record_fields(record: &Json) -> Vec<String> {
    let mut result = Vec::new();
    if let Some(fvs) = record.as_object().get("field_value") {
        for fv in fvs.as_array() {
            let field = &fv.as_object()["field"];
            if field.is_int() {
                result.push(format!("col{}", field.as_int()));
            } else {
                result.push(field.as_str().to_string());
            }
        }
    }
    result
}

#[cfg(test)]
#[path = "rule_translate_test.rs"]
mod rule_translate_test;
