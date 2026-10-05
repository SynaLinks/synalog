// Modified from: logica/compiler/universe.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// Original work: Copyright 2020 Google LLC, licensed under the Apache License, Version 2.0.
// Modifications: Copyright 2025-2026 Yoan Sallami (Synalinks Team), licensed under the Apache License, Version 2.0.

use std::collections::{HashMap, HashSet};
use crate::parser::Json;
use crate::compiler::CompileResult;
use crate::compiler::CompileError;
use crate::compiler::universe::IterationDef;
use crate::compiler::{home_schema, test_schema};

/// Known annotating predicates (matches Python's ANNOTATING_PREDICATES).
const ANNOTATING_PREDICATES: &[&str] = &[
    "@Limit", "@OrderBy", "@Ground", "@Flag", "@DefineFlag",
    "@NoInject", "@Make", "@CompileAsTvf", "@With", "@NoWith",
    "@CompileAsUdf", "@ResetFlagValue", "@Dataset", "@AttachDatabase",
    "@Engine", "@Recursive", "@Iteration", "@BareAggregation",
    "@Assert",
];

/// Parsed annotations from a Logica program.
#[derive(Clone)]
pub struct Annotations {
    /// Raw annotation values per predicate: predicate_name → { annotation_key → value }
    pub annotations: HashMap<String, HashMap<String, Json>>,
    /// Compiled flag values (defaults merged with user overrides).
    pub flag_values: HashMap<String, String>,
    /// Default engine name.
    pub engine: String,
    /// User-defined @AttachDatabase entries: db_name → path.
    pub user_attached_databases: HashMap<String, String>,
    /// @Dataset override (None = use engine default).
    pub dataset_override: Option<String>,
    /// @CompileAsUdf predicate names.
    pub compile_as_udf: HashSet<String>,
    /// @CompileAsTvf entries: predicate_name → list of argument names.
    pub compile_as_tvf: HashMap<String, Vec<String>>,
    /// @BareAggregation entries: predicate_name → semigroup name.
    pub bare_aggregation: HashMap<String, String>,
    /// Engine sub-keys (motherduck, threads, type_checking, clingo).
    pub engine_options: HashMap<String, Json>,
}

#[derive(Debug, Clone)]
pub struct Ground {
    pub table_name: String,
    pub overwrite: bool,
    pub copy_to_file: Option<String>,
}

/// Extract a string value from a Logica expression literal.
/// Handles the nested structure: {"literal": {"the_string": {"the_string": "value"}}}
fn extract_string_literal(expr: &Json) -> Option<String> {
    if !expr.is_object() {
        return None;
    }
    let o = expr.as_object();
    if let Some(lit) = o.get("literal") {
        if let Some(ts) = lit.as_object().get("the_string") {
            if ts.is_string() {
                return Some(ts.as_str().to_string());
            }
            if ts.is_object() {
                if let Some(inner) = ts.as_object().get("the_string") {
                    return Some(inner.as_str().to_string());
                }
            }
        }
    }
    None
}

/// The integer of a `@Limit` argument, if it is an integer literal.
pub fn limit_number(v: &Json) -> Option<i64> {
    if !v.is_object() {
        return None;
    }
    let lit = v.as_object().get("literal")?;
    let num = lit.as_object().get("the_number")?;
    if num.is_int() {
        Some(num.as_int())
    } else if num.is_object() {
        // Parser stores numbers as {"number": "10"}
        num.as_object().get("number").and_then(|s| s.as_str().parse::<i64>().ok())
    } else {
        None
    }
}

/// Why `item` is not an `@OrderBy` item, or `None` if it is one: a column,
/// optionally followed by `ASC` or `DESC` and `NULLS FIRST` or `NULLS LAST`
/// (any case), or a lone `ASC`/`DESC` qualifying the previous item.
pub fn order_by_item_error(item: &str) -> Option<String> {
    let words: Vec<&str> = item.split_whitespace().collect();
    let is = |word: &str, keyword: &str| word.eq_ignore_ascii_case(keyword);
    let is_column = |word: &str| {
        word.chars().next().is_some_and(|c| c.is_ascii_alphabetic() || c == '_')
            && word.chars().all(|c| c.is_ascii_alphanumeric() || c == '_')
    };
    let direction = |word: &str| is(word, "ASC") || is(word, "DESC");
    let nulls = |rest: &[&str]| rest.len() == 2 && is(rest[0], "NULLS") && (is(rest[1], "FIRST") || is(rest[1], "LAST"));
    let valid = match words.as_slice() {
        [word] => is_column(word),
        [column, rest @ ..] if is_column(column) && !direction(column) => match rest {
            [dir] => direction(dir),
            [dir, more @ ..] if direction(dir) => nulls(more),
            more => nulls(more),
        },
        _ => false,
    };
    if valid {
        None
    } else {
        Some(format!(
            "'{}' is not a column to order by: write a column name, optionally followed by ASC or DESC",
            item
        ))
    }
}

impl Annotations {
    /// Extract annotations from parsed rules.
    /// Follows Python's two-pass approach: first @DefineFlag/@ResetFlagValue, then the rest.
    pub fn extract(rules: &[(String, Json)]) -> CompileResult<Self> {
        let mut engine = "duckdb".to_string();
        let mut engine_options: HashMap<String, Json> = HashMap::new();
        let mut flag_defaults: HashMap<String, String> = HashMap::new();
        let mut flag_resets: HashMap<String, String> = HashMap::new();

        // ── Pass 1: Extract @DefineFlag, @ResetFlagValue, and @Engine ──

        for (_pred_name, rule) in rules {
            let ro = rule.as_object();
            if !ro.contains_key("head") { continue; }
            let head = ro["head"].as_object();
            let name = head["predicate_name"].as_str();
            if !name.starts_with('@') { continue; }

            // Validate annotation name
            if !ANNOTATING_PREDICATES.contains(&name) {
                let full_text = ro.get("full_text")
                    .map(|ft| ft.as_str().to_string())
                    .unwrap_or_default();
                return Err(CompileError::new(
                    format!(
                        "Only {} and {} special predicates are allowed.",
                        ANNOTATING_PREDICATES[..ANNOTATING_PREDICATES.len()-1].join(", "),
                        ANNOTATING_PREDICATES[ANNOTATING_PREDICATES.len()-1]
                    ),
                    &full_text,
                ));
            }

            let ann_name = &name[1..];
            let fvs = Self::field_values(head);

            match ann_name {
                "Engine" => {
                    if let Some((_, val)) = fvs.iter().find(|(k, _)| k == "0") {
                        if let Some(s) = extract_string_literal(val) {
                            engine = s;
                        }
                    }
                    // Collect engine sub-keys (motherduck, threads, type_checking, clingo)
                    for (k, v) in &fvs {
                        if k != "0" {
                            engine_options.insert(k.clone(), v.clone());
                        }
                    }
                }
                "DefineFlag" => {
                    let flag_name = fvs.iter()
                        .find(|(k, _)| k == "0")
                        .and_then(|(_, v)| extract_string_literal(v));
                    let default = fvs.iter()
                        .find(|(k, _)| k == "1")
                        .and_then(|(_, v)| extract_string_literal(v))
                        .unwrap_or_default();
                    if let Some(name) = flag_name {
                        flag_defaults.entry(name).or_insert(default);
                    }
                }
                "ResetFlagValue" => {
                    let flag_name = fvs.iter()
                        .find(|(k, _)| k == "0")
                        .and_then(|(_, v)| extract_string_literal(v));
                    let value = fvs.iter()
                        .find(|(k, _)| k == "1")
                        .and_then(|(_, v)| extract_string_literal(v))
                        .unwrap_or_default();
                    if let Some(name) = flag_name {
                        flag_resets.insert(name, value);
                    }
                }
                _ => {}
            }
        }

        // Build flag values: defaults, then programmatic resets, then user flags
        let mut flag_values = flag_defaults;
        for (k, v) in flag_resets {
            flag_values.insert(k, v);
        }

        // ── Pass 2: Extract all other annotations ──

        let mut per_predicate: HashMap<String, HashMap<String, Json>> = HashMap::new();
        let mut user_attached_databases: HashMap<String, String> = HashMap::new();
        let mut dataset_override: Option<String> = None;
        let mut compile_as_udf: HashSet<String> = HashSet::new();
        let mut compile_as_tvf: HashMap<String, Vec<String>> = HashMap::new();
        let mut bare_aggregation: HashMap<String, String> = HashMap::new();

        for (_pred_name, rule) in rules {
            let ro = rule.as_object();
            if !ro.contains_key("head") { continue; }
            let head = ro["head"].as_object();
            let name = head["predicate_name"].as_str();
            if !name.starts_with('@') { continue; }
            let ann_name = &name[1..];

            let fvs = Self::field_values(head);

            match ann_name {
                "Engine" | "DefineFlag" | "ResetFlagValue" => {
                    // Already handled in pass 1
                }
                "OrderBy" => {
                    if let Some(target) = Self::predicate_name_from_field(&fvs, "0") {
                        // Each item lands verbatim in ORDER BY: anything but a
                        // column and its direction would be raw SQL.
                        for (key, item) in fvs.iter().filter(|(k, _)| k != "0") {
                            let text = Self::extract_predicate_name(item).or_else(|| extract_string_literal(item));
                            let problem = match &text {
                                Some(text) => order_by_item_error(text),
                                None => Some(format!("argument {} is not a column name", key)),
                            };
                            if let Some(problem) = problem {
                                let full_text = ro.get("full_text").map(|ft| ft.as_str().to_string()).unwrap_or_default();
                                return Err(CompileError::new(format!("@OrderBy({}): {}", target, problem), &full_text));
                            }
                        }
                        let entry = per_predicate.entry(target).or_default();
                        entry.insert("order_by".into(), Json::Array(
                            fvs.iter()
                                .filter(|(k, _)| k != "0")
                                .map(|(_, v)| v.clone())
                                .collect()
                        ));
                    }
                }
                "Limit" => {
                    if let Some(target) = Self::predicate_name_from_field(&fvs, "0") {
                        if let Some((_, limit_val)) = fvs.iter().find(|(k, _)| k == "1") {
                            if limit_number(limit_val).is_none_or(|n| n < 0) {
                                let full_text = ro.get("full_text").map(|ft| ft.as_str().to_string()).unwrap_or_default();
                                return Err(CompileError::new(
                                    format!("@Limit({}): the limit must be a whole number of rows, 0 or more", target),
                                    &full_text,
                                ));
                            }
                            let entry = per_predicate.entry(target).or_default();
                            entry.insert("limit".into(), limit_val.clone());
                        }
                    }
                }
                "Ground" => {
                    if let Some(target) = Self::predicate_name_from_field(&fvs, "0") {
                        let table = if let Some((_, t)) = fvs.iter().find(|(k, _)| k == "1") {
                            Self::extract_predicate_name(t).unwrap_or_else(|| target.clone())
                        } else {
                            target.clone()
                        };
                        let entry = per_predicate.entry(target.clone()).or_default();
                        entry.insert("ground".into(), Json::Str(table));

                        // Store overwrite and copy_to_file if present
                        if let Some((_, ow)) = fvs.iter().find(|(k, _)| k == "overwrite") {
                            entry.insert("ground_overwrite".into(), ow.clone());
                        }
                        if let Some((_, cf)) = fvs.iter().find(|(k, _)| k == "copy_to_file") {
                            entry.insert("ground_copy_to_file".into(), cf.clone());
                        }
                    }
                }
                "With" => {
                    if let Some(target) = Self::predicate_name_from_field(&fvs, "0") {
                        let entry = per_predicate.entry(target).or_default();
                        entry.insert("with".into(), Json::Bool(true));
                    }
                }
                "NoWith" => {
                    if let Some(target) = Self::predicate_name_from_field(&fvs, "0") {
                        let entry = per_predicate.entry(target).or_default();
                        entry.insert("with".into(), Json::Bool(false));
                    }
                }
                "NoInject" => {
                    if let Some(target) = Self::predicate_name_from_field(&fvs, "0") {
                        let entry = per_predicate.entry(target).or_default();
                        entry.insert("no_inject".into(), Json::Bool(true));
                    }
                }
                "Dataset" => {
                    // @Dataset("name") — singleton, first positional arg is the dataset name
                    if let Some((_, val)) = fvs.iter().find(|(k, _)| k == "0") {
                        if let Some(s) = extract_string_literal(val) {
                            dataset_override = Some(s);
                        } else if let Some(name) = Self::extract_predicate_name(val) {
                            dataset_override = Some(name);
                        }
                    }
                }
                "AttachDatabase" => {
                    // @AttachDatabase(db_name, "path")
                    if let Some(db_name) = Self::predicate_name_from_field(&fvs, "0") {
                        if let Some((_, path_val)) = fvs.iter().find(|(k, _)| k == "1") {
                            if let Some(path) = extract_string_literal(path_val) {
                                user_attached_databases.insert(db_name, path);
                            }
                        }
                    }
                }
                "CompileAsUdf" => {
                    if let Some(target) = Self::predicate_name_from_field(&fvs, "0") {
                        compile_as_udf.insert(target);
                    }
                }
                "CompileAsTvf" => {
                    if let Some(target) = Self::predicate_name_from_field(&fvs, "0") {
                        // Second arg is a list of argument predicate names
                        let mut args = Vec::new();
                        if let Some((_, list_val)) = fvs.iter().find(|(k, _)| k == "1") {
                            if list_val.is_array() {
                                for item in list_val.as_array() {
                                    if let Some(pname) = Self::extract_predicate_name(item) {
                                        args.push(pname);
                                    }
                                }
                            }
                        }
                        compile_as_tvf.insert(target, args);
                    }
                }
                "BareAggregation" => {
                    if let Some(target) = Self::predicate_name_from_field(&fvs, "0") {
                        if let Some((_, sg_val)) = fvs.iter().find(|(k, _)| k == "semigroup") {
                            if let Some(sg_name) = Self::extract_predicate_name(sg_val) {
                                bare_aggregation.insert(target, sg_name);
                            }
                        }
                    }
                }
                "Iteration" => {
                    // @Iteration(name, predicates: [...], repetitions: N, stop_signal: Pred)
                    if let Some(target) = Self::predicate_name_from_field(&fvs, "0") {
                        let entry = per_predicate.entry(format!("@Iteration_{}", target)).or_default();
                        for (k, v) in &fvs {
                            if k != "0" {
                                entry.insert(k.clone(), v.clone());
                            }
                        }
                    }
                }
                // @Make, @Recursive are handled by functors.rs directly from raw rules
                // @Flag is just a marker
                // @Assert is read by the verifier and does not affect the SQL
                _ => {}
            }
        }

        Ok(Annotations {
            annotations: per_predicate,
            flag_values,
            engine,
            user_attached_databases,
            dataset_override,
            compile_as_udf,
            compile_as_tvf,
            bare_aggregation,
            engine_options,
        })
    }

    fn field_values(head: &crate::parser::JsonObject) -> Vec<(String, Json)> {
        let mut result = Vec::new();
        if let Some(record) = head.get("record") {
            if let Some(fvs) = record.as_object().get("field_value") {
                for fv in fvs.as_array() {
                    let field = &fv.as_object()["field"];
                    let value = &fv.as_object()["value"];
                    let field_str = if field.is_int() {
                        field.as_int().to_string()
                    } else {
                        field.as_str().to_string()
                    };
                    let val = if let Some(expr) = value.as_object().get("expression") {
                        expr.clone()
                    } else {
                        value.clone()
                    };
                    result.push((field_str, val));
                }
            }
        }
        result
    }

    fn extract_predicate_name(val: &Json) -> Option<String> {
        if val.is_object() {
            if let Some(var) = val.as_object().get("variable") {
                return Some(var.as_object()["var_name"].as_var_name());
            }
            if let Some(lit) = val.as_object().get("literal") {
                if let Some(pred) = lit.as_object().get("the_predicate") {
                    return Some(pred.as_object()["predicate_name"].as_str().to_string());
                }
            }
        }
        None
    }

    fn predicate_name_from_field(fvs: &[(String, Json)], field: &str) -> Option<String> {
        fvs.iter()
            .find(|(k, _)| k == field)
            .and_then(|(_, v)| Self::extract_predicate_name(v))
    }

    /// Get the target engine name.
    pub fn engine(&self) -> &str {
        &self.engine
    }

    /// Whether the engine is DuckDB with motherduck enabled.
    pub fn is_motherduck(&self) -> bool {
        self.engine_options.get("motherduck")
            .map(|v| !v.is_null())
            .unwrap_or(false)
    }

    /// Whether Clingo integration is requested.
    pub fn needs_clingo(&self) -> bool {
        self.engine_options.get("clingo")
            .map(|v| !v.is_null())
            .unwrap_or(false)
    }

    /// Whether type checking is enabled for the current engine.
    /// Matches Python's ShouldTypecheck().
    pub fn should_typecheck(&self) -> bool {
        let typechecks_by_default = self.engine_typechecks_by_default();

        // Check @Engine annotation for explicit type_checking setting
        if let Some(type_checking) = self.engine_options.get("type_checking") {
            if type_checking.is_bool() {
                return match type_checking {
                    Json::Bool(b) => *b,
                    _ => typechecks_by_default,
                };
            }
            // If type_checking is present but not a bool, treat as enabled
            return true;
        }

        typechecks_by_default
    }

    /// Whether the engine typechecks by default.
    fn engine_typechecks_by_default(&self) -> bool {
        // All engines typecheck by default
        true
    }

    /// Get the default dataset name based on engine and @Dataset annotation.
    /// Matches Python's `Annotations.Dataset()`.
    pub fn dataset(&self) -> String {
        if let Some(ref ds) = self.dataset_override {
            return ds.clone();
        }
        let home = home_schema();
        let test = test_schema();
        match self.engine.as_str() {
            "psql" | "duckdb" => home.to_string(),
            "sqlite" if self.user_attached_databases.contains_key(home) => home.to_string(),
            _ => test.to_string(),
        }
    }

    /// Get attached databases (user-defined + auto-attach for SQLite).
    /// Matches Python's `Annotations.AttachedDatabases()`.
    pub fn attached_databases(&self) -> Vec<(String, String)> {
        let mut result: Vec<(String, String)> = self.user_attached_databases
            .iter()
            .map(|(k, v)| (k.clone(), v.clone()))
            .collect();
        // Auto-attach test schema for SQLite when @Ground is used and not user-attached
        let test = test_schema();
        if self.engine == "sqlite"
            && !self.user_attached_databases.contains_key(test)
            && !self.grounded_predicates().is_empty()
        {
            result.push((test.to_string(), ":memory:".to_string()));
        }
        result
    }

    /// Generate ATTACH DATABASE statements.
    /// Matches Python's `Annotations.AttachDatabaseStatements()`.
    pub fn attach_database_statements(&self) -> String {
        let dbs = self.attached_databases();
        if dbs.is_empty() {
            return String::new();
        }
        let mut lines = Vec::new();
        for (k, v) in &dbs {
            // DuckDB: detach first, detect .sqlite files
            if self.engine == "duckdb" {
                lines.push(format!("DETACH DATABASE IF EXISTS {};", k));
            }
            let type_sqlite = if self.engine == "duckdb" && v.ends_with(".sqlite") {
                " (TYPE SQLITE)"
            } else {
                ""
            };
            lines.push(format!("ATTACH DATABASE '{}' AS {}{};", v, k, type_sqlite));
        }
        lines.join("\n")
    }

    /// Generate the full preamble for the current engine.
    /// Matches Python's `Annotations.Preamble()`.
    pub fn preamble(&self) -> String {
        let mut preamble = String::new();
        let attach = self.attach_database_statements();
        if !attach.is_empty() {
            preamble.push_str(&attach);
            preamble.push_str("\n\n");
        }
        let home = home_schema();
        match self.engine.as_str() {
            "psql" => {
                preamble.push_str(&format!(
                    "-- Initializing PostgreSQL environment.\n\
                     set client_min_messages to warning;\n\
                     create schema if not exists {};\n\
                     -- Empty logica type: logicarecord893574736;\n\
                     DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type \
                     where typname = 'logicarecord893574736') then \
                     create type logicarecord893574736 as (nirvana numeric); \
                     end if; END $$;\n\n",
                    home
                ));
            }
            "duckdb" => {
                let home_attachment = if self.user_attached_databases.contains_key(home) {
                    format!("-- {} attached by user.\n", home)
                } else {
                    format!("create schema if not exists {};\n", home)
                };
                preamble.push_str("-- Initializing DuckDB environment.\n");
                preamble.push_str(&home_attachment);
                preamble.push_str(
                    "-- Empty record, has to have a field by DuckDB syntax.\n\
                     drop type if exists logicarecord893574736 cascade; \
                     create type logicarecord893574736 as struct(nirvana numeric);\n"
                );
                if self.is_motherduck() {
                    preamble.push('\n'); // Sequences not supported in MotherDuck
                } else {
                    preamble.push_str("create sequence if not exists eternal_logical_sequence;\n\n");
                }
                // Thread count
                if let Some(threads_val) = self.engine_options.get("threads") {
                    if let Some(s) = extract_string_literal(threads_val) {
                        if let Ok(n) = s.parse::<i64>() {
                            preamble.push_str(&format!("set threads to {};\n", n));
                        }
                    } else if threads_val.is_int() {
                        preamble.push_str(&format!("set threads to {};\n", threads_val.as_int()));
                    }
                }
            }
            _ => {}
        }
        preamble
    }

    /// Get ground table name for a predicate, if any.
    pub fn ground(&self, pred_name: &str) -> Option<Ground> {
        let a = self.annotations.get(pred_name)?;
        let v = a.get("ground")?;
        let raw = v.as_str().to_string();

        // If the stored ground name equals the predicate name (no explicit table given),
        // prepend the default dataset. Matches Python:
        //   table_name = annotation.get('1', self.Dataset() + '.' + predicate_name)
        let table_name = if raw == pred_name {
            format!("{}.{}", self.dataset(), raw)
        } else {
            // Could be another predicate reference — check if it's grounded
            if let Some(other_ground) = self.annotations
                .get(&raw)
                .and_then(|ann| ann.get("ground"))
            {
                let other_raw = other_ground.as_str().to_string();
                if other_raw == raw {
                    format!("{}.{}", self.dataset(), other_raw)
                } else {
                    other_raw
                }
            } else {
                raw
            }
        };

        // Read overwrite flag (defaults to true)
        let overwrite = a.get("ground_overwrite")
            .and_then(|ow| {
                if let Json::Bool(b) = ow { Some(*b) }
                else { extract_string_literal(ow).map(|s| s != "false") }
            })
            .unwrap_or(true);

        // Read copy_to_file
        let copy_to_file = a.get("ground_copy_to_file")
            .and_then(|cf| extract_string_literal(cf));

        Some(Ground { table_name, overwrite, copy_to_file })
    }

    /// Get ORDER BY columns for a predicate, if any.
    pub fn order_by(&self, pred_name: &str) -> Option<Vec<String>> {
        self.annotations
            .get(pred_name)
            .and_then(|a| a.get("order_by"))
            .map(|v| {
                v.as_array()
                    .iter()
                    .filter_map(|item| {
                        // Try predicate name first, then string literal
                        Self::extract_predicate_name(item)
                            .or_else(|| extract_string_literal(item))
                    })
                    .collect()
            })
    }

    /// Generate ORDER BY SQL clause for a predicate.
    /// Handles DESC syntax: @OrderBy(Pred, "col1", "DESC") → ORDER BY col1 DESC
    pub fn order_by_clause(&self, pred_name: &str) -> String {
        match self.order_by(pred_name) {
            Some(order_by) if !order_by.is_empty() => {
                let mut parts = Vec::new();
                let len = order_by.len();
                // The column of each item is quoted like every column (a
                // keyword such as `order` must be); its direction follows.
                let dialect = crate::compiler::dialects::get(&self.engine).ok();
                let column = |item: &str| -> String {
                    let mut words = item.split_whitespace();
                    let name = words.next().unwrap_or_default();
                    let name = match &dialect {
                        Some(d) => crate::compiler::dialects::sql_column(name, d.as_ref()),
                        None => name.to_string(),
                    };
                    std::iter::once(name).chain(words.map(str::to_string)).collect::<Vec<_>>().join(" ")
                };
                // Nulls sort last, whatever the engine's default.
                let nulls_last = |item: String| -> String {
                    let lower = item.to_ascii_lowercase();
                    let descending = lower.split_whitespace().any(|w| w == "desc");
                    let first_by_default = dialect.as_ref().is_some_and(|d| d.nulls_first_by_default(descending));
                    if first_by_default && !lower.split_whitespace().any(|w| w == "nulls") {
                        format!("{} NULLS LAST", item)
                    } else {
                        item
                    }
                };
                for i in 0..len {
                    if order_by[i].eq_ignore_ascii_case("DESC") {
                        continue; // DESC is handled when processing the previous item
                    }
                    if i + 1 < len && order_by[i + 1].eq_ignore_ascii_case("DESC") {
                        parts.push(nulls_last(format!("{} DESC", column(&order_by[i]))));
                    } else {
                        parts.push(nulls_last(column(&order_by[i])));
                    }
                }
                format!(" ORDER BY {}", parts.join(", "))
            }
            _ => String::new(),
        }
    }

    /// Get LIMIT for a predicate, if any.
    pub fn limit_of(&self, pred_name: &str) -> Option<i64> {
        self.annotations
            .get(pred_name)
            .and_then(|a| a.get("limit"))
            .and_then(limit_number)
    }

    /// Generate LIMIT SQL clause for a predicate.
    pub fn limit_clause(&self, pred_name: &str) -> String {
        match self.limit_of(pred_name) {
            Some(n) => format!(" LIMIT {}", n),
            None => String::new(),
        }
    }

    /// Whether predicate should use WITH (CTE).
    pub fn use_with(&self, pred_name: &str) -> bool {
        self.annotations
            .get(pred_name)
            .and_then(|a| a.get("with"))
            .map(|v| match v {
                Json::Bool(b) => *b,
                _ => true,
            })
            .unwrap_or(true)
    }

    /// Whether a predicate is explicitly marked @NoInject.
    pub fn no_inject(&self, pred_name: &str) -> bool {
        self.annotations
            .get(pred_name)
            .and_then(|a| a.get("no_inject"))
            .map(|v| match v { Json::Bool(b) => *b, _ => false })
            .unwrap_or(false)
    }

    /// Whether a predicate can be injected (inlined into callers).
    /// Like Python's OkInjection: false if OrderBy, Limit, Ground, NoInject, or ForceWith.
    pub fn ok_injection(&self, pred_name: &str) -> bool {
        if self.order_by(pred_name).is_some()
            || self.limit_of(pred_name).is_some()
            || self.ground(pred_name).is_some()
            || self.no_inject(pred_name)
            || self.force_with(pred_name)
        {
            return false;
        }
        true
    }

    /// Whether @With is explicitly set (not just the default).
    pub fn force_with(&self, pred_name: &str) -> bool {
        self.annotations
            .get(pred_name)
            .and_then(|a| a.get("with"))
            .map(|v| match v { Json::Bool(b) => *b, _ => false })
            .unwrap_or(false)
    }

    /// Get all raw rules for a given annotation name (e.g. "@Recursive", "@Make").
    /// Returns None if the annotation doesn't exist.
    pub fn get_annotation_rules(&self, _annotation: &str) -> Option<Vec<Json>> {
        // This method is called from functors, but the Annotations struct
        // doesn't store raw rules anymore. We need to provide this differently.
        // For now, return None - the caller should use alternative methods.
        None
    }

    /// Get iteration definitions from @Iteration annotations.
    /// Get iteration definitions from @Iteration annotations.
    /// Matches Python's Annotations.Iterations().
    pub fn iterations(&self) -> CompileResult<HashMap<String, IterationDef>> {
        let mut result = HashMap::new();
        let prefix = "@Iteration_";

        for (key, annot) in &self.annotations {
            if !key.starts_with(prefix) {
                continue;
            }
            let iteration_name = key[prefix.len()..].to_string();

            // The arguments are expressions: `predicates: [P, Q]` is a list
            // literal of predicate literals, `repetitions: 19` a number literal.
            let literal = |v: &Json| -> Option<Json> {
                let o = v.as_object();
                o.get("literal").cloned().or_else(|| o.get("expression").and_then(|e| e.as_object().get("literal").cloned()))
            };
            let predicates: Vec<String> = match annot.get("predicates") {
                Some(preds_json) => literal(preds_json)
                    .and_then(|l| l.as_object().get("the_list").cloned())
                    .and_then(|list| list.as_object().get("element").cloned())
                    .map(|elements| {
                        elements
                            .as_array()
                            .iter()
                            .filter_map(|e| {
                                let l = literal(e)?;
                                let p = l.as_object().get("the_predicate")?;
                                Some(p.as_object().get("predicate_name")?.as_str().to_string())
                            })
                            .collect()
                    })
                    .unwrap_or_default(),
                None => {
                    return Err(CompileError::new(
                        "Iteration must specify list of predicates.".to_string(), &iteration_name));
                }
            };
            if predicates.is_empty() {
                return Err(CompileError::new(
                    "Iteration must specify list of predicates.".to_string(), &iteration_name));
            }

            let repetitions = match annot.get("repetitions") {
                Some(rep) => limit_number(rep).ok_or_else(|| {
                    CompileError::new("Iteration repetitions must be a number.".to_string(), &iteration_name)
                })?,
                None => {
                    return Err(CompileError::new(
                        "Iteration must specify number of repetitions.".to_string(), &iteration_name));
                }
            };

            // Extract optional stop_signal
            let stop_signal = annot.get("stop_signal").and_then(extract_string_literal);

            // Semi-naive evaluation's accumulated table (see IterationDef).
            let accumulate = annot.get("accumulate").and_then(|v| {
                let l = literal(v)?;
                let p = l.as_object().get("the_predicate")?;
                Some(p.as_object().get("predicate_name")?.as_str().to_string())
            });

            result.insert(iteration_name, IterationDef {
                predicates,
                repetitions,
                stop_signal,
                accumulate,
            });
        }

        Ok(result)
    }

    /// Get the set of grounded predicates.
    pub fn grounded_predicates(&self) -> HashSet<String> {
        self.annotations
            .iter()
            .filter(|(_, v)| v.contains_key("ground"))
            .map(|(k, _)| k.clone())
            .collect()
    }
}

#[cfg(test)]
#[path = "annotations_test.rs"]
mod annotations_test;
