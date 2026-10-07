// Modified from: logica/compiler/functors.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// Original work: Copyright 2020 Google LLC, licensed under the Apache License, Version 2.0.
// Modifications: Copyright 2025-2026 Yoan Sallami (Synalinks Team), licensed under the Apache License, Version 2.0.

//! Functors library — processing @Make instructions and recursion unfolding.
//!
//! Matches Python's `compiler/functors.py`.

// Remaining missing features from Python functors.py:
//   - AddAutoStop(): adds automatic stop predicate for infinite recursion (depth == -1).
//   - InscribeOrbits(): writes satellite predicates from @Recursive into rule bodies.
// Implemented: WalkWithTaboo, RemoveRulesProvenToBeNil, GetFlatIterativeRecursionFunctor, GetStop.

use std::collections::{HashMap, HashSet, BTreeSet, VecDeque};
use crate::parser::Json;
use crate::compiler::CompileResult;
use crate::compiler::CompileError;

/// Parse Logica source text into rules, converting parse errors to CompileError.
fn parse_rules(text: &str) -> CompileResult<Vec<Json>> {
    let parsed = crate::parser::parse_file(text, None, &[]).map_err(|e| {
        CompileError::new(format!("Failed to parse generated program: {}", e.show_message()), "")
    })?;
    Ok(parsed.as_object()["rule"].as_array().to_vec())
}

/// Walk over a JSON tree, calling `act` on each node.
/// Returns set of strings collected by `act`.
fn walk(node: &Json, act: &dyn Fn(&Json) -> Vec<String>) -> HashSet<String> {
    let mut result = HashSet::new();
    let mut stack: Vec<&Json> = vec![node];
    while let Some(current) = stack.pop() {
        for s in act(current) {
            result.insert(s);
        }
        match current {
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
    result
}

/// Walk over a JSON tree, calling `act` on each node, but skip dict keys in `taboo`.
/// Matches Python's WalkWithTaboo(x, act, taboo).
fn walk_with_taboo(node: &Json, act: &dyn Fn(&Json) -> Vec<String>, taboo: &HashSet<&str>) -> HashSet<String> {
    let mut result = HashSet::new();
    let mut stack: Vec<&Json> = vec![node];
    while let Some(current) = stack.pop() {
        for s in act(current) {
            result.insert(s);
        }
        match current {
            Json::Object(o) => {
                for (k, v) in o.iter() {
                    if !taboo.contains(k.as_str()) {
                        stack.push(v);
                    }
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
    result
}

/// Walk a JSON tree, modifying predicate names in-place.
fn walk_replace_predicate(node: &mut Json, from: &str, to: &str) {
    let mut stack: Vec<*mut Json> = vec![node as *mut Json];
    while let Some(ptr) = stack.pop() {
        // SAFETY: Each pointer is derived from a unique child of the tree.
        // We never hold two mutable references to the same node simultaneously.
        let current = unsafe { &mut *ptr };
        match current {
            Json::Object(o) => {
                if let Some(pn) = o.get("predicate_name") {
                    if pn.is_string() && pn.as_str() == from {
                        o.insert("predicate_name".into(), Json::Str(to.to_string()));
                    }
                }
                let keys: Vec<String> = o.keys().cloned().collect();
                for k in keys {
                    if let Some(v) = o.get_mut(&k) {
                        stack.push(v as *mut Json);
                    }
                }
            }
            Json::Array(a) => {
                for v in a.iter_mut() {
                    stack.push(v as *mut Json);
                }
            }
            _ => {}
        }
    }
}

/// Extract predicate names from a JSON tree.
fn extract_predicate_names(node: &Json) -> HashSet<String> {
    walk(node, &|x| {
        if let Json::Object(o) = x {
            if let Some(pn) = o.get("predicate_name") {
                if pn.is_string() {
                    return vec![pn.as_str().to_string()];
                }
            }
        }
        vec![]
    })
}

/// Group rules by predicate name.
fn defined_predicates_rules(rules: &[Json]) -> HashMap<String, Vec<Json>> {
    let mut map: HashMap<String, Vec<Json>> = HashMap::new();
    for rule in rules {
        if let Some(head) = rule.as_object().get("head") {
            let name = head.as_object()["predicate_name"].as_str().to_string();
            map.entry(name).or_default().push(rule.clone());
        }
    }
    map
}

/// Functors: processes @Make instructions and recursion unfolding.
///
/// Note: Python optionally uses numpy for fast matrix-based transitive closure
/// (NumpyBuildArgsOf). The iterative BuildArgs path used here covers all cases.
pub struct Functors {
    /// How many rules the program has: `extended_rules` starts with them.
    original_rules: usize,
    pub extended_rules: Vec<Json>,
    rules_of: HashMap<String, Vec<Json>>,
    /// How many of `extended_rules` `rules_of` holds: rules are appended,
    /// so an update reads only the new ones.
    indexed_rules: usize,
    predicates: HashSet<String>,
    direct_args_of: HashMap<String, HashSet<String>>,
    args_of: HashMap<String, HashSet<String>>,
    creation_count: usize,
    cached_calls: HashMap<String, String>,
    constant_literal_function: HashMap<String, String>,
}

impl Functors {
    pub fn new(rules: &[Json]) -> Self {
        let rules_of = defined_predicates_rules(rules);
        let predicates: HashSet<String> = rules_of.keys().cloned().collect();

        let mut f = Functors {
            original_rules: rules.len(),
            extended_rules: rules.to_vec(),
            rules_of,
            indexed_rules: rules.len(),
            predicates: predicates.clone(),
            direct_args_of: HashMap::new(),
            args_of: HashMap::new(),
            creation_count: 0,
            cached_calls: HashMap::new(),
            constant_literal_function: HashMap::new(),
        };

        // Build direct args
        for functor in &predicates {
            f.direct_args_of.insert(
                functor.clone(),
                f.build_direct_args_of_predicate(functor),
            );
        }

        // Build transitive args (sorted for determinism)
        let mut preds: Vec<String> = predicates.into_iter().collect();
        preds.sort();
        for p in &preds {
            f.build_args(p);
        }

        f
    }

    fn build_direct_args_of_predicate(&self, functor: &str) -> HashSet<String> {
        let mut args = HashSet::new();
        if let Some(rules) = self.rules_of.get(functor) {
            for rule in rules {
                if let Some(body) = rule.as_object().get("body") {
                    args.extend(extract_predicate_names(body));
                }
                if let Some(head) = rule.as_object().get("head") {
                    if let Some(rec) = head.as_object().get("record") {
                        args.extend(extract_predicate_names(rec));
                    }
                }
            }
        }
        args
    }

    /// Compute transitive args for a functor.
    /// Matches Python's ArgsOf + BuildArgs with proper cycle handling.
    ///
    /// Python's approach:
    /// - BuildArgs returns result WITH building_ markers (raw)
    /// - ArgsOf decides whether to cache based on building_ markers
    /// - When a cached result has building_ marker, ArgsOf returns a generator
    ///   (preliminary), causing the caller to add items to queue instead of result
    fn build_args(&mut self, initial_functor: &str) -> HashSet<String> {
        // ArgsOf: check cache first
        if let Some(cached) = self.args_of.get(initial_functor) {
            // Cached result — might contain building_ markers (cycle)
            return cached.clone();
        }

        // BuildArgs
        if !self.direct_args_of.contains_key(initial_functor) {
            return HashSet::new();
        }

        // Place "building" marker (cycle detection)
        let building_marker = format!("building_{}", initial_functor);
        self.args_of.insert(initial_functor.to_string(), {
            let mut s = HashSet::new();
            s.insert(building_marker.clone());
            s
        });

        let mut result = HashSet::new();
        let direct = self.direct_args_of.get(initial_functor).cloned().unwrap_or_default();
        let mut queue: VecDeque<String> = direct.into_iter().collect();

        while let Some(e) = queue.pop_front() {
            if result.contains(&e) {
                continue;
            }
            result.insert(e.clone());

            // Recursively get args of e (ArgsOf)
            let args_of_e = self.build_args(&e);

            // Check if the result is "preliminary" (contains building_ markers)
            // Python: isinstance(args_of_e, set) → final, generator → preliminary
            let is_preliminary = args_of_e.iter().any(|a| a.starts_with("building_"));

            for a in &args_of_e {
                if a.starts_with("building_") {
                    // Propagate building markers to our result (for cycle detection upstream)
                    if *a != building_marker {
                        result.insert(a.clone());
                    }
                    continue;
                }
                if !result.contains(a) {
                    if is_preliminary {
                        // Preliminary: add to queue for further expansion
                        queue.push_back(a.clone());
                    } else {
                        // Final: just add to result
                        result.insert(a.clone());
                    }
                }
            }
        }

        // Remove the building marker placeholder from args_of
        self.args_of.remove(initial_functor);

        // Remove own building marker from result
        result.remove(&building_marker);

        // Check if result still has building markers from other predicates
        let has_building = result.iter().any(|a| a.starts_with("building_"));
        if !has_building {
            // Final result — cache it
            self.args_of.insert(initial_functor.to_string(), result.clone());
        }
        // If has building markers, return raw (Python returns generator in this case)
        // Next time build_args is called for this functor, it won't be cached,
        // so it will be recomputed (hopefully with more complete info).

        result
    }

    fn update_structure(&mut self, new_predicate: &str) {
        // The rules appended since the last update join the index.
        for rule in &self.extended_rules[self.indexed_rules..] {
            if let Some(head) = rule.as_object().get("head") {
                let name = head.as_object()["predicate_name"].as_str().to_string();
                self.predicates.insert(name.clone());
                self.rules_of.entry(name).or_default().push(rule.clone());
            }
        }
        self.indexed_rules = self.extended_rules.len();

        if self.rules_of.contains_key(new_predicate) {
            let args = self.build_direct_args_of_predicate(new_predicate);
            self.direct_args_of.insert(new_predicate.to_string(), args);
        }

        for p in self.rules_of.keys() {
            if !self.direct_args_of.contains_key(p) {
                let args = self.build_direct_args_of_predicate(p);
                self.direct_args_of.insert(p.clone(), args);
            }
        }

        // Reset affected args_of entries
        let mut to_remove = Vec::new();
        for (predicate, args) in self.args_of.iter() {
            if args.contains(new_predicate) || predicate == new_predicate {
                to_remove.push(predicate.clone());
            }
        }
        for p in to_remove {
            self.args_of.remove(&p);
        }
        let mut preds: Vec<String> = self.predicates.iter().cloned().collect();
        preds.sort();
        for p in &preds {
            self.build_args(p);
        }
    }

    /// The predicates an `@Iteration` of `target` names: its `predicates`
    /// and the one it `accumulate`s into.
    fn iteration_companions(&self, target: &str) -> Vec<String> {
        let mut out = Vec::new();
        for rule in self.rules_of.get("@Iteration").into_iter().flatten() {
            let Some(rec) = rule.as_object()["head"].as_object().get("record") else { continue };
            let names = extract_predicate_names(rec);
            let fvs = rec.as_object()["field_value"].as_array();
            let first = fvs.first()
                .and_then(|fv| fv.as_object()["value"].as_object().get("expression"))
                .and_then(|e| e.as_object().get("literal"))
                .and_then(|l| l.as_object().get("the_predicate"))
                .map(|p| p.as_object()["predicate_name"].as_str().to_string());
            if first.as_deref() == Some(target) {
                out.extend(names.into_iter().filter(|n| n != target));
            }
        }
        out.sort();
        out.dedup();
        out
    }

    fn args_of(&self, functor: &str) -> HashSet<String> {
        self.args_of.get(functor).cloned().unwrap_or_default()
    }

    /// Get the full args_of map (predicate → transitive dependencies).
    pub fn get_args_of_map(&self) -> &HashMap<String, HashSet<String>> {
        &self.args_of
    }

    fn all_rules_of(&self, functor: &str) -> CompileResult<Vec<Json>> {
        let mut result = Vec::new();
        if let Some(rules) = self.rules_of.get(functor) {
            result.extend(rules.iter().cloned());
        }
        if let Some(args) = self.args_of.get(functor) {
            for f in args {
                if f == functor {
                    // Python raises FunctorError here: recursion should have been
                    // eliminated by UnfoldRecursions. We warn instead because Rust's
                    // recursion unfolding is not fully ported yet.
                    eprintln!("[WARNING] Failed to eliminate recursion of {}.", functor);
                    continue;
                }
                if let Some(rules) = self.rules_of.get(f) {
                    result.extend(rules.iter().cloned());
                }
            }
        }
        Ok(result)
    }

    /// Get or create a constant function for a typed value.
    /// The key includes type prefix to distinguish int 42 from string "42".
    fn get_constant_function(&mut self, key: &str) -> String {
        if let Some(name) = self.constant_literal_function.get(key) {
            return name.clone();
        }
        let name = format!("LogicaCompilerConstant{}", self.constant_literal_function.len());
        self.constant_literal_function.insert(key.to_string(), name.clone());
        name
    }

    fn get_int_constant_function(&mut self, value: i64) -> String {
        let key = format!("int:{}", value);
        self.get_constant_function(&key)
    }

    fn get_str_constant_function(&mut self, value: &str) -> String {
        let key = format!("str:{}", value);
        self.get_constant_function(&key)
    }

    fn parse_make_instruction(
        &mut self,
        predicate: &str,
        instruction: &Json,
    ) -> CompileResult<(String, String, HashMap<String, String>)> {
        let io = instruction.as_object();
        let first = io.get("1").ok_or_else(|| {
            CompileError::new(format!("Bad @Make instruction for {}", predicate), "")
        })?;
        let applicant = first.as_object()["predicate_name"].as_str().to_string();

        let mut args_map = HashMap::new();
        if let Some(second) = io.get("2") {
            let so = second.as_object();
            for (arg_name, arg_value) in so.iter() {
                if arg_value.is_object() {
                    let avo = arg_value.as_object();
                    // Check for predicate_name (direct predicate reference)
                    if let Some(pn) = avo.get("predicate_name") {
                        args_map.insert(arg_name.clone(), pn.as_str().to_string());
                        continue;
                    }
                    // Check for literal values in expression form
                    if let Some(lit) = avo.get("literal") {
                        let lo = lit.as_object();
                        // String literal: {"literal": {"the_string": {"the_string": "..."}}}
                        if let Some(ts) = lo.get("the_string") {
                            let s = if ts.is_string() {
                                ts.as_str().to_string()
                            } else if let Some(inner) = ts.as_object().get("the_string") {
                                inner.as_str().to_string()
                            } else {
                                continue;
                            };
                            let func = self.get_str_constant_function(&s);
                            args_map.insert(arg_name.clone(), func);
                            continue;
                        }
                        // Number literal: {"literal": {"the_number": {"number": "..."}}}
                        if let Some(tn) = lo.get("the_number") {
                            let n = if tn.is_int() {
                                tn.as_int()
                            } else if let Some(inner) = tn.as_object().get("number") {
                                inner.as_str().parse::<i64>().unwrap_or(0)
                            } else {
                                continue;
                            };
                            let func = self.get_int_constant_function(n);
                            args_map.insert(arg_name.clone(), func);
                            continue;
                        }
                    }
                } else if arg_value.is_int() {
                    let func = self.get_int_constant_function(arg_value.as_int());
                    args_map.insert(arg_name.clone(), func);
                } else if arg_value.is_string() {
                    let func = self.get_str_constant_function(arg_value.as_str());
                    args_map.insert(arg_name.clone(), func);
                }
            }
        }

        Ok((predicate.to_string(), applicant, args_map))
    }

    fn call_key(&self, functor: &str, args_map: &HashMap<String, String>) -> String {
        let args_of = self.args_of(functor);
        let mut relevant: Vec<(&String, &String)> = args_map
            .iter()
            .filter(|(k, _)| args_of.contains(*k))
            .collect();
        relevant.sort_by_key(|(k, _)| (*k).clone());
        let args_str: Vec<String> = relevant
            .iter()
            .map(|(k, v)| format!("{}: {}", k, v))
            .collect();
        format!("{}({})", functor, args_str.join(", "))
    }

    fn collect_annotations(&self, predicates: &HashSet<String>) -> CompileResult<Vec<Json>> {
        let mut result = Vec::new();
        for (annotation, rules) in &self.rules_of {
            if !matches!(
                annotation.as_str(),
                "@Limit" | "@OrderBy" | "@Ground" | "@NoInject" | "@Iteration"
            ) {
                continue;
            }
            for rule in rules {
                let head = &rule.as_object()["head"];
                let fvs = head.as_object()["record"].as_object()["field_value"].as_array();
                if let Some(first_fv) = fvs.first() {
                    let value = &first_fv.as_object()["value"];
                    if let Some(expr) = value.as_object().get("expression") {
                        if let Some(lit) = expr.as_object().get("literal") {
                            if let Some(pred) = lit.as_object().get("the_predicate") {
                                let pn = pred.as_object()["predicate_name"].as_str();
                                if predicates.contains(pn) {
                                    result.push(rule.clone());
                                }
                            } else {
                                // First argument is not a predicate symbol
                                let full_text = rule.as_object().get("full_text")
                                    .map(|ft| ft.as_str().to_string())
                                    .unwrap_or_default();
                                return Err(CompileError::new(
                                    "This annotation requires predicate symbol as the first positional argument.".to_string(),
                                    &full_text));
                            }
                        }
                    }
                }
            }
        }
        Ok(result)
    }

    fn call_functor(
        &mut self,
        name: &str,
        applicant: &str,
        given_args: &HashMap<String, String>,
    ) -> CompileResult<()> {
        // Every argument must be a predicate the applicant depends on.
        let applicant_args = self.args_of(applicant);
        let args_map = &resolve_functor_args(applicant, &applicant_args, given_args);
        let mut bad_args: Vec<&str> = args_map.keys()
            .filter(|k| !applicant_args.contains(*k))
            .map(|s| s.as_str())
            .collect();
        if !bad_args.is_empty() {
            // Applying it anyway would silently return the generic rule's rows.
            bad_args.sort();
            return Err(CompileError::new(
                format!(
                    "Functor {} is applied to {}, which it does not depend on.",
                    applicant,
                    bad_args.join(", ")
                ),
                name,
            ));
        }

        // Increment creation_count at start of every call_functor (matches Python)
        self.creation_count += 1;

        let mut rules = self.all_rules_of(applicant)?;
        // An iteration's predicates (`@Iteration(P_sn_delta, predicates:
        // [P_sn_new, P_sn_back], accumulate: P_sn_full)`) are read by no rule
        // of what the iteration computes, only by its loop: they are copied
        // with it, or the copy would loop over the original's.
        let mut heads: HashSet<String> = rules.iter()
            .map(|r| r.as_object()["head"].as_object()["predicate_name"].as_str().to_string())
            .collect();
        loop {
            let companions: Vec<String> = heads.iter()
                .flat_map(|h| self.iteration_companions(h))
                .filter(|c| !heads.contains(c))
                .collect();
            if companions.is_empty() {
                break;
            }
            for c in companions {
                for r in self.all_rules_of(&c)? {
                    heads.insert(r.as_object()["head"].as_object()["predicate_name"].as_str().to_string());
                    rules.push(r);
                }
                heads.insert(c);
            }
        }
        let mut seen = HashSet::new();
        rules.retain(|r| seen.insert(r.to_string_fmt(false)));

        let args: HashSet<String> = args_map.keys().cloned().collect();

        // Filter rules to those that use the args
        rules.retain(|r| {
            let rp = r.as_object()["head"].as_object()["predicate_name"].as_str();
            if rp == applicant {
                return true;
            }
            let pred_args = self.args_of(rp);
            !pred_args.is_disjoint(&args)
        });

        // Sort rules by string representation for determinism (matches Python: sorted(rules, key=str))
        rules.sort_by(|a, b| {
            a.to_string_fmt(false).cmp(&b.to_string_fmt(false))
        });

        let mut extended_args_map = args_map.clone();
        let mut rules_to_update = Vec::new();
        let mut predicates_to_annotate = HashSet::new();

        for r in rules.iter().cloned() {
            let rule_predicate_name = r.as_object()["head"].as_object()["predicate_name"]
                .as_str()
                .to_string();
            if rule_predicate_name == applicant {
                extended_args_map.insert(rule_predicate_name.clone(), name.to_string());
                rules_to_update.push(r);
                predicates_to_annotate.insert(rule_predicate_name);
            } else {
                if args_map.contains_key(&rule_predicate_name) {
                    continue;
                }
                let call_key = self.call_key(&rule_predicate_name, args_map);
                if let Some(cached) = self.cached_calls.get(&call_key) {
                    // Already have a new name for this predicate with these args
                    extended_args_map.insert(rule_predicate_name, cached.clone());
                    // Still need to add this rule to update (all rules of this predicate)
                    rules_to_update.push(r);
                } else {
                    let new_name = format!("{}_f{}", rule_predicate_name, self.creation_count);
                    extended_args_map.insert(rule_predicate_name.clone(), new_name.clone());
                    self.cached_calls.insert(call_key, new_name);
                    rules_to_update.push(r);
                    predicates_to_annotate.insert(rule_predicate_name);
                }
            }
        }

        // Collect annotations
        let annotations = self.collect_annotations(&predicates_to_annotate)?;
        rules_to_update.extend(annotations);

        // Replace predicate names
        for r in &mut rules_to_update {
            for (from, to) in &extended_args_map {
                walk_replace_predicate(r, from, to);
            }
        }

        self.extended_rules.extend(rules_to_update);
        self.update_structure(name);
        Ok(())
    }

    /// Process all @Make instructions.
    pub fn make_all(
        &mut self,
        predicate_to_instruction: &[(String, Json)],
    ) -> CompileResult<()> {
        let mut needs_building: HashSet<String> = HashSet::new();
        let mut parsed_instructions = Vec::new();
        for (p, instr) in predicate_to_instruction {
            let (name, applicant, args_map) = self.parse_make_instruction(p, instr)?;
            needs_building.insert(name.clone());
            parsed_instructions.push((name, applicant, args_map));
        }

        while !needs_building.is_empty() {
            let mut something_built = false;
            let sorted: Vec<_> = parsed_instructions.iter().cloned().collect();
            for (name, applicant, args_map) in &sorted {
                if !needs_building.contains(name) {
                    continue;
                }
                if needs_building.contains(applicant) {
                    continue;
                }
                let applicant_args = self.args_of(applicant);
                if !applicant_args.is_disjoint(&needs_building) {
                    continue;
                }
                let arg_values: HashSet<String> = args_map.values().cloned().collect();
                if !arg_values.is_disjoint(&needs_building) {
                    continue;
                }
                self.call_functor(name, applicant, args_map)?;
                something_built = true;
                needs_building.remove(name);
            }
            if !needs_building.is_empty() && !something_built {
                // Debug: show why each remaining predicate is blocked
                for (name, applicant, args_map) in &sorted {
                    if !needs_building.contains(name) { continue; }
                    let app_in_nb = needs_building.contains(applicant);
                    let app_args = self.args_of(applicant);
                    let app_inter: Vec<_> = app_args.intersection(&needs_building).cloned().collect();
                    let av: HashSet<String> = args_map.values().cloned().collect();
                    let av_inter: Vec<_> = av.intersection(&needs_building).cloned().collect();
                    eprintln!("[STUCK] {} applicant={} app_in_nb={} app_args_inter={:?} av_inter={:?}",
                        name, applicant, app_in_nb, app_inter, av_inter);
                }
                return Err(CompileError::new(
                    format!("Could not resolve Make order for: {:?}", needs_building),
                    "",
                ));
            }
        }

        // Remove rules proven to be nil (empty propagation).
        // Matches Python's RemoveRulesProvenToBeNil.
        self.remove_rules_proven_to_be_nil()?;

        // Add constant literal functions
        for (key, function) in &self.constant_literal_function {
            // Keys are prefixed with type: "int:42" or "str:hello"
            let rule_text = if let Some(int_val) = key.strip_prefix("int:") {
                format!("{}() = {};", function, int_val)
            } else if let Some(str_val) = key.strip_prefix("str:") {
                format!("{}() = \"{}\";", function, str_val)
            } else {
                // Fallback: try to parse as int, else treat as string
                if let Ok(_n) = key.parse::<i64>() {
                    format!("{}() = {};", function, key)
                } else {
                    format!("{}() = \"{}\";", function, key)
                }
            };
            if let Ok(rules) = parse_rules(&rule_text) {
                self.extended_rules.extend(rules);
            }
        }

        Ok(())
    }

    /// Remove rules that are provably nil (empty).
    /// Matches Python's RemoveRulesProvenToBeNil().
    /// Iteratively finds predicates whose all rules reference nil predicates,
    /// then nullifies those predicates and propagates.
    fn remove_rules_proven_to_be_nil(&mut self) -> CompileResult<()> {
        let mut proven_to_be_nothing: HashSet<String> = HashSet::new();
        proven_to_be_nothing.insert("nil".to_string());

        // Skip the_predicate, combine, satellites as per Python's logic
        // We also skip "predicate_name" at head level (handled separately below)
        let taboo: HashSet<&str> = ["the_predicate", "combine", "satellites"].iter().cloned().collect();

        let defined_predicates: HashSet<String> = self.extended_rules.iter()
            .filter_map(|r| r.as_object().get("head").map(|h|
                h.as_object()["predicate_name"].as_str().to_string()))
            .collect();

        loop {
            let mut rules_per_predicate: HashMap<String, usize> = HashMap::new();

            for rule in &self.extended_rules {
                let head_pred = rule.as_object()["head"].as_object()["predicate_name"]
                    .as_str().to_string();

                // Count how many nil references this rule has
                // We walk the body and head.record, but not head.predicate_name directly
                let nil_refs = {
                    let proven = &proven_to_be_nothing;
                    let count_nils = |x: &Json| -> Vec<String> {
                        if let Json::Object(o) = x {
                            if let Some(pn) = o.get("predicate_name") {
                                if pn.is_string() && proven.contains(pn.as_str()) {
                                    return vec![pn.as_str().to_string()];
                                }
                            }
                        }
                        vec![]
                    };
                    let mut refs = HashSet::new();
                    // Walk the body
                    if let Some(body) = rule.as_object().get("body") {
                        refs.extend(walk_with_taboo(body, &count_nils, &taboo));
                    }
                    // Walk the head.record (to find nil refs in head expressions)
                    if let Some(head) = rule.as_object().get("head") {
                        if let Some(record) = head.as_object().get("record") {
                            refs.extend(walk_with_taboo(record, &count_nils, &taboo));
                        }
                    }
                    refs
                };
                let nil_count = nil_refs.len();

                // A rule is "alive" if it has no nil references
                let alive = if nil_count == 0 { 1 } else { 0 };
                *rules_per_predicate.entry(head_pred).or_insert(0) += alive;
            }

            let mut is_nothing = HashSet::new();
            for p in &defined_predicates {
                if *rules_per_predicate.get(p).unwrap_or(&0) == 0 {
                    is_nothing.insert(p.clone());
                }
            }

            if is_nothing.is_subset(&proven_to_be_nothing) {
                break;
            }
            proven_to_be_nothing.extend(is_nothing);
        }

        // Nullify proven-to-be-nothing predicates
        for p in &proven_to_be_nothing {
            if p == "nil" {
                continue;
            }
            for rule in &mut self.extended_rules {
                let head_pred = rule.as_object()["head"].as_object()["predicate_name"]
                    .as_str().to_string();
                if head_pred == *p {
                    // Rename head to Nullified<p>
                    let nullified_name = format!("Nullified{}", p);
                    rule.as_object_mut().get_mut("head").unwrap()
                        .as_object_mut()
                        .insert("predicate_name".into(), Json::Str(nullified_name));
                } else if !head_pred.starts_with('@') {
                    // Replace references in body to nil
                    walk_replace_predicate(rule, p, "nil");
                }
            }

            // Error for user predicates (no underscore = user-facing)
            if !p.contains('_') {
                return Err(CompileError::new(
                    format!("Predicate {} was proven to be empty. \
                        Most likely initial base condition of recursion is missing, or \
                        flat recursion is not given enough steps.", p),
                    p));
            }
        }

        // The rules were rewritten in place: index them all again.
        self.rules_of.clear();
        self.predicates.clear();
        self.indexed_rules = 0;
        self.update_structure(
            proven_to_be_nothing.iter().next().map(|s| s.as_str()).unwrap_or(""));
        Ok(())
    }

    /// Recursive analysis: find recursive cycles and choose unfolding style.
    /// Matches Python's RecursiveAnalysis().
    fn recursive_analysis(
        &self,
        depth_map: &mut HashMap<String, HashMap<String, SerdeLikeValue>>,
        default_iterative: bool,
        default_depth: i64,
    ) -> (HashMap<String, String>, HashMap<String, HashSet<String>>) {
        let mut cover_list: Vec<HashSet<String>> = Vec::new();
        let mut covered = HashSet::new();

        let mut sorted_args: Vec<_> = self.args_of.iter().collect();
        sorted_args.sort_by(|a, b| a.0.cmp(b.0));
        for (p, args) in sorted_args {
            if args.contains(p) && !covered.contains(p) && !p.contains("_MultBodyAggAux") {
                let mut c = HashSet::new();
                c.insert(p.clone());
                for p2 in args {
                    if let Some(p2_args) = self.args_of.get(p2) {
                        if p2_args.contains(p) {
                            c.insert(p2.clone());
                        }
                    }
                }
                covered.extend(c.iter().cloned());
                cover_list.push(c);
            }
        }

        let mut my_cover: HashMap<String, HashSet<String>> = HashMap::new();
        for c in &cover_list {
            for p in c {
                my_cover.insert(p.clone(), c.clone());
            }
        }

        let deep: HashSet<String> = depth_map.keys().cloned().collect();
        let mut should_recurse: HashMap<String, String> = HashMap::new();

        for c in &cover_list {
            let p = if let Some(dp) = c.intersection(&deep).min() {
                dp.clone()
            } else {
                c.iter().min().unwrap().clone()
            };

            let mut depth = depth_map.get(&p)
                .and_then(|m| m.get("1"))
                .and_then(|v| v.as_i64())
                .unwrap_or(default_depth);

            // Python: depth == -1 → 1000000000 (effectively infinite)
            if depth == -1 {
                depth = 1_000_000_000;
                if let Some(m) = depth_map.get_mut(&p) {
                    m.insert("1".to_string(), SerdeLikeValue::Int(depth));
                }
            }

            // Past 20 steps a recursion is iterated, a table per step.
            let use_iterative = default_iterative || depth > 20;

            if use_iterative {
                should_recurse.insert(p, "iterative_horizontal".to_string());
            } else if visible_count(c) == 1 && self.is_cut_of_cover(&p, c) {
                // Upstream also unrolls mutual recursion vertically, the other
                // predicates inlined into each step of `p`: a step then
                // applies the rules of the whole cycle, where a step of the
                // iterated recursion applies each rule once. One predicate
                // only, so a depth means the same steps either way.
                should_recurse.insert(p, "vertical".to_string());
            } else {
                should_recurse.insert(p, "horizontal".to_string());
            }
        }

        (should_recurse, my_cover)
    }

    /// Check if `p` is a cut of the cover leaf — removing p prevents cycles among remaining members.
    /// Matches Python's IsCutOfCover using DFS with visited tracking.
    fn is_cut_of_cover(&self, p: &str, cover: &HashSet<String>) -> bool {
        // DFS: starting from p, follow cover edges (excluding p itself from traversal).
        // If we can reach a node we already visited without going through p, there's a cycle.
        let mut stack: Vec<(&str, HashSet<String>)> = vec![(p, HashSet::new())];
        while let Some((t, visited)) = stack.pop() {
            if visited.contains(t) {
                return false; // Cycle found without going through p
            }
            if let Some(direct) = self.direct_args_of.get(t) {
                for x in direct {
                    if cover.contains(x) && x.as_str() != p {
                        let mut new_visited = visited.clone();
                        new_visited.insert(t.to_string());
                        stack.push((x, new_visited));
                    }
                }
            }
        }
        true
    }

    /// Unfold recursive predicates (vertical style).
    fn unfold_recursive_predicate(
        &self,
        predicate: &str,
        cover: &HashSet<String>,
        depth: i64,
        rules: &mut Vec<Json>,
    ) -> CompileResult<()> {
        let new_predicate_name = format!("{}_recursive", predicate);
        let new_predicate_head_name = format!("{}_recursive_head", predicate);

        for r in rules.iter_mut() {
            let head_pred = r.as_object()["head"].as_object()["predicate_name"]
                .as_str()
                .to_string();

            if head_pred == predicate {
                r.as_object_mut().get_mut("head").unwrap()
                    .as_object_mut()
                    .insert("predicate_name".into(), Json::Str(new_predicate_head_name.clone()));
                walk_replace_predicate(r, predicate, &new_predicate_name);
                for c in cover {
                    if c != predicate {
                        walk_replace_predicate(r, c, &format!("{}_recursive_head", c));
                    }
                }
            } else if cover.contains(&head_pred) {
                // Rename head to _recursive_head variant
                let cover_head_name = format!("{}_recursive_head", head_pred);
                r.as_object_mut().get_mut("head").unwrap()
                    .as_object_mut()
                    .insert("predicate_name".into(), Json::Str(cover_head_name));
                // Replace references to main predicate with _recursive
                walk_replace_predicate(r, predicate, &new_predicate_name);
                // Replace references to other cover members with _recursive_head
                for c in cover {
                    if c != predicate {
                        walk_replace_predicate(r, c, &format!("{}_recursive_head", c));
                    }
                }
            } else if head_pred.starts_with('@')
                && head_pred != "@Make"
                // The ordering and limit are the result's, not each step's.
                && head_pred != "@OrderBy"
                && head_pred != "@Limit"
            {
                walk_replace_predicate(r, predicate, &new_predicate_head_name);
                for c in cover {
                    if c != predicate {
                        walk_replace_predicate(r, c, &format!("{}_recursive_head", c));
                    }
                }
            }
        }

        // Generate recursion functor program
        let lib = get_recursion_functor(depth, predicate);
        for r in parse_rules(&lib)? {
            rules.push(r);
        }

        // Generate renaming functors for cover members
        for c in cover {
            if c != predicate {
                let rename_lib = format!(
                    "{0} := {0}_recursive_head({1}_recursive: {1});",
                    c, predicate
                );
                for r in parse_rules(&rename_lib)? {
                    rules.push(r);
                }
            }
        }

        Ok(())
    }

    /// Unfold recursive predicates (flat/horizontal style).
    fn unfold_recursive_predicate_flat(
        &self,
        cover: &HashSet<String>,
        depth: i64,
        rules: &mut Vec<Json>,
        iterative: bool,
        ignition_steps: i64,
        stop: Option<&str>,
    ) -> CompileResult<()> {
        let sorted_cover: BTreeSet<String> = cover.iter().cloned().collect();

        // Build direct_args_of for visible predicates in cover
        let visible = |p: &str| !p.contains("_MultBodyAggAux");
        let simplified_cover: BTreeSet<String> = sorted_cover.iter()
            .filter(|p| visible(p))
            .cloned()
            .collect();

        let mut direct_args: HashMap<String, Vec<String>> = HashMap::new();
        for c in &simplified_cover {
            direct_args.insert(c.clone(), Vec::new());
        }

        for (p, args) in &self.direct_args_of {
            if simplified_cover.contains(p) {
                for a in args {
                    if cover.contains(a) {
                        if visible(a) {
                            direct_args.entry(p.clone()).or_default().push(a.clone());
                        } else {
                            if let Some(da) = self.direct_args_of.get(a) {
                                for a2 in da {
                                    if cover.contains(a2) {
                                        direct_args.entry(p.clone()).or_default().push(a2.clone());
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        // Whether semi-naive evaluation applies, read from the rules as written.
        let semi_naive = if iterative && stop.is_none() {
            semi_naive_fields(cover, &simplified_cover, rules)
        } else {
            None
        };

        // Rename in existing rules
        for r in rules.iter_mut() {
            let head_pred = r.as_object()["head"].as_object()["predicate_name"]
                .as_str()
                .to_string();
            if cover.contains(&head_pred) {
                if visible(&head_pred) {
                    r.as_object_mut().get_mut("head").unwrap()
                        .as_object_mut()
                        .insert(
                            "predicate_name".into(),
                            Json::Str(format!("{}_ROne", head_pred)),
                        );
                }
                for c in &simplified_cover {
                    walk_replace_predicate(r, c, &format!("{}_RZero", c));
                }
            } else if head_pred.starts_with('@')
                && head_pred != "@Make"
                // The ordering and limit are the result's: on each step a
                // limit would cut what the next step starts from.
                && head_pred != "@OrderBy"
                && head_pred != "@Limit"
            {
                for c in cover {
                    walk_replace_predicate(r, c, &format!("{}_ROne", c));
                }
            }
        }

        // Generate flat recursion functor program: semi-naive when it computes
        // the same rows, else every step recomputed.
        let lib = if let Some(fields) = semi_naive {
            let p = simplified_cover.iter().next().expect("one predicate");
            get_semi_naive_recursion_functor(depth, p, &fields)
        } else if iterative && depth >= ignition_steps {
            get_flat_iterative_recursion_functor(
                depth, &simplified_cover, &direct_args, ignition_steps, stop,
            )
        } else {
            // Fewer steps than the iteration's ignition, which computes at
            // least that many: each step written out, in its own table when
            // iterating (on Presto every recursion is iterated).
            get_flat_recursion_functor(depth, &simplified_cover, &direct_args, iterative)
        };
        for r in parse_rules(&lib)? {
            rules.push(r);
        }

        Ok(())
    }

    /// Unfold all recursions.
    pub fn unfold_recursions(
        &mut self,
        depth_map: &mut HashMap<String, HashMap<String, SerdeLikeValue>>,
        default_iterative: bool,
        default_depth: i64,
    ) -> CompileResult<Vec<Json>> {
        let (should_recurse, my_cover) = self.recursive_analysis(
            depth_map, default_iterative, default_depth);

        let mut new_rules = self.extended_rules[..self.original_rules].to_vec();

        let mut sorted_recurse: Vec<_> = should_recurse.iter().collect();
        sorted_recurse.sort_by(|a, b| a.0.cmp(b.0));
        for (p, style) in sorted_recurse {
            let depth = depth_map.get(p)
                .and_then(|m| m.get("1"))
                .and_then(|v| v.as_i64())
                .unwrap_or(default_depth);

            if depth == 0 {
                continue;
            }

            let cover = my_cover.get(p).unwrap();

            match style.as_str() {
                "vertical" => {
                    self.unfold_recursive_predicate(p, cover, depth, &mut new_rules)?;
                }
                "horizontal" | "iterative_horizontal" => {
                    let is_iterative = style == "iterative_horizontal";
                    // Compute ignition steps: cover_size + 3, adjusted for parity with depth
                    let mut ignition = cover.len() as i64 + 3;
                    if ignition % 2 == depth % 2 {
                        ignition += 1;
                    }
                    // Check for explicit ignition override in depth_map
                    let ignition_steps = depth_map.get(p)
                        .and_then(|m| m.get("ignition"))
                        .and_then(|v| v.as_i64())
                        .unwrap_or(ignition);
                    // Get stop signal
                    let stop = depth_map.get(p)
                        .and_then(|m| m.get("stop"))
                        .and_then(|v| match v {
                            SerdeLikeValue::Str(s) => Some(s.clone()),
                            _ => None,
                        });
                    // Validate stop signal is in cover
                    if let Some(ref stop_pred) = stop {
                        if !cover.contains(stop_pred) {
                            return Err(CompileError::new(
                                format!(
                                    "Recursive predicate '{}' uses stop signal '{}' that \
                                     does not exist or is outside of the recursive component.",
                                    p, stop_pred
                                ),
                                p,
                            ));
                        }
                    }
                    self.unfold_recursive_predicate_flat(
                        cover, depth, &mut new_rules,
                        is_iterative, ignition_steps, stop.as_deref(),
                    )?;
                }
                _ => {}
            }
        }

        Ok(new_rules)
    }
}

/// The predicates of a recursion as written, without the helpers the
/// compiler adds for rules with several bodies.
fn visible_count(cover: &HashSet<String>) -> usize {
    cover.iter().filter(|p| !p.contains("_MultBodyAggAux")).count()
}

/// Simple enum for depth_map values (int or bool).
#[derive(Clone, Debug)]
pub enum SerdeLikeValue {
    Int(i64),
    Bool(bool),
    Str(String),
}

impl SerdeLikeValue {
    pub fn as_i64(&self) -> Option<i64> {
        match self {
            SerdeLikeValue::Int(n) => Some(*n),
            _ => None,
        }
    }

    pub fn as_bool(&self) -> Option<bool> {
        match self {
            SerdeLikeValue::Bool(b) => Some(*b),
            _ => None,
        }
    }
}

/// Generate recursion functor program text.
fn get_recursion_functor(depth: i64, predicate: &str) -> String {
    let mut lines = Vec::new();
    lines.push(format!(
        "{0}_r0 := {0}_recursive_head({0}_recursive: nil);",
        predicate
    ));
    for i in 0..depth {
        lines.push(format!(
            "{0}_r{2} := {0}_recursive_head({0}_recursive: {0}_r{1});",
            predicate, i, i + 1
        ));
    }
    lines.push(format!("{0} := {0}_r{1}();", predicate, depth));
    lines.join("\n")
}

/// The columns of a recursion that semi-naive evaluation computes exactly, or
/// `None`. Semi-naive evaluation derives each step from the previous step's
/// new rows only, which gives the rows the full recomputation gives when
/// every rule references the recursion at most once (linear recursion), with
/// set semantics: one recursive predicate, `distinct`, without aggregation.
/// The rules are those of the program before the recursion is unfolded.
fn semi_naive_fields(cover: &HashSet<String>, visible: &BTreeSet<String>, rules: &[Json]) -> Option<Vec<Json>> {
    if visible.len() != 1 {
        return None;
    }
    let p = visible.iter().next()?;
    /// References to the cover in `json`: how many, and whether one sits in a
    /// subquery (an aggregate or a negation), which semi-naive cannot split.
    fn references(json: &Json, cover: &HashSet<String>, in_combine: bool, count: &mut usize, nested: &mut bool) {
        match json {
            Json::Object(o) => {
                if let Some(name) = o.get("predicate_name") {
                    if name.is_string() && cover.contains(name.as_str()) {
                        *count += 1;
                        *nested |= in_combine;
                    }
                }
                for (key, value) in o.iter() {
                    references(value, cover, in_combine || key == "combine", count, nested);
                }
            }
            Json::Array(items) => items.iter().for_each(|i| references(i, cover, in_combine, count, nested)),
            _ => {}
        }
    }
    let mut fields: Option<Vec<Json>> = None;
    for rule in rules {
        let head = rule.as_object()["head"].as_object();
        let name = head["predicate_name"].as_str();
        if !cover.contains(name) {
            continue;
        }
        let (mut count, mut nested) = (0, false);
        if let Some(body) = rule.as_object().get("body") {
            references(body, cover, false, &mut count, &mut nested);
        }
        if count > 1 || nested {
            return None;
        }
        if name != p {
            continue;
        }
        if !rule.as_object().contains_key("distinct_denoted") {
            return None;
        }
        let values = head.get("record")?.as_object().get("field_value")?.as_array();
        let mut keys = Vec::new();
        for fv in values {
            let fv = fv.as_object();
            if fv["value"].as_object().contains_key("aggregation") {
                return None;
            }
            let field = &fv["field"];
            if field.is_string() && field.as_str() == "logica_value" {
                return None;
            }
            keys.push(field.clone());
        }
        if *fields.get_or_insert_with(|| keys.clone()) != keys {
            return None;
        }
    }
    fields
}

/// Generate semi-naive recursion functor program text.
///
/// `P_sn_delta` holds the rows the last step added (the base rows first),
/// `P_sn_full` every row so far. Each repetition of the iteration computes
/// `P_sn_new`, the rows one step derives from the delta that `P_sn_full`
/// does not hold yet, adds them to `P_sn_full` (an INSERT the plan writes, see
/// `IterationDef::accumulate`), and makes them the next delta (`P_sn_next`,
/// stored in the delta's table). The recursion has converged when the delta
/// is empty; `depth` repetitions at most compute the rows the full
/// recomputation computes in `depth` steps.
fn get_semi_naive_recursion_functor(depth: i64, p: &str, fields: &[Json]) -> String {
    let args = fields
        .iter()
        .enumerate()
        .map(|(i, field)| {
            if field.is_string() {
                format!("{}: v{}", field.as_str(), i)
            } else {
                format!("v{}", i)
            }
        })
        .collect::<Vec<_>>()
        .join(", ");
    // A step's columns may be wider than its input's (an integer base, a
    // bigint `ToInt64(x) * 2`, then a sum of it), and a column widens at most
    // twice (integer, bigint, double), so the types stop changing within
    // twice as many steps as there are columns. Steps from the base rows'
    // types, applied to empty tables (free to compute), give the accumulated
    // table the widest types from the start: every step's new rows are then
    // inserted, in linear time, on every engine.
    let widening = 2 * fields.len() + 1;
    let mut typed = vec![
        format!("{p}_sn_t0({args}) :- {p}_sn_delta({args}), 1 == 0;"),
        format!("@Ground({p}_sn_t0);"),
    ];
    for k in 1..=widening {
        // A step holds the base rows too: kept empty, only its types count.
        typed.push(format!("{p}_sn_r{k} := {p}_ROne({p}_RZero: {p}_sn_t{});", k - 1));
        typed.push(format!("{p}_sn_t{k}({args}) :- {p}_sn_r{k}({args}), 1 == 0;"));
        typed.push(format!("@Ground({p}_sn_t{k});"));
    }
    let empties = (1..=widening).map(|k| format!(" | {p}_sn_t{k}({args})")).collect::<String>();
    [
        format!("{p}_sn_delta := {p}_ROne({p}_RZero: nil);"),
        format!("@Ground({p}_sn_delta);"),
        typed.join("\n"),
        format!("{p}_sn_full({args}) :- {p}_sn_delta({args}){empties};"),
        format!("@Ground({p}_sn_full);"),
        format!("{p}_sn_step := {p}_ROne({p}_RZero: {p}_sn_delta);"),
        format!("{p}_sn_new({args}) distinct :- {p}_sn_step({args}), ~{p}_sn_full({args});"),
        format!("@Ground({p}_sn_new);"),
        // The next step, from the new rows into the delta's table: the loop
        // alternates the two tables rather than copying one into the other.
        format!("{p}_sn_back_step := {p}_ROne({p}_RZero: {p}_sn_new);"),
        format!("{p}_sn_back({args}) distinct :- {p}_sn_back_step({args}), ~{p}_sn_full({args});"),
        format!("@Ground({p}_sn_back, {p}_sn_delta);"),
        // A rule, not a copy (`:=`): it reads the table the loop adds to.
        format!("{p}({args}) :- {p}_sn_full({args});"),
        format!(
            "@Iteration({p}_sn_delta, predicates: [{p}_sn_new, {p}_sn_back], repetitions: {depth}, accumulate: {p}_sn_full);"
        ),
    ]
    .join("\n")
}

/// Generate flat recursion functor program text.
fn get_flat_recursion_functor(
    depth: i64,
    cover: &BTreeSet<String>,
    direct_args_of: &HashMap<String, Vec<String>>,
    ground: bool,
) -> String {
    let cover_set: HashSet<&String> = cover.iter().collect();
    let mut result_rules = Vec::new();

    for p in cover {
        for i in 0..=depth {
            let mut args = Vec::new();
            let deps = direct_args_of.get(p).cloned().unwrap_or_default();
            let mut sorted_deps: BTreeSet<String> = BTreeSet::new();
            for d in &deps {
                if cover_set.contains(d) {
                    sorted_deps.insert(d.clone());
                }
            }
            for a in &sorted_deps {
                let v = if i == 0 {
                    "nil".to_string()
                } else {
                    format!("{}_fr{}", a, i - 1)
                };
                args.push(format!("{}_RZero: {}", a, v));
            }
            let args_str = args.join(", ");
            result_rules.push(format!("{}_fr{} := {}_ROne({});", p, i, p, args_str));
            if ground {
                result_rules.push(format!("@Ground({}_fr{});", p, i));
            }
        }
        result_rules.push(format!("{} := {}_fr{}();", p, p, depth));
    }

    result_rules.join("\n")
}

/// Generate iterative flat recursion functor program text.
/// Matches Python's GetFlatIterativeRecursionFunctor.
fn get_flat_iterative_recursion_functor(
    depth: i64,
    cover: &BTreeSet<String>,
    direct_args_of: &HashMap<String, Vec<String>>,
    ignition_steps: i64,
    stop: Option<&str>,
) -> String {
    let cover_set: HashSet<&String> = cover.iter().collect();
    let mut result_rules = Vec::new();
    let mut iterate_over_upper_half = Vec::new();
    let mut iterate_over_lower_half = Vec::new();
    let inset: i64 = 2;

    for p in cover {
        for i in 0..ignition_steps {
            let mut args = Vec::new();
            let deps = direct_args_of.get(p).cloned().unwrap_or_default();
            let mut sorted_deps: BTreeSet<String> = BTreeSet::new();
            for d in &deps {
                if cover_set.contains(d) {
                    sorted_deps.insert(d.clone());
                }
            }
            for a in &sorted_deps {
                let v = if i == 0 {
                    "nil".to_string()
                } else {
                    format!("{}_ifr{}", a, i - 1)
                };
                args.push(format!("{}_RZero: {}", a, v));
            }
            let args_str = args.join(", ");
            result_rules.push(format!("{}_ifr{} := {}_ROne({});", p, i, p, args_str));

            // @Ground annotations
            if i != ignition_steps - inset {
                result_rules.push(format!("@Ground({}_ifr{});", p, i));
            } else {
                result_rules.push(format!(
                    "@Ground({}_ifr{}, {}_ifr{});",
                    p, i, p, i - 2
                ));
            }
        }

        iterate_over_upper_half.push(format!("{}_ifr{}", p, ignition_steps - inset - 1));
        iterate_over_lower_half.push(format!("{}_ifr{}", p, ignition_steps - inset));

        result_rules.push(format!("{} := {}_ifr{}();", p, p, ignition_steps - 1));
    }

    let iterate_over: Vec<String> = iterate_over_upper_half
        .into_iter()
        .chain(iterate_over_lower_half)
        .collect();
    let iterate_over_str = iterate_over.join(", ");
    let repetitions = (depth + 1 - ignition_steps) / 2 + 1;
    let min_cover = cover.iter().next().unwrap();

    let mut iteration_line = format!(
        "@Iteration({}, predicates: [{}], repetitions: {}",
        min_cover, iterate_over_str, repetitions
    );
    if let Some(stop_pred) = stop {
        iteration_line.push_str(&format!(
            ", stop_signal: \"/tmp/logical_stop_{}\"",
            stop_pred
        ));
    }
    iteration_line.push_str(");");
    result_rules.push(iteration_line);

    result_rules.join("\n")
}

/// Process @Recursive annotations and unfold recursion.
pub fn unfold_recursion(rules: &[Json], engine: &str) -> CompileResult<Vec<Json>> {
    let mut depth_map: HashMap<String, HashMap<String, SerdeLikeValue>> = HashMap::new();

    // Extract @Recursive annotations directly from rules
    let recursive_rules: Vec<&Json> = rules.iter().filter(|r| {
        r.as_object()["head"].as_object()["predicate_name"].as_str() == "@Recursive"
    }).collect();

    {
        for rule in &recursive_rules {
            let head = &rule.as_object()["head"];
            let fvs = head.as_object()["record"].as_object()["field_value"].as_array();
            if fvs.is_empty() {
                continue;
            }
            let first = &fvs[0].as_object()["value"];
            let pred_name = if let Some(expr) = first.as_object().get("expression") {
                if let Some(lit) = expr.as_object().get("literal") {
                    if let Some(pred) = lit.as_object().get("the_predicate") {
                        pred.as_object()["predicate_name"].as_str().to_string()
                    } else {
                        continue;
                    }
                } else {
                    continue;
                }
            } else {
                continue;
            };

            let mut params = HashMap::new();
            if fvs.len() > 1 {
                let second = &fvs[1].as_object()["value"];
                if let Some(expr) = second.as_object().get("expression") {
                    if let Some(lit) = expr.as_object().get("literal") {
                        if let Some(n) = lit.as_object().get("the_number") {
                            let depth = if n.is_int() {
                                n.as_int()
                            } else if n.is_object() {
                                if let Some(num) = n.as_object().get("number") {
                                    num.as_str().parse::<i64>().unwrap_or(8)
                                } else {
                                    8
                                }
                            } else {
                                8
                            };
                            params.insert("1".to_string(), SerdeLikeValue::Int(depth));
                        }
                    }
                }
            }
            if !params.contains_key("1") {
                params.insert("1".to_string(), SerdeLikeValue::Int(8));
            }
            depth_map.insert(pred_name, params);
        }
    }

    // Upstream defaults DuckDB to the iterative path; synalog unrolls DuckDB
    // inline like the other engines (see DEVIATIONS.md). Presto and Spark
    // (Databricks) iterate every recursion: their planners take time
    // exponential in the steps of an unrolled recursion (Presto: depth 20
    // exceeded its 3-minute planning timeout; Spark: depth 12 took minutes).
    // The iterative path stores each step in a table, which the run loops
    // over (`synalog.plan`).
    // Trino inlines every CTE where it is read: an assertion reading a
    // recursion three times copied its unrolled steps three times, past
    // Trino's limit of 150 stages (QUERY_HAS_TOO_MANY_STAGES). As a table,
    // a recursion is read like any other.
    let default_iterative = engine == "presto" || engine == "databricks" || engine == "trino";
    // Upstream's default is 32 steps on DuckDB; 8 everywhere here, so a
    // program means the same on every engine.
    let default_depth: i64 = 8;

    let mut functors = Functors::new(rules);
    functors.unfold_recursions(&mut depth_map, default_iterative, default_depth)
}

/// Process @Make annotations (functor applications).
pub fn run_makes(rules: &[Json]) -> CompileResult<Vec<Json>> {
    // Extract @Make rules directly
    let make_rules: Vec<&Json> = rules.iter().filter(|r| {
        r.as_object()["head"].as_object()["predicate_name"].as_str() == "@Make"
    }).collect();

    if make_rules.is_empty() {
        return Ok(rules.to_vec());
    }

    // Parse @Make annotations into (predicate, instruction) pairs
    let mut predicate_to_instruction: Vec<(String, Json)> = Vec::new();
    for rule in make_rules {
        let head = &rule.as_object()["head"];
        let fvs = head.as_object()["record"].as_object()["field_value"].as_array();

        // Build instruction: { "1": first_arg, "2": { name: value, ... } }
        let mut instruction = crate::parser::JsonObject::new();
        for fv in fvs {
            let fo = fv.as_object();
            let field = &fo["field"];
            let value = &fo["value"];

            let field_str = if field.is_int() {
                field.as_int().to_string()
            } else {
                field.as_str().to_string()
            };

            if let Some(expr) = value.as_object().get("expression") {
                if let Some(lit) = expr.as_object().get("literal") {
                    if let Some(pred) = lit.as_object().get("the_predicate") {
                        instruction.insert(field_str, pred.clone());
                        continue;
                    }
                    // Could be a constant literal (number or string)
                    if let Some(n) = lit.as_object().get("the_number") {
                        if n.is_int() {
                            instruction.insert(field_str, Json::Int(n.as_int()));
                        } else if n.is_object() {
                            if let Some(num) = n.as_object().get("number") {
                                instruction.insert(field_str, Json::Str(num.as_str().to_string()));
                            }
                        }
                        continue;
                    }
                    if let Some(s) = lit.as_object().get("the_string") {
                        let sv = if s.is_string() { s.as_str().to_string() }
                                 else if s.is_object() { s.as_object().get("the_string").map(|v| v.as_str().to_string()).unwrap_or_default() }
                                 else { String::new() };
                        instruction.insert(field_str, Json::Str(sv));
                        continue;
                    }
                }
                // For non-literal expressions (record), store as-is
                instruction.insert(field_str, expr.clone());
            }
        }

        // Extract the predicate name from field "0" (first positional arg)
        let pred_name = if let Some(first) = instruction.get("0") {
            if let Some(pn) = first.as_object().get("predicate_name") {
                pn.as_str().to_string()
            } else {
                continue;
            }
        } else {
            continue;
        };

        // Restructure: { "1": applicant, "2": { arg_name: arg_value, ... } }
        // In @Make, field 0 = target name, field 1 = applicant, field 2 = record of named args
        let mut make_instr = crate::parser::JsonObject::new();
        if let Some(applicant) = instruction.get("1") {
            make_instr.insert("1".into(), applicant.clone());
        }

        // Field "2" is a record expression containing named functor arguments.
        // Extract its field_values into a flat map: { arg_name: arg_value }
        if let Some(field2) = instruction.get("2") {
            let mut args_obj = crate::parser::JsonObject::new();
            if field2.is_object() {
                if let Some(record) = field2.as_object().get("record") {
                    if let Some(fv_arr) = record.as_object().get("field_value") {
                        for fv in fv_arr.as_array() {
                            let fo = fv.as_object();
                            let arg_field = &fo["field"];
                            let arg_value = &fo["value"];
                            let arg_name = if arg_field.is_int() {
                                arg_field.as_int().to_string()
                            } else {
                                arg_field.as_str().to_string()
                            };
                            // Extract the predicate/literal from the value expression
                            if let Some(expr) = arg_value.as_object().get("expression") {
                                if let Some(lit) = expr.as_object().get("literal") {
                                    if let Some(pred) = lit.as_object().get("the_predicate") {
                                        args_obj.insert(arg_name, pred.clone());
                                        continue;
                                    }
                                }
                                args_obj.insert(arg_name, expr.clone());
                            }
                        }
                    }
                }
            }
            if !args_obj.is_empty() {
                make_instr.insert("2".into(), Json::Object(args_obj));
            }
        }

        predicate_to_instruction.push((pred_name, Json::Object(make_instr)));
    }

    if predicate_to_instruction.is_empty() {
        return Ok(rules.to_vec());
    }

    // Sort by predicate name to get consistent ordering
    predicate_to_instruction.sort_by(|a, b| a.0.cmp(&b.0));

    let mut functors = Functors::new(rules);
    functors.make_all(&predicate_to_instruction)?;

    Ok(functors.extended_rules)
}

/// Like `run_makes` but also returns the args_of dependency map.
pub fn run_makes_with_deps(
    rules: &[Json],
) -> CompileResult<(Vec<Json>, HashMap<String, HashSet<String>>)> {
    let make_rules: Vec<&Json> = rules
        .iter()
        .filter(|r| {
            r.as_object()["head"].as_object()["predicate_name"].as_str() == "@Make"
        })
        .collect();

    if make_rules.is_empty() {
        let functors = Functors::new(rules);
        return Ok((rules.to_vec(), functors.get_args_of_map().clone()));
    }

    // Reuse run_makes logic but also extract args_of
    let extended = run_makes(rules)?;
    let functors = Functors::new(&extended);
    Ok((extended, functors.get_args_of_map().clone()))
}

#[cfg(test)]
#[path = "functors_test.rs"]
mod functors_test;


/// The functor's arguments, each naming a predicate the applicant depends on.
///
/// An imported predicate carries its module's prefix (`Segmentrevenue_SegmentRevenue`),
/// and so do the predicates of its module (`Segmentrevenue_Segment`). The
/// importing file still names an argument by its plain name (`Segment:`):
/// resolve it to the predicate of the applicant's module with that name.
pub(crate) fn resolve_functor_args(
    applicant: &str,
    applicant_args: &HashSet<String>,
    given: &HashMap<String, String>,
) -> HashMap<String, String> {
    given
        .iter()
        .map(|(arg, value)| {
            if applicant_args.contains(arg) {
                return (arg.clone(), value.clone());
            }
            let in_module = applicant_args.iter().find(|candidate| {
                candidate.len() > arg.len()
                    && candidate.ends_with(arg.as_str())
                    && {
                        let prefix = &candidate[..candidate.len() - arg.len()];
                        prefix.ends_with('_') && applicant.starts_with(prefix)
                    }
            });
            (in_module.cloned().unwrap_or_else(|| arg.clone()), value.clone())
        })
        .collect()
}
