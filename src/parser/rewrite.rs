use crate::json_obj;
use crate::parser::json::{Json, JsonArray, JsonObject};
use crate::parser::span::SpanString;
use crate::parser::traverse::{ParseResult, ParsingException};

/// Disjunctive Normal Form rewrite: eliminates disjunctions from rule bodies
/// by duplicating rules.
pub fn dnf_rewrite(rules_json: &Json) -> Json {
    let rules = rules_json.as_array();

    fn proposition_to_dnf(root: &Json) -> Vec<Vec<Json>> {
        // Iterative post-order evaluation using an explicit stack.
        // Each node produces a Vec<Vec<Json>> (DNF = list of conjunctions).
        enum Task<'a> {
            Eval(&'a Json),
            /// Combine N child DNFs via conjunction (cartesian product).
            CombineConjunction(usize),
            /// Combine N child DNFs via disjunction (concatenation).
            CombineDisjunction(usize),
        }
        let mut tasks: Vec<Task> = vec![Task::Eval(root)];
        let mut results: Vec<Vec<Vec<Json>>> = Vec::new();

        while let Some(task) = tasks.pop() {
            match task {
                Task::Eval(prop) => {
                    if prop.is_object() && prop.as_object().contains_key("conjunction") {
                        let conjuncts = prop.as_object()["conjunction"].as_object()["conjunct"].as_array();
                        let n = conjuncts.len();
                        tasks.push(Task::CombineConjunction(n));
                        for c in conjuncts.iter().rev() {
                            tasks.push(Task::Eval(c));
                        }
                    } else if prop.is_object() && prop.as_object().contains_key("disjunction") {
                        let disjuncts = prop.as_object()["disjunction"].as_object()["disjunct"].as_array();
                        let n = disjuncts.len();
                        tasks.push(Task::CombineDisjunction(n));
                        for d in disjuncts.iter().rev() {
                            tasks.push(Task::Eval(d));
                        }
                    } else {
                        results.push(vec![vec![prop.clone()]]);
                    }
                }
                Task::CombineConjunction(n) => {
                    let start = results.len() - n;
                    let dnfs: Vec<Vec<Vec<Json>>> = results.drain(start..).collect();
                    // Iterative cartesian product of DNFs
                    let mut combined = vec![vec![]];
                    for dnf in &dnfs {
                        let mut next = Vec::with_capacity(combined.len() * dnf.len());
                        for a in &combined {
                            for b in dnf {
                                let mut merged = a.clone();
                                merged.extend(b.clone());
                                next.push(merged);
                            }
                        }
                        combined = next;
                    }
                    results.push(combined);
                }
                Task::CombineDisjunction(n) => {
                    let start = results.len() - n;
                    let dnfs: Vec<Vec<Vec<Json>>> = results.drain(start..).collect();
                    let mut combined = Vec::new();
                    for dnf in dnfs {
                        combined.extend(dnf);
                    }
                    results.push(combined);
                }
            }
        }

        debug_assert_eq!(results.len(), 1);
        results.pop().unwrap_or_default()
    }

    let mut out = JsonArray::with_capacity(rules.len());
    for rule in rules {
        if !rule.as_object().contains_key("body") {
            out.push(rule.clone());
            continue;
        }
        let dnf = proposition_to_dnf(&rule.as_object()["body"]);
        for conjuncts in dnf {
            let mut new_rule = rule.clone();
            new_rule.as_object_mut().insert(
                "body".into(),
                json_obj!("conjunction" => json_obj!("conjunct" => Json::Array(conjuncts))),
            );
            out.push(new_rule);
        }
    }
    Json::Array(out)
}

fn strip_aggregation_heritage(field_values: &Json) -> Json {
    let mut copy = field_values.clone();
    for fv in copy.as_array_mut() {
        let vobj = fv.as_object_mut().get_mut("value").unwrap().as_object_mut();
        if let Some(agg) = vobj.get_mut("aggregation") {
            agg.as_object_mut().remove("expression_heritage");
        }
    }
    copy
}

/// Multi-body aggregation rewrite: creates auxiliary predicates when multiple
/// rules define the same distinct predicate with aggregation.
pub fn multi_body_aggregation_rewrite(rules_json: &Json) -> ParseResult<Json> {
    let rules = rules_json.as_array();

    // Find predicates with multiple rules that have distinct
    let mut by_name: Vec<(String, Vec<&Json>)> = Vec::new();
    let mut name_index: std::collections::HashMap<String, usize> = std::collections::HashMap::new();

    for r in rules {
        let name = r.as_object()["head"].as_object()["predicate_name"]
            .as_str()
            .to_string();
        if let Some(&idx) = name_index.get(&name) {
            by_name[idx].1.push(r);
        } else {
            name_index.insert(name.clone(), by_name.len());
            by_name.push((name, vec![r]));
        }
    }

    let multi: Vec<&str> = by_name
        .iter()
        .filter(|(_, rs)| rs.len() > 1 && rs[0].as_object().contains_key("distinct_denoted"))
        .map(|(n, _)| n.as_str())
        .collect();

    if multi.is_empty() {
        return Ok(rules_json.clone());
    }

    let multi_set: std::collections::HashSet<&str> = multi.iter().copied().collect();
    let mut new_rules = JsonArray::with_capacity(rules.len());
    let mut agg_fvs_per_pred: std::collections::HashMap<String, Json> =
        std::collections::HashMap::new();
    let mut original_full_text: std::collections::HashMap<String, Json> =
        std::collections::HashMap::new();

    let split_aggregation = |rule: &Json| -> ParseResult<(Json, Json)> {
        let mut r = rule.clone();
        if !r.as_object().contains_key("distinct_denoted") {
            return Err(ParsingException::new(
                "Inconsistency in distinct denoting.",
                SpanString::new(
                    r.as_object()["head"].as_object()["predicate_name"]
                        .as_str()
                        .to_string(),
                ),
            ));
        }
        r.as_object_mut().remove("distinct_denoted");
        let name = r.as_object()["head"].as_object()["predicate_name"]
            .as_str()
            .to_string();
        r.as_object_mut()
            .get_mut("head")
            .unwrap()
            .as_object_mut()
            .insert(
                "predicate_name".into(),
                Json::Str(format!("{}_MultBodyAggAux", name)),
            );

        let mut transformation = JsonArray::new();
        let mut aggregation = JsonArray::new();

        let fvs = r.as_object()["head"].as_object()["record"].as_object()["field_value"]
            .as_array()
            .clone();

        for fv in &fvs {
            let fvo = fv.as_object();
            let field = &fvo["field"];
            let value = fvo["value"].as_object();

            if value.contains_key("aggregation") {
                let a = value["aggregation"].as_object();
                let mut agg_a = JsonObject::new();
                agg_a.insert("operator".into(), a["operator"].clone());
                agg_a.insert(
                    "argument".into(),
                    json_obj!("variable" => json_obj!("var_name" => field.clone())),
                );
                agg_a.insert("expression_heritage".into(), a["expression_heritage"].clone());
                aggregation.push(json_obj!(
                    "field" => field.clone(),
                    "value" => json_obj!("aggregation" => Json::Object(agg_a))
                ));
                transformation.push(json_obj!(
                    "field" => field.clone(),
                    "value" => json_obj!("expression" => a["argument"].clone())
                ));
            } else {
                aggregation.push(json_obj!(
                    "field" => field.clone(),
                    "value" => json_obj!(
                        "expression" => json_obj!("variable" => json_obj!("var_name" => field.clone()))
                    )
                ));
                transformation.push(fv.clone());
            }
        }

        r.as_object_mut()
            .get_mut("head")
            .unwrap()
            .as_object_mut()
            .get_mut("record")
            .unwrap()
            .as_object_mut()
            .insert("field_value".into(), Json::Array(transformation));

        Ok((Json::Array(aggregation), r))
    };

    for rule in rules {
        let name = rule.as_object()["head"].as_object()["predicate_name"]
            .as_str()
            .to_string();
        // Always overwrite to match C++ behavior (last rule's full_text wins).
        original_full_text
            .insert(name.clone(), rule.as_object()["full_text"].clone());

        if multi_set.contains(name.as_str()) {
            let (aggregation_fvs, new_rule) = split_aggregation(rule)?;
            if let Some(existing) = agg_fvs_per_pred.get(&name) {
                let expected =
                    strip_aggregation_heritage(&existing.as_object()["field_value"]);
                let observed = strip_aggregation_heritage(&aggregation_fvs);
                if expected.to_string_fmt(false) != observed.to_string_fmt(false) {
                    let ft = rule.as_object()["full_text"].clone();
                    return Err(ParsingException::new(
                        "Signature differs for bodies.",
                        SpanString::new(if ft.is_string() { ft.as_str().to_string() } else { String::new() }),
                    ));
                }
            } else {
                agg_fvs_per_pred
                    .insert(name.clone(), json_obj!("field_value" => aggregation_fvs));
            }
            new_rules.push(new_rule);
        } else {
            new_rules.push(rule.clone());
        }
    }

    for name in &multi {
        let agg_fvs = agg_fvs_per_pred[*name].as_object()["field_value"].as_array();
        let mut pass_fvs = JsonArray::new();
        for fv in agg_fvs {
            let field = &fv.as_object()["field"];
            pass_fvs.push(json_obj!(
                "field" => field.clone(),
                "value" => json_obj!(
                    "expression" => json_obj!("variable" => json_obj!("var_name" => field.clone()))
                )
            ));
        }

        let head = json_obj!(
            "predicate_name" => *name,
            "record" => json_obj!("field_value" => Json::Array(agg_fvs.clone()))
        );

        let aux_pred = json_obj!(
            "predicate_name" => format!("{}_MultBodyAggAux", name),
            "record" => json_obj!("field_value" => Json::Array(pass_fvs))
        );

        let body = json_obj!(
            "conjunction" => json_obj!(
                "conjunct" => Json::Array(vec![json_obj!("predicate" => aux_pred)])
            )
        );

        let mut aggregating_rule = JsonObject::new();
        aggregating_rule.insert("head".into(), head);
        aggregating_rule.insert("body".into(), body);
        aggregating_rule.insert(
            "full_text".into(),
            original_full_text[*name].clone(),
        );
        aggregating_rule.insert("distinct_denoted".into(), Json::Bool(true));
        new_rules.push(Json::Object(aggregating_rule));
    }

    Ok(Json::Array(new_rules))
}

fn aggregation_operator(raw: &str) -> String {
    match raw {
        "+" => "Agg+".to_string(),
        "++" => "Agg++".to_string(),
        "*" => "`*`".to_string(),
        _ => raw.to_string(),
    }
}

fn aggregation_convert(a: &JsonObject) -> Json {
    let pred_name = aggregation_operator(a["operator"].as_str());
    let fvs = vec![json_obj!(
        "field" => Json::Int(0),
        "value" => json_obj!("expression" => a["argument"].clone())
    )];
    let call = json_obj!(
        "predicate_name" => pred_name,
        "record" => json_obj!("field_value" => Json::Array(fvs))
    );
    let mut out = JsonObject::new();
    out.insert("call".into(), call);
    out.insert("expression_heritage".into(), a["expression_heritage"].clone());
    Json::Object(out)
}

fn rewrite_aggregations_internal(root: &mut Json) {
    let mut stack: Vec<*mut Json> = vec![root as *mut Json];

    while let Some(ptr) = stack.pop() {
        // SAFETY: all pointers originate from disjoint mutable borrows of
        // different nodes in the same Json tree; no two iterations alias.
        let node = unsafe { &mut *ptr };
        match node {
            Json::Object(o) => {
                // First pass: convert aggregation values in-place
                let keys: Vec<String> = o.keys().cloned().collect();
                for k in &keys {
                    let v = o.get(k).unwrap();
                    if v.is_object() {
                        let vo = v.as_object();
                        if let Some(agg) = vo.get("aggregation") {
                            if agg.is_object() {
                                let converted = aggregation_convert(agg.as_object());
                                let agg_mut = o.get_mut(k).unwrap()
                                    .as_object_mut()
                                    .get_mut("aggregation")
                                    .unwrap()
                                    .as_object_mut();
                                agg_mut.remove("operator");
                                agg_mut.remove("argument");
                                agg_mut.insert("expression".into(), converted);
                            }
                        }
                    }
                }
                // Second pass: push children onto stack
                for (_, v) in o.iter_mut() {
                    if v.is_object() || v.is_array() {
                        stack.push(v as *mut Json);
                    }
                }
            }
            Json::Array(a) => {
                for v in a.iter_mut() {
                    if v.is_object() || v.is_array() {
                        stack.push(v as *mut Json);
                    }
                }
            }
            _ => {}
        }
    }
}

/// Convert aggregation operators into function call expressions.
pub fn rewrite_aggregations_as_expressions(rules: &Json) -> Json {
    let mut copy = rules.clone();
    rewrite_aggregations_internal(&mut copy);
    copy
}

#[cfg(test)]
#[path = "rewrite_test.rs"]
mod rewrite_test;
