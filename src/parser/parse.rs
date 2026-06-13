use std::cell::Cell;
use std::collections::{BTreeMap, BTreeSet};
use std::sync::Arc;

use crate::json_obj;
use crate::parser::json::{Json, JsonArray, JsonObject};
use crate::parser::rewrite;
use crate::parser::span::SpanString;
use crate::parser::traverse::*;

/// Compilation mode for Synalog.
/// - `Synalog`: Strict mode - only named arguments allowed, SQL uses actual column names
/// - `Logica`: Compatibility mode - positional arguments allowed, SQL uses col{i} format
#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub enum CompilationMode {
    Synalog,
    #[default]
    Logica,
}

// Incantation mode: when the magic string is found in the source,
// extra user-defined infix operators and generic-call characters are enabled.
thread_local! {
    static FUN_MODE: Cell<bool> = const { Cell::new(false) };
    // Default to Logica mode for backward compatibility with existing tests/code
    static COMPILATION_MODE: Cell<CompilationMode> = const { Cell::new(CompilationMode::Logica) };
}

fn is_fun_mode() -> bool {
    FUN_MODE.with(|c| c.get())
}

fn is_logica_mode() -> bool {
    COMPILATION_MODE.with(|c| c.get() == CompilationMode::Logica)
}

fn set_compilation_mode(mode: CompilationMode) {
    COMPILATION_MODE.with(|c| c.set(mode));
}

/// Get the value field name based on current compilation mode.
fn value_field_name() -> &'static str {
    if is_logica_mode() {
        "logica_value"
    } else {
        "synalog_value"
    }
}

fn enact_incantations(code: &str) {
    if code.contains("Signa inter verba conjugo, symbolum infixus evoco!") {
        FUN_MODE.with(|c| c.set(true));
    }
}

fn span_ref_json(s: &SpanString) -> Json {
    Json::Str(s.to_string())
}

fn is_variable_chars(s: &SpanString) -> bool {
    s.view()
        .bytes()
        .all(|b| b.is_ascii_lowercase() || b.is_ascii_digit() || b == b'_')
}

pub fn parse_variable(s: &SpanString) -> ParseResult<Option<Json>> {
    if s.is_empty() {
        return Ok(None);
    }
    let c0 = s.at(0);
    if !(c0.is_ascii_lowercase() || c0 == b'_') {
        return Ok(None);
    }
    if !is_variable_chars(s) {
        return Ok(None);
    }
    if s.starts_with("x_") {
        return Err(ParsingException::new(
            "Variables starting with x_ are reserved to be Logica compiler internal. Please use a different name.",
            s.clone(),
        ));
    }
    Ok(Some(json_obj!("var_name" => s.to_string())))
}

pub fn parse_number(s: &SpanString) -> Option<Json> {
    let mut view = s.view();
    if view.ends_with('u') {
        view = &view[..view.len() - 1];
    }
    if view == "∞" {
        return Some(json_obj!("number" => "-1"));
    }
    // Try parsing as a number
    if view.parse::<f64>().is_ok() {
        return Some(json_obj!("number" => view.to_string()));
    }
    None
}

fn parse_python_style_string_literal(s: &SpanString) -> String {
    let v = s.view();
    if v.len() < 2 {
        return String::new();
    }
    let bytes = v.as_bytes();
    // Use a byte buffer to preserve UTF-8 multi-byte sequences.
    // Non-escape bytes are pushed verbatim; escape sequences produce
    // UTF-8 encoded characters.
    let mut out: Vec<u8> = Vec::with_capacity(v.len());

    let push_char = |out: &mut Vec<u8>, ch: char| {
        let mut buf = [0u8; 4];
        let s = ch.encode_utf8(&mut buf);
        out.extend_from_slice(s.as_bytes());
    };

    let mut i = 1;
    let end = v.len() - 1;
    while i < end {
        let c = bytes[i];
        if c != b'\\' {
            out.push(c);
            i += 1;
            continue;
        }
        if i + 1 >= end {
            out.push(b'\\');
            i += 1;
            continue;
        }
        i += 1;
        let n = bytes[i];
        match n {
            b'\\' => out.push(b'\\'),
            b'n' => out.push(b'\n'),
            b'r' => out.push(b'\r'),
            b't' => out.push(b'\t'),
            b'\'' => out.push(b'\''),
            b'"' => out.push(b'"'),
            b'x' => {
                if i + 2 < end {
                    if let (Some(a), Some(b)) = (hex_val(bytes[i + 1]), hex_val(bytes[i + 2])) {
                        out.push(a * 16 + b);
                        i += 2;
                    }
                }
            }
            b'u' => {
                if i + 4 < end {
                    let mut code: u32 = 0;
                    let mut ok = true;
                    for k in 0..4 {
                        if let Some(d) = hex_val(bytes[i + 1 + k]) {
                            code = (code << 4) | d as u32;
                        } else {
                            ok = false;
                            break;
                        }
                    }
                    if ok {
                        if let Some(ch) = char::from_u32(code) {
                            push_char(&mut out, ch);
                        }
                        i += 4;
                    }
                }
            }
            b'U' => {
                if i + 8 < end {
                    let mut code: u32 = 0;
                    let mut ok = true;
                    for k in 0..8 {
                        if let Some(d) = hex_val(bytes[i + 1 + k]) {
                            code = (code << 4) | d as u32;
                        } else {
                            ok = false;
                            break;
                        }
                    }
                    if ok {
                        if let Some(ch) = char::from_u32(code) {
                            push_char(&mut out, ch);
                        }
                        i += 8;
                    }
                }
            }
            _ => out.push(n),
        }
        i += 1;
    }
    String::from_utf8(out).unwrap_or_else(|e| String::from_utf8_lossy(e.as_bytes()).into_owned())
}

fn hex_val(b: u8) -> Option<u8> {
    match b {
        b'0'..=b'9' => Some(b - b'0'),
        b'a'..=b'f' => Some(10 + b - b'a'),
        b'A'..=b'F' => Some(10 + b - b'A'),
        _ => None,
    }
}

pub fn parse_string(s: &SpanString) -> Option<Json> {
    let v = s.view();
    let bytes = v.as_bytes();

    // Double-quoted string
    if v.len() >= 2 && bytes[0] == b'"' && bytes[v.len() - 1] == b'"' {
        let inner = &v[1..v.len() - 1];
        if !inner.contains('"') {
            return Some(json_obj!("the_string" => inner.to_string()));
        }
    }

    // Single-quoted string
    if v.len() >= 2 && bytes[0] == b'\'' && bytes[v.len() - 1] == b'\'' {
        let meat = &bytes[1..v.len() - 1];
        let mut screen = false;
        let mut broke = false;
        for &c in meat {
            if screen {
                screen = false;
                continue;
            }
            if c == b'\'' {
                broke = true;
                break;
            }
            if c == b'\\' {
                screen = true;
            }
        }
        if !broke {
            return Some(json_obj!("the_string" => parse_python_style_string_literal(s)));
        }
    }

    // Triple-quoted string
    if v.len() >= 6 && &v[..3] == "\"\"\"" && &v[v.len() - 3..] == "\"\"\"" {
        let inner = &v[3..v.len() - 3];
        if !inner.contains("\"\"\"") {
            return Some(json_obj!("the_string" => inner.to_string()));
        }
    }

    None
}

pub fn parse_boolean(s: &SpanString) -> Option<Json> {
    let text = s.view();
    if text == "true" || text == "false" {
        return Some(json_obj!("the_bool" => text.to_string()));
    }
    None
}

pub fn parse_null(s: &SpanString) -> Option<Json> {
    if s.view() == "null" {
        return Some(json_obj!("the_null" => "null"));
    }
    None
}

pub fn parse_list(s: &SpanString) -> ParseResult<Option<Json>> {
    if s.len() >= 2
        && s.at(0) == b'['
        && s.at(s.len() - 1) == b']'
        && is_whole(&s.slice(1, s.len() - 1))
    {
        let inside = strip(&s.slice(1, s.len() - 1));
        let mut elements = JsonArray::new();
        if !inside.is_empty() {
            let elems = split(&inside, ",")?;
            for e in &elems {
                elements.push(parse_expression(e)?);
            }
        }
        return Ok(Some(json_obj!("element" => Json::Array(elements))));
    }
    Ok(None)
}

pub fn parse_predicate_literal(s: &SpanString) -> Option<Json> {
    let text = s.view();
    if text == "++?" || text == "nil" {
        return Some(json_obj!("predicate_name" => text.to_string()));
    }
    if text.is_empty() {
        return None;
    }
    let bytes = text.as_bytes();
    if !bytes[0].is_ascii_uppercase() {
        return None;
    }
    for &b in bytes {
        if !(b.is_ascii_alphanumeric() || b == b'_') {
            return None;
        }
    }
    Some(json_obj!("predicate_name" => text.to_string()))
}

pub fn parse_literal(s: &SpanString) -> ParseResult<Option<Json>> {
    if let Some(v) = parse_number(s) {
        return Ok(Some(json_obj!("the_number" => v)));
    }
    if let Some(v) = parse_string(s) {
        return Ok(Some(json_obj!("the_string" => v)));
    }
    if let Some(v) = parse_list(s)? {
        return Ok(Some(json_obj!("the_list" => v)));
    }
    if let Some(v) = parse_boolean(s) {
        return Ok(Some(json_obj!("the_bool" => v)));
    }
    if let Some(v) = parse_null(s) {
        return Ok(Some(json_obj!("the_null" => v)));
    }
    if let Some(v) = parse_predicate_literal(s) {
        return Ok(Some(json_obj!("the_predicate" => v)));
    }
    Ok(None)
}

pub fn parse_record(input: &SpanString) -> ParseResult<Option<Json>> {
    let s = strip(input);
    if s.len() >= 2
        && s.at(0) == b'{'
        && s.at(s.len() - 1) == b'}'
        && is_whole(&s.slice(1, s.len() - 1))
    {
        return Ok(Some(parse_record_internals(
            &s.slice(1, s.len() - 1),
            true,
            false,
            false, // Record literals: no positional args in Synalog mode
        )?));
    }
    Ok(None)
}

pub fn parse_record_internals(
    input: &SpanString,
    is_record_literal: bool,
    is_aggregation_allowed: bool,
    allow_positional: bool,
) -> ParseResult<Json> {
    let s = strip(input);
    if split(&s, ":-")?.len() > 1 {
        return Err(ParsingException::new(
            "Unexpected :- in record internals.",
            s,
        ));
    }
    if s.is_empty() {
        return Ok(json_obj!("field_value" => Json::Array(vec![])));
    }

    let mut result = JsonArray::new();
    if is_whole(&s) {
        let field_values = split(&s, ",")?;
        let mut had_restof = false;
        let mut positional_ok = true;
        let mut observed_fields: Vec<String> = Vec::new();

        for (idx, field_value) in field_values.iter().enumerate() {
            if had_restof {
                return Err(ParsingException::new(
                    "Field ..<rest_of> must go last.",
                    field_value.clone(),
                ));
            }
            if field_value.starts_with("..") {
                if is_record_literal {
                    return Err(ParsingException::new(
                        "Field ..<rest_of> in record literals is not currently supported.",
                        field_value.clone(),
                    ));
                }
                let mut item = JsonObject::new();
                item.insert("field".into(), Json::Str("*".into()));
                item.insert(
                    "value".into(),
                    json_obj!("expression" => parse_expression(&field_value.slice_from(2))?),
                );
                if !observed_fields.is_empty() {
                    let exc: JsonArray = observed_fields
                        .iter()
                        .map(|f| Json::Str(f.clone()))
                        .collect();
                    item.insert("except".into(), Json::Array(exc));
                }
                result.push(Json::Object(item));
                had_restof = true;
                positional_ok = false;
                continue;
            }

            let observed_field;
            let colon_result = split_in_one_or_two(field_value, ":")?;

            match colon_result {
                Err((field, value)) => {
                    // Has colon: named field
                    positional_ok = false;
                    let mut value = value;
                    observed_field = field.to_string();
                    if value.is_empty() {
                        value = field.clone();
                        if !field.is_empty()
                            && field.at(0).is_ascii_uppercase()
                        {
                            return Err(ParsingException::new(
                                "Record fields may not start with capital letter.",
                                field,
                            ));
                        }
                        if !field.is_empty() && field.at(0) == b'`' {
                            return Err(ParsingException::new(
                                "Backticks in variable names are disallowed.",
                                field,
                            ));
                        }
                    }
                    let mut fv = JsonObject::new();
                    fv.insert("field".into(), Json::Str(field.to_string()));
                    fv.insert(
                        "value".into(),
                        json_obj!("expression" => parse_expression(&value)?),
                    );
                    result.push(Json::Object(fv));
                }
                Ok(one_part) => {
                    // No colon: check for aggregation (?) or positional
                    let q_result = split_in_one_or_two(field_value, "?")?;
                    match q_result {
                        Err((field, value)) => {
                            if !is_aggregation_allowed {
                                return Err(ParsingException::new(
                                    "Aggregation of fields is only allowed in the head of a rule.",
                                    field_value.clone(),
                                ));
                            }
                            positional_ok = false;
                            observed_field = field.to_string();
                            if field.is_empty() {
                                return Err(ParsingException::new(
                                    "Aggregated fields have to be named.",
                                    field_value.clone(),
                                ));
                            }
                            let (op, expr) = split_in_two(&value, "=")?;
                            let op = strip(&op);
                            let mut agg = JsonObject::new();
                            agg.insert("operator".into(), Json::Str(op.to_string()));
                            agg.insert("argument".into(), parse_expression(&expr)?);
                            agg.insert("expression_heritage".into(), span_ref_json(&value));

                            let mut fv = JsonObject::new();
                            fv.insert("field".into(), Json::Str(field.to_string()));
                            fv.insert("value".into(), json_obj!("aggregation" => Json::Object(agg)));
                            result.push(Json::Object(fv));
                        }
                        Ok(_) => {
                            // In Synalog mode, positional arguments are not allowed
                            // (unless allow_positional is true, e.g., for annotations)
                            if !is_logica_mode() && !allow_positional {
                                return Err(ParsingException::new(
                                    "Synalog requires named arguments. Use `field_name: value` syntax instead of positional arguments.",
                                    field_value.clone(),
                                ));
                            }
                            if positional_ok {
                                let mut fv = JsonObject::new();
                                fv.insert("field".into(), Json::Int(idx as i64));
                                fv.insert(
                                    "value".into(),
                                    json_obj!("expression" => parse_expression(&one_part)?),
                                );
                                result.push(Json::Object(fv));
                                observed_field = format!("col{}", idx);
                            } else {
                                return Err(ParsingException::new(
                                    "Positional argument can not go after non-positional arguments.",
                                    field_value.clone(),
                                ));
                            }
                        }
                    }
                }
            }
            observed_fields.push(observed_field);
        }
    }
    Ok(json_obj!("field_value" => Json::Array(result)))
}

fn parse_generic_call(
    input: &SpanString,
    opening: u8,
    closing: u8,
) -> ParseResult<Option<(String, SpanString)>> {
    let s = strip(input);
    if s.is_empty() {
        return Ok(None);
    }

    let predicate;
    let idx;

    if s.starts_with("->") {
        idx = 2;
        predicate = "->".to_string();
    } else {
        let mut t = Traverser::new(s.clone());
        let found_idx;

        loop {
            let step = match t.next() {
                Some(step) => step,
                None => return Ok(None),
            };
            if step.status != TraverseStatus::Ok {
                return Err(ParsingException::new(
                    "Parenthesis matches nothing.",
                    s.slice(step.idx, step.idx + 1),
                ));
            }
            if step.state_depth == 1 && step.state_top == opening {
                found_idx = step.idx;
                let pred_span = s.slice(0, found_idx);
                let pred = pred_span.view();

                let all_good = pred.bytes().all(|c| {
                    c.is_ascii_alphanumeric()
                        || b"@_.${}+-`".contains(&c)
                        || (is_fun_mode() && b"*^%/".contains(&c))
                });

                if (found_idx > 0 && all_good)
                    || pred == "!"
                    || pred == "++?"
                    || (found_idx >= 2 && s.at(0) == b'`' && s.at(found_idx - 1) == b'`')
                {
                    break;
                }
                return Ok(None);
            }
            if step.state_depth > 0
                && !(step.state_depth == 1 && step.state_top == b'{')
                && step.state_top != b'`'
            {
                return Ok(None);
            }
        }

        idx = found_idx;
        let mut p = s.slice(0, idx).to_string();
        if p == "`=`" {
            p = "=".to_string();
        }
        if p == "`~`" {
            p = "~".to_string();
        }
        predicate = p;
    }

    if s.at(idx) == opening
        && s.at(s.len() - 1) == closing
        && is_whole(&s.slice(idx + 1, s.len() - 1))
    {
        Ok(Some((predicate, s.slice(idx + 1, s.len() - 1))))
    } else {
        Ok(None)
    }
}

const DEFAULT_OPS: &[&str] = &[
    "||", "&&", "->", "==", "<=", ">=", "<", ">", "!=", "=", "~", " in ", " is not ",
    " is ", "++?", "++", "+", "-", "*", "/", "%", "^", "!",
];

const FUN_OPS: &[&str] = &["---", "-+-", "-*-", "-/-", "-%-", "-^-"];

static EMPTY_DISALLOW: BTreeSet<String> = BTreeSet::new();

fn parse_infix(
    s: &SpanString,
    operators: Option<&[&str]>,
    disallow: Option<&BTreeSet<String>>,
) -> ParseResult<Option<Json>> {
    let default_ops: Vec<&str>;
    let ops = if let Some(ops) = operators {
        ops
    } else if is_fun_mode() {
        default_ops = FUN_OPS.iter().chain(DEFAULT_OPS.iter()).copied().collect();
        &default_ops
    } else {
        DEFAULT_OPS
    };
    let dis = disallow.unwrap_or(&EMPTY_DISALLOW);

    for &op in ops {
        if dis.contains(op) {
            continue;
        }
        let parts = split_raw(s, op)?;
        if parts.len() > 1 {
            let left = SpanString::from_arc(
                Arc::clone(&s.heritage),
                s.start,
                parts[parts.len() - 2].stop,
            );
            let right = SpanString::from_arc(
                Arc::clone(&s.heritage),
                parts.last().unwrap().start,
                s.stop,
            );

            if op == "~" {
                let lv = left.view();
                if !lv.is_empty() && lv.ends_with('!') {
                    continue;
                }
            }

            let left = strip(&left);
            let right = strip(&right);

            if (op == "!" || op == "-") && left.is_empty() {
                let mut call = JsonObject::new();
                call.insert("predicate_name".into(), Json::Str(op.to_string()));
                call.insert("record".into(), parse_record_internals(&right, false, false, false)?);
                return Ok(Some(Json::Object(call)));
            }
            if op == "~" && left.is_empty() {
                return Ok(None);
            }

            let left_expr = parse_expression(&left)?;
            let right_expr = parse_expression(&right)?;

            let fvs = vec![
                json_obj!("field" => "left", "value" => json_obj!("expression" => left_expr)),
                json_obj!("field" => "right", "value" => json_obj!("expression" => right_expr)),
            ];
            let pred_name = op.trim().to_string();
            let mut call = JsonObject::new();
            call.insert("predicate_name".into(), Json::Str(pred_name));
            call.insert("record".into(), json_obj!("field_value" => Json::Array(fvs)));
            return Ok(Some(Json::Object(call)));
        }
    }
    Ok(None)
}

fn build_tree_for_combine(
    parsed_expression: Json,
    op: &SpanString,
    parsed_body: Option<&Json>,
    full_text: &SpanString,
) -> Json {
    let mut agg = JsonObject::new();
    agg.insert("operator".into(), Json::Str(op.to_string()));
    agg.insert("argument".into(), parsed_expression);
    agg.insert("expression_heritage".into(), span_ref_json(full_text));

    let agg_fv = json_obj!(
        "field" => value_field_name(),
        "value" => json_obj!("aggregation" => Json::Object(agg))
    );

    let head = json_obj!(
        "predicate_name" => "Combine",
        "record" => json_obj!("field_value" => Json::Array(vec![agg_fv]))
    );

    let mut result = JsonObject::new();
    result.insert("head".into(), head);
    result.insert("distinct_denoted".into(), Json::Bool(true));
    result.insert("full_text".into(), span_ref_json(full_text));
    if let Some(body) = parsed_body {
        result.insert("body".into(), json_obj!("conjunction" => body.clone()));
    }
    Json::Object(result)
}

fn parse_combine(input: &SpanString) -> ParseResult<Option<Json>> {
    if !input.starts_with("combine ") {
        return Ok(None);
    }
    let s = input.slice_from(8);
    let vb = split_in_one_or_two(&s, ":-")?;
    let (value, body) = match vb {
        Ok(v) => (v, None),
        Err((v, b)) => (v, Some(b)),
    };
    let (op, expr) = split_in_two(&value, "=")?;
    let op = strip(&op);
    let parsed_expression = parse_expression(&expr)?;

    let parsed_body = if let Some(b) = &body {
        let conj = split(b, ",")?;
        let conjuncts: Vec<Json> = conj
            .iter()
            .map(|c| parse_proposition(c))
            .collect::<ParseResult<_>>()?;
        Some(json_obj!("conjunct" => Json::Array(conjuncts)))
    } else {
        None
    };

    Ok(Some(build_tree_for_combine(
        parsed_expression,
        &op,
        parsed_body.as_ref(),
        &s,
    )))
}

fn parse_implication(s: &SpanString) -> ParseResult<Option<Json>> {
    if !(s.starts_with("if ") || s.starts_with("if\n")) {
        return Ok(None);
    }
    let inner = s.slice_from(3);
    let mut if_thens = split(&inner, "else if")?;
    let last_pair = split_in_two(if_thens.last().unwrap(), "else")?;
    *if_thens.last_mut().unwrap() = last_pair.0;
    let last_else = last_pair.1;

    let mut result_if_thens = JsonArray::new();
    for cond_cons in &if_thens {
        let (cond, cons) = split_in_two(cond_cons, "then")?;
        result_if_thens.push(json_obj!(
            "condition" => parse_expression(&cond)?,
            "consequence" => parse_expression(&cons)?
        ));
    }
    Ok(Some(json_obj!(
        "if_then" => Json::Array(result_if_thens),
        "otherwise" => parse_expression(&last_else)?
    )))
}

fn parse_concise_combine(s: &SpanString) -> ParseResult<Option<Json>> {
    let parts = split(s, "=")?;
    if parts.len() != 2 {
        return Ok(None);
    }
    let lhs_and_op = &parts[0];
    let combine = &parts[1];
    let left_parts = split_on_whitespace(lhs_and_op)?;
    if left_parts.len() <= 1 {
        return Ok(None);
    }

    let lhs = SpanString::from_arc(
        Arc::clone(&s.heritage),
        s.start,
        left_parts[left_parts.len() - 2].stop,
    );
    let op = left_parts.last().unwrap();
    let prohibited: BTreeSet<&str> = ["!", "<", ">"].iter().copied().collect();
    if prohibited.contains(op.view()) {
        return Ok(None);
    }
    if !op.is_empty() && op.at(0).is_ascii_lowercase() {
        return Ok(None);
    }

    let left_expr = parse_expression(&lhs)?;
    let vb = split_in_one_or_two(combine, ":-")?;
    let (expr, body) = match vb {
        Ok(e) => (e, None),
        Err((e, b)) => (e, Some(b)),
    };

    let parsed_expression = parse_expression(&expr)?;
    let parsed_body = if let Some(b) = &body {
        let conj = split(b, ",")?;
        let conjuncts: Vec<Json> = conj
            .iter()
            .map(|c| parse_proposition(c))
            .collect::<ParseResult<_>>()?;
        Some(json_obj!("conjunct" => Json::Array(conjuncts)))
    } else {
        None
    };

    let right_expr = build_tree_for_combine(parsed_expression, op, parsed_body.as_ref(), s);
    let rhs = json_obj!(
        "combine" => right_expr,
        "expression_heritage" => span_ref_json(s)
    );
    Ok(Some(json_obj!(
        "left_hand_side" => left_expr,
        "right_hand_side" => rhs
    )))
}

fn parse_ultra_concise_combine(s: &SpanString) -> ParseResult<Option<Json>> {
    let gc = parse_generic_call(s, b'{', b'}')?;
    let (pred_name, multiset) = match gc {
        Some(v) => v,
        None => return Ok(None),
    };
    let op = SpanString::new(pred_name);
    let vb = split_in_one_or_two(&multiset, ":-")?;
    let (value, body) = match vb {
        Ok(v) => (v, None),
        Err((v, b)) => (v, Some(b)),
    };

    let parsed_expression = parse_expression(&value)?;
    let parsed_body = if let Some(b) = &body {
        let conj = split(b, ",")?;
        let conjuncts: Vec<Json> = conj
            .iter()
            .map(|c| parse_proposition(c))
            .collect::<ParseResult<_>>()?;
        Some(json_obj!("conjunct" => Json::Array(conjuncts)))
    } else {
        None
    };

    Ok(Some(build_tree_for_combine(
        parsed_expression,
        &op,
        parsed_body.as_ref(),
        s,
    )))
}

fn parse_inclusion(s: &SpanString) -> ParseResult<Option<Json>> {
    let parts = split(s, " in ")?;
    if parts.len() != 2 {
        return Ok(None);
    }
    Ok(Some(json_obj!(
        "list" => parse_expression(&parts[1])?,
        "element" => parse_expression(&parts[0])?
    )))
}

pub fn parse_call(s: &SpanString, is_aggregation_allowed: bool) -> ParseResult<Option<Json>> {
    let generic = parse_generic_call(s, b'(', b')')?;
    match generic {
        None => Ok(None),
        Some((pred_name, args_span)) => {
            // Annotations (predicates starting with @) always allow positional arguments
            let is_annotation = pred_name.starts_with('@');
            let args = parse_record_internals(&args_span, false, is_aggregation_allowed, is_annotation)?;
            let mut call = JsonObject::new();
            call.insert("predicate_name".into(), Json::Str(pred_name));
            call.insert("record".into(), args);
            Ok(Some(Json::Object(call)))
        }
    }
}

fn parse_array_sub(s: &SpanString) -> ParseResult<Option<Json>> {
    let generic = parse_generic_call(s, b'[', b']')?;
    match generic {
        None => Ok(None),
        Some((pred_name, args_span)) => {
            // Array subscripts always use positional indices
            let args = parse_record_internals(&args_span, false, false, true)?;
            let array = parse_expression(&SpanString::new(pred_name))?;
            Ok(Some(nested_element(s, &array, &args)?))
        }
    }
}

fn nested_element(s: &SpanString, array: &Json, args: &Json) -> ParseResult<Json> {
    let fvs = args.as_object()["field_value"].as_array();
    let mut result: Option<Json> = None;

    for (i, fv) in fvs.iter().enumerate() {
        let fvo = fv.as_object();
        let field = &fvo["field"];
        if !field.is_int() || field.as_int() as usize != i {
            return Err(ParsingException::new(
                "Array subscription must only have positional arguments.",
                s.clone(),
            ));
        }

        let first_argument = if let Some(ref r) = result {
            json_obj!("call" => r.clone())
        } else {
            array.clone()
        };

        let mut fv_clone = fvo.clone();
        fv_clone.insert("field".into(), Json::Int(1));

        let element_fvs = vec![
            json_obj!("field" => Json::Int(0), "value" => json_obj!("expression" => first_argument)),
            Json::Object(fv_clone),
        ];

        result = Some(json_obj!(
            "predicate_name" => "Element",
            "record" => json_obj!("field_value" => Json::Array(element_fvs))
        ));
    }

    Ok(result.unwrap())
}

fn parse_unification(s: &SpanString) -> ParseResult<Option<Json>> {
    let parts = split(s, "==")?;
    if parts.len() != 2 {
        return Ok(None);
    }
    Ok(Some(json_obj!(
        "left_hand_side" => parse_expression(&parts[0])?,
        "right_hand_side" => parse_expression(&parts[1])?
    )))
}

fn negation_tree(s: &SpanString, negated_proposition: &Json) -> Json {
    let number_one = json_obj!(
        "literal" => json_obj!(
            "the_number" => json_obj!("number" => "1")
        )
    );

    let mut agg = JsonObject::new();
    agg.insert("operator".into(), Json::Str("Min".into()));
    agg.insert("argument".into(), number_one);
    agg.insert("expression_heritage".into(), span_ref_json(s));

    let fv = json_obj!(
        "field" => value_field_name(),
        "value" => json_obj!("aggregation" => Json::Object(agg))
    );

    let head = json_obj!(
        "predicate_name" => "Combine",
        "record" => json_obj!("field_value" => Json::Array(vec![fv]))
    );

    let mut combine = JsonObject::new();
    combine.insert("body".into(), negated_proposition.clone());
    combine.insert("distinct_denoted".into(), Json::Bool(true));
    combine.insert("full_text".into(), span_ref_json(s));
    combine.insert("head".into(), head);

    let isnull_fv = json_obj!(
        "field" => Json::Int(0),
        "value" => json_obj!("expression" => json_obj!("combine" => Json::Object(combine)))
    );

    let isnull = json_obj!(
        "predicate_name" => "IsNull",
        "record" => json_obj!("field_value" => Json::Array(vec![isnull_fv]))
    );

    json_obj!("predicate" => isnull)
}

fn parse_negation(s: &SpanString) -> ParseResult<Option<Json>> {
    let parts = split(s, "~")?;
    if parts.len() == 1 {
        return Ok(None);
    }
    if parts.len() != 2 || !parts[0].is_empty() {
        return Err(ParsingException::new(
            "Negation \"~\" is a unary operator.",
            s.clone(),
        ));
    }
    let negated = strip(&parts[1]);
    let conj_parts = split(&negated, ",")?;
    let conjuncts: Vec<Json> = conj_parts
        .iter()
        .map(|c| parse_proposition(c))
        .collect::<ParseResult<_>>()?;
    let negated_prop = json_obj!(
        "conjunction" => json_obj!("conjunct" => Json::Array(conjuncts))
    );
    Ok(Some(negation_tree(s, &negated_prop)))
}

fn parse_negation_expression(s: &SpanString) -> ParseResult<Option<Json>> {
    let proposition = parse_negation(s)?;
    match proposition {
        None => Ok(None),
        Some(p) => {
            let pred = p.as_object()["predicate"].clone();
            Ok(Some(json_obj!("call" => pred)))
        }
    }
}

fn parse_subscript(s: &SpanString) -> ParseResult<Option<Json>> {
    let path = split_raw(s, ".")?;
    if path.len() < 2 {
        return Ok(None);
    }
    let record_str = SpanString::from_arc(
        Arc::clone(&s.heritage),
        s.start,
        path[path.len() - 2].stop,
    );
    let record = parse_expression(&strip(&record_str))?;
    let last = path.last().unwrap();
    for b in last.view().bytes() {
        if !(b.is_ascii_lowercase() || b.is_ascii_digit() || b == b'_') {
            return Err(ParsingException::new("Subscript must be lowercase.", s.clone()));
        }
    }
    let sub = json_obj!(
        "literal" => json_obj!(
            "the_symbol" => json_obj!("symbol" => last.to_string())
        )
    );
    Ok(Some(json_obj!("record" => record, "subscript" => sub)))
}

fn parse_disjunction(s: &SpanString) -> ParseResult<Option<Json>> {
    let parts = split(s, "|")?;
    if parts.len() == 1 {
        return Ok(None);
    }
    let disj: Vec<Json> = parts
        .iter()
        .map(|d| parse_proposition(d))
        .collect::<ParseResult<_>>()?;
    Ok(Some(json_obj!("disjunct" => Json::Array(disj))))
}

fn parse_conjunction(s: &SpanString, allow_singleton: bool) -> ParseResult<Option<Json>> {
    let parts = split(s, ",")?;
    if parts.len() == 1 && !allow_singleton {
        return Ok(None);
    }
    let conj: Vec<Json> = parts
        .iter()
        .map(|c| parse_proposition(c))
        .collect::<ParseResult<_>>()?;
    Ok(Some(json_obj!("conjunct" => Json::Array(conj))))
}

fn propositional_implication(
    s: &SpanString,
    consequence_str: &SpanString,
    condition: &Json,
    consequence: &Json,
) -> Json {
    let ensure_conjunction = |x: &Json| -> Json {
        if x.is_object() && x.as_object().contains_key("conjunction") {
            x.clone()
        } else {
            json_obj!("conjunction" => json_obj!("conjunct" => Json::Array(vec![x.clone()])))
        }
    };

    let mut conjuncts: Vec<Json> =
        if condition.is_object() && condition.as_object().contains_key("conjunction") {
            condition.as_object()["conjunction"].as_object()["conjunct"]
                .as_array()
                .clone()
        } else {
            vec![condition.clone()]
        };

    conjuncts.push(negation_tree(
        consequence_str,
        &ensure_conjunction(consequence),
    ));
    negation_tree(
        s,
        &json_obj!(
            "conjunction" => json_obj!("conjunct" => Json::Array(conjuncts))
        ),
    )
}

fn parse_propositional_implication(s: &SpanString) -> ParseResult<Option<Json>> {
    let parts = split(s, "=>")?;
    if parts.len() != 2 {
        return Ok(None);
    }
    let cond = parse_proposition(&parts[0])?;
    let cons = parse_proposition(&parts[1])?;
    Ok(Some(propositional_implication(s, &parts[1], &cond, &cons)))
}

fn parse_propositional_equivalence(s: &SpanString) -> ParseResult<Option<Json>> {
    let parts = split(s, "<=>")?;
    if parts.len() != 2 {
        return Ok(None);
    }
    let left1 = parse_proposition(&parts[0])?;
    let right1 = parse_proposition(&parts[1])?;
    let left2 = parse_proposition(&parts[0])?;
    let right2 = parse_proposition(&parts[1])?;
    let a = propositional_implication(s, &parts[1], &left1, &right1);
    let b = propositional_implication(s, &parts[0], &right2, &left2);
    Ok(Some(json_obj!(
        "conjunction" => json_obj!(
            "conjunct" => Json::Array(vec![a, b])
        )
    )))
}

pub fn parse_proposition(s: &SpanString) -> ParseResult<Json> {
    if let Some(c) = parse_disjunction(s)? {
        return Ok(json_obj!("disjunction" => c));
    }

    let str_conjuncts = split(s, ",")?;
    if let Some(c) = parse_conjunction(s, false)? {
        if str_conjuncts.len() > 1 {
            return Ok(json_obj!("conjunction" => c));
        }
    }

    if is_fun_mode() {
        if let Some(c) = parse_propositional_equivalence(s)? {
            return Ok(json_obj!("conjunction" => json_obj!(
                "conjunct" => Json::Array(vec![c])
            )));
        }
    }

    if let Some(c) = parse_propositional_implication(s)? {
        return Ok(c);
    }
    if parse_implication(s)?.is_some() {
        return Err(ParsingException::new(
            "If-then-else clause is only supported as an expression, not as a proposition.",
            s.clone(),
        ));
    }
    if let Some(c) = parse_call(s, false)? {
        return Ok(json_obj!("predicate" => c));
    }
    if let Some(c) = parse_infix(s, Some(&["&&", "||"]), None)? {
        return Ok(json_obj!("predicate" => c));
    }
    if let Some(u) = parse_unification(s)? {
        return Ok(json_obj!("unification" => u));
    }
    if let Some(inc) = parse_inclusion(s)? {
        return Ok(json_obj!("inclusion" => inc));
    }
    if let Some(cc) = parse_concise_combine(s)? {
        return Ok(json_obj!("unification" => cc));
    }
    if let Some(inf) = parse_infix(s, None, None)? {
        return Ok(json_obj!("predicate" => inf));
    }
    if let Some(neg) = parse_negation(s)? {
        return Ok(neg);
    }
    Err(ParsingException::new(
        "Could not parse proposition.",
        s.clone(),
    ))
}

fn actually_parse_expression(s: &SpanString) -> ParseResult<Json> {
    if let Some(v) = parse_combine(s)? {
        return Ok(json_obj!("combine" => v));
    }
    if let Some(v) = parse_implication(s)? {
        return Ok(json_obj!("implication" => v));
    }
    if let Some(v) = parse_literal(s)? {
        return Ok(json_obj!("literal" => v));
    }
    if let Some(v) = parse_variable(s)? {
        return Ok(json_obj!("variable" => v));
    }
    if let Some(v) = parse_record(s)? {
        return Ok(json_obj!("record" => v));
    }
    if let Some(v) = parse_propositional_implication(s)? {
        if v.is_object() && v.as_object().contains_key("predicate") {
            return Ok(json_obj!("call" => v.as_object()["predicate"].clone()));
        }
    }
    if let Some(v) = parse_call(s, false)? {
        return Ok(json_obj!("call" => v));
    }
    if let Some(v) = parse_ultra_concise_combine(s)? {
        return Ok(json_obj!("combine" => v));
    }
    {
        let mut dis = BTreeSet::new();
        dis.insert("~".to_string());
        if let Some(v) = parse_infix(s, None, Some(&dis))? {
            return Ok(json_obj!("call" => v));
        }
    }
    if let Some(v) = parse_subscript(s)? {
        return Ok(json_obj!("subscript" => v));
    }
    if let Some(v) = parse_negation_expression(s)? {
        return Ok(v);
    }
    if let Some(v) = parse_array_sub(s)? {
        return Ok(json_obj!("call" => v));
    }
    Err(ParsingException::new(
        "Could not parse expression of a value.",
        s.clone(),
    ))
}

pub fn parse_expression(s: &SpanString) -> ParseResult<Json> {
    let mut e = actually_parse_expression(s)?;
    e.as_object_mut()
        .insert("expression_heritage".into(), span_ref_json(s));
    Ok(e)
}

// ------ Rule parsing ------

fn parse_head_call(s: &SpanString, distinct_from_outside: bool) -> ParseResult<(Json, bool)> {
    let mut saw_open = false;
    let mut idx = 0;
    let mut t = Traverser::new(s.clone());

    while let Some(step) = t.next() {
        if step.status != TraverseStatus::Ok {
            return Err(ParsingException::new(
                "Parenthesis matches nothing.",
                s.slice(step.idx, step.idx + 1),
            ));
        }
        if step.state_depth == 1 && step.state_top == b'(' {
            saw_open = true;
        }
        if saw_open && step.state_depth == 0 {
            idx = step.idx;
            break;
        }
    }

    if !saw_open {
        return Err(ParsingException::new(
            "Found no call in rule head.",
            s.clone(),
        ));
    }

    let call_str = s.slice(0, idx + 1);
    let post_call_str = s.slice_from(idx + 1);
    let call = parse_call(&call_str, true)?;
    let mut call = match call {
        Some(c) => c,
        None => {
            return Err(ParsingException::new(
                "Could not parse predicate call.",
                call_str,
            ));
        }
    };

    let check_agg = |callj: &Json| -> ParseResult<()> {
        if distinct_from_outside {
            return Ok(());
        }
        let fvs = callj.as_object()["record"].as_object()["field_value"].as_array();
        for fv in fvs {
            if fv.as_object()["value"].as_object().contains_key("aggregation") {
                return Err(ParsingException::new(
                    "Aggregation appears in a non-distinct predicate. Did you forget distinct?",
                    call_str.clone(),
                ));
            }
        }
        Ok(())
    };

    let op_expr = split(&post_call_str, "=")?;
    if op_expr.len() == 1 {
        if !op_expr[0].is_empty() {
            return Err(ParsingException::new(
                "Unexpected text in the head of a rule.",
                op_expr[0].clone(),
            ));
        }
        check_agg(&call)?;
        return Ok((call, false));
    }
    if op_expr.len() > 2 {
        return Err(ParsingException::new(
            "Too many '=' in predicate value.",
            post_call_str,
        ));
    }

    let op_str = &op_expr[0];
    let expr_str = &op_expr[1];

    if op_str.is_empty() {
        let fvs = call.as_object_mut().get_mut("record").unwrap().as_object_mut()
            .get_mut("field_value").unwrap().as_array_mut();
        fvs.push(json_obj!(
            "field" => value_field_name(),
            "value" => json_obj!("expression" => parse_expression(expr_str)?)
        ));
        check_agg(&call)?;
        return Ok((call, false));
    }

    let mut agg = JsonObject::new();
    agg.insert("operator".into(), Json::Str(op_str.to_string()));
    agg.insert("argument".into(), parse_expression(expr_str)?);
    agg.insert("expression_heritage".into(), span_ref_json(&post_call_str));

    let fv = json_obj!(
        "field" => value_field_name(),
        "value" => json_obj!("aggregation" => Json::Object(agg))
    );

    call.as_object_mut()
        .get_mut("record")
        .unwrap()
        .as_object_mut()
        .get_mut("field_value")
        .unwrap()
        .as_array_mut()
        .push(fv);

    Ok((call, true))
}

fn parse_functor_rule(s: &SpanString) -> ParseResult<Option<Json>> {
    let parts = split(s, ":=")?;
    if parts.len() != 2 {
        return Ok(None);
    }
    let new_predicate = parse_expression(&parts[0])?;
    let definition_expr = parse_expression(&parts[1])?;

    if !definition_expr.as_object().contains_key("call") {
        return Err(ParsingException::new(
            "Incorrect syntax for functor call.",
            parts[1].clone(),
        ));
    }
    let definition = definition_expr.as_object()["call"].clone();

    if !(new_predicate.as_object().contains_key("literal")
        && new_predicate.as_object()["literal"]
            .as_object()
            .contains_key("the_predicate"))
    {
        return Err(ParsingException::new(
            "Incorrect syntax for functor call.",
            parts[0].clone(),
        ));
    }

    let applicant = json_obj!(
        "expression" => json_obj!(
            "literal" => json_obj!(
                "the_predicate" => json_obj!(
                    "predicate_name" => definition.as_object()["predicate_name"].clone()
                )
            )
        )
    );
    let arguments = json_obj!(
        "expression" => json_obj!(
            "record" => definition.as_object()["record"].clone()
        )
    );

    let head = json_obj!(
        "predicate_name" => "@Make",
        "record" => json_obj!("field_value" => Json::Array(vec![
            json_obj!("field" => Json::Int(0), "value" => json_obj!("expression" => new_predicate)),
            json_obj!("field" => Json::Int(1), "value" => applicant),
            json_obj!("field" => Json::Int(2), "value" => arguments),
        ]))
    );

    Ok(Some(json_obj!(
        "full_text" => span_ref_json(s),
        "head" => head
    )))
}

fn grab_denotation(
    head: &SpanString,
    denotation: &str,
    with_arguments: bool,
) -> ParseResult<(SpanString, bool, Option<Json>)> {
    let head_parts = split(head, denotation)?;
    if head_parts.len() > 2 {
        return Err(ParsingException::new(
            "Too many denotations.",
            head.clone(),
        ));
    }
    if with_arguments {
        if head_parts.len() == 2 {
            let arg = strip(&head_parts[1]);
            if !arg.is_empty() && arg.at(0) == b'(' {
                return Err(ParsingException::new(
                    "Can not parse denotations when extracting.",
                    head.clone(),
                ));
            }
            let args = parse_record_internals(&arg, false, false, false)?;
            return Ok((head_parts[0].clone(), true, Some(args)));
        }
        return Ok((head.clone(), false, None));
    }
    if head_parts.len() == 2 {
        if !strip_spaces(&head_parts[1]).is_empty() {
            return Err(ParsingException::new(
                "Too many denotations or incorrect place.",
                head.clone(),
            ));
        }
        return Ok((head_parts[0].clone(), true, None));
    }
    Ok((head.clone(), false, None))
}

fn parse_function_rule_impl(s: &SpanString) -> ParseResult<Option<(Json, Json)>> {
    let parts = split_raw(s, "-->")?;
    if parts.len() != 2 {
        return Ok(None);
    }
    let this_call = parse_call(&parts[0], false)?;
    let this_call = match this_call {
        Some(c) => c,
        None => {
            return Err(ParsingException::new(
                "Left hand side of function definition must be a predicate call.",
                parts[0].clone(),
            ));
        }
    };
    let pred_name = this_call.as_object()["predicate_name"].as_str();
    let annotation_rule = parse_rule(&SpanString::new(format!("@CompileAsUdf({})", pred_name)))?;
    let rule = parse_rule(&SpanString::new(format!(
        "{} = {}",
        parts[0].to_string(),
        parts[1].to_string()
    )))?;
    Ok(Some((annotation_rule, rule)))
}

pub fn parse_rule(s: &SpanString) -> ParseResult<Json> {
    let parts = split(s, ":-")?;
    if parts.len() > 2 {
        return Err(ParsingException::new(
            "Too many :- in a rule. Did you forget semicolon?",
            s.clone(),
        ));
    }
    let head = &parts[0];

    let (h1, couldbe, _) = grab_denotation(head, "couldbe", false)?;
    let (h2, cantbe, _) = grab_denotation(&h1, "cantbe", false)?;
    let (h3, shouldbe, _) = grab_denotation(&h2, "shouldbe", false)?;
    let (h4, limit, limit_what) = grab_denotation(&h3, "limit", true)?;
    let (h5, order_by, order_by_what) = grab_denotation(&h4, "order_by", true)?;
    let head = h5;

    let head_distinct = split(&head, "distinct")?;
    let mut result = JsonObject::new();

    if head_distinct.len() == 1 {
        let (parsed_head, is_distinct) = parse_head_call(&head, false)?;
        result.insert("head".into(), parsed_head);
        if is_distinct {
            result.insert("distinct_denoted".into(), Json::Bool(true));
        }
    } else {
        if !(head_distinct.len() == 2 && head_distinct[1].is_empty()) {
            return Err(ParsingException::new(
                "Can not parse rule head. Something is wrong with distinct.",
                head,
            ));
        }
        let (parsed_head, _) = parse_head_call(&head_distinct[0], true)?;
        result.insert("head".into(), parsed_head);
        result.insert("distinct_denoted".into(), Json::Bool(true));
    }

    if couldbe {
        result.insert("couldbe_denoted".into(), Json::Bool(true));
    }
    if cantbe {
        result.insert("cantbe_denoted".into(), Json::Bool(true));
    }
    if shouldbe {
        result.insert("shouldbe_denoted".into(), Json::Bool(true));
    }
    if order_by {
        result.insert("orderby_denoted".into(), order_by_what.unwrap());
    }
    if limit {
        result.insert("limit_denoted".into(), limit_what.unwrap());
    }
    if parts.len() == 2 {
        result.insert("body".into(), parse_proposition(&parts[1])?);
    }
    result.insert("full_text".into(), span_ref_json(s));
    Ok(Json::Object(result))
}

// ------ Imports and rewrites ------

fn split_import(import_str: &str) -> ParseResult<(String, String, Option<String>)> {
    let (import_path, synonym) = if let Some(pos) = import_str.find(" as ") {
        if import_str[pos + 1..].contains(" as ") {
            return Err(ParsingException::new(
                "Too many as",
                SpanString::new(import_str.to_string()),
            ));
        }
        (
            &import_str[..pos],
            Some(import_str[pos + 4..].to_string()),
        )
    } else {
        (import_str, None)
    };

    let parts: Vec<&str> = import_path.split('.').collect();
    if parts.is_empty()
        || parts.last().unwrap().is_empty()
        || !parts
            .last()
            .unwrap()
            .chars()
            .next()
            .unwrap()
            .is_uppercase()
    {
        return Err(ParsingException::new(
            "One import per predicate please.",
            SpanString::new(import_str.to_string()),
        ));
    }
    let predicate = parts.last().unwrap().to_string();
    let file = parts[..parts.len() - 1].join(".");
    Ok((file, predicate, synonym))
}

fn defined_predicates(rules: &JsonArray) -> BTreeSet<String> {
    rules
        .iter()
        .map(|r| {
            r.as_object()["head"].as_object()["predicate_name"]
                .as_str()
                .to_string()
        })
        .collect()
}

fn made_predicates(rules: &JsonArray) -> BTreeSet<String> {
    let mut out = BTreeSet::new();
    for r in rules {
        let ro = r.as_object();
        if ro["head"].as_object()["predicate_name"].as_str() == "@Make" {
            let fv0 = &ro["head"].as_object()["record"].as_object()["field_value"].as_array()[0];
            let name = fv0.as_object()["value"].as_object()["expression"].as_object()["literal"]
                .as_object()["the_predicate"]
                .as_object()["predicate_name"]
                .as_str();
            out.insert(name.to_string());
        }
    }
    out
}

fn rename_predicate(e: &mut Json, old_name: &str, new_name: &str) -> i32 {
    let mut count = 0;
    let mut stack: Vec<*mut Json> = vec![e as *mut Json];

    while let Some(ptr) = stack.pop() {
        // SAFETY: all pointers originate from disjoint mutable borrows of
        // different nodes in the same Json tree; no two iterations alias.
        let node = unsafe { &mut *ptr };
        match node {
            Json::Object(o) => {
                if let Some(v) = o.get_mut("predicate_name") {
                    if v.is_string() && v.as_str() == old_name {
                        *v = Json::Str(new_name.to_string());
                        count += 1;
                    }
                }
                if let Some(v) = o.get_mut("field") {
                    if v.is_string() && v.as_str() == old_name {
                        *v = Json::Str(new_name.to_string());
                        count += 1;
                    }
                }
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
    count
}

fn annotations_from_denotations(rule: &mut Json) -> JsonArray {
    let mut result = JsonArray::new();

    for (denotation, annotation) in [("orderby_denoted", "@OrderBy"), ("limit_denoted", "@Limit")]
    {
        let ro = rule.as_object_mut();
        if !ro.contains_key(denotation) {
            continue;
        }

        // Shift args
        let fvs = ro
            .get_mut(denotation)
            .unwrap()
            .as_object_mut()
            .get_mut("field_value")
            .unwrap()
            .as_array_mut();
        for fv in fvs.iter_mut() {
            let field = fv.as_object_mut().get_mut("field").unwrap();
            if field.is_int() {
                *field = Json::Int(field.as_int() + 1);
            }
        }

        let args = ro[denotation].clone();
        let pred_name = ro["head"].as_object()["predicate_name"].clone();
        let full_text = ro["full_text"].clone();

        let head_fv0 = json_obj!(
            "field" => Json::Int(0),
            "value" => json_obj!(
                "expression" => json_obj!(
                    "literal" => json_obj!(
                        "the_predicate" => json_obj!("predicate_name" => pred_name)
                    )
                )
            )
        );

        let mut fvs = vec![head_fv0];
        for fv in args.as_object()["field_value"].as_array() {
            fvs.push(fv.clone());
        }

        let ann = json_obj!(
            "full_text" => full_text,
            "head" => json_obj!(
                "predicate_name" => annotation,
                "record" => json_obj!("field_value" => Json::Array(fvs))
            )
        );
        result.push(ann);
    }
    result
}

fn parse_file_internal(
    content: &str,
    this_file_name: &str,
    parsed_imports: &mut BTreeMap<String, Json>,
    in_progress: &mut BTreeSet<String>,
    import_chain: Vec<String>,
    import_root: &[String],
) -> ParseResult<Json> {
    let mut chain = import_chain;
    chain.push(this_file_name.to_string());

    // Check for incantation (enables extended operator syntax).
    if this_file_name == "main" {
        enact_incantations(content);
    }

    let s = SpanString::new(remove_comments(&SpanString::new(content.to_string()))?);
    let statements = split(&s, ";")?;
    let mut rules = JsonArray::new();
    let mut imported_predicates = JsonArray::new();
    let mut predicates_created_by_import: BTreeMap<String, BTreeSet<String>> = BTreeMap::new();

    for st in &statements {
        if st.is_empty() {
            continue;
        }
        if st.starts_with("import ") {
            let import_str = st.slice_from(7).to_string();
            let (file_import_str, import_predicate, synonym) = split_import(&import_str)?;
            let parsed = parse_import(
                &file_import_str,
                parsed_imports,
                in_progress,
                &chain,
                import_root,
            )?;

            let mut ip = JsonObject::new();
            ip.insert("file".into(), Json::Str(file_import_str.clone()));
            ip.insert("predicate_name".into(), Json::Str(import_predicate));
            ip.insert(
                "synonym".into(),
                synonym
                    .map(|s| Json::Str(s))
                    .unwrap_or(Json::Null),
            );
            imported_predicates.push(Json::Object(ip));

            if !predicates_created_by_import.contains_key(&file_import_str) {
                let prules = parsed.as_object()["rule"].as_array();
                let mut def = defined_predicates(prules);
                def.extend(made_predicates(prules));
                predicates_created_by_import.insert(file_import_str, def);
            }
            continue;
        }

        // Reset heritage to statement text
        let statement = SpanString::new(st.to_string());

        let mut rule = None;
        if let Some(ann) = parse_function_rule_impl(&statement)? {
            rules.push(ann.0);
            rule = Some(ann.1);
        }
        if rule.is_none() {
            rule = parse_functor_rule(&statement)?;
        }
        if rule.is_none() {
            let mut r = parse_rule(&statement)?;
            let anns = annotations_from_denotations(&mut r);
            for a in anns {
                rules.push(a);
            }
            rule = Some(r);
        }
        if let Some(r) = rule {
            rules.push(r);
        }
    }

    // Rewrites
    let mut rewritten = rewrite::dnf_rewrite(&Json::Array(rules));
    rewritten = rewrite::multi_body_aggregation_rewrite(&rewritten)?;
    rewritten = rewrite::rewrite_aggregations_as_expressions(&rewritten);
    rules = match rewritten {
        Json::Array(a) => a,
        _ => unreachable!(),
    };

    // Prefix
    let prefix = if this_file_name == "main" {
        String::new()
    } else {
        let existing: BTreeSet<String> = parsed_imports
            .values()
            .filter_map(|v| {
                v.as_object()
                    .get("predicates_prefix")
                    .map(|p| p.as_str().to_string())
            })
            .collect();

        let parts: Vec<&str> = this_file_name.split('.').collect();
        let mut idx = parts.len() as isize - 1;
        let capitalize = |x: &str| -> String {
            let mut s = x.to_string();
            if let Some(first) = s.get_mut(0..1) {
                first.make_ascii_uppercase();
            }
            if let Some(rest) = s.get_mut(1..) {
                rest.make_ascii_lowercase();
            }
            s
        };

        let mut p = format!("{}_", capitalize(parts[idx as usize]));
        while existing.contains(&p) {
            idx -= 1;
            if idx <= 0 {
                return Err(ParsingException::new(
                    "Import paths equal modulo _ and /.",
                    SpanString::new(p),
                ));
            }
            p = format!("{}{}", parts[idx as usize], p);
        }
        p
    };

    // Rename predicates for non-main
    if this_file_name != "main" {
        let mut def = defined_predicates(&rules);
        def.extend(made_predicates(&rules));
        for p in &def {
            if !p.is_empty() && !p.starts_with('@') && p != "++?" {
                for r in rules.iter_mut() {
                    rename_predicate(r, p, &format!("{}{}", prefix, p));
                }
            }
        }
    }

    // Apply imported predicate renames
    for ipj in &imported_predicates {
        let ip = ipj.as_object();
        let file = ip["file"].as_str();
        let imported_pred_name = ip["predicate_name"].as_str();
        let imported_as = if ip["synonym"].is_null() {
            imported_pred_name
        } else {
            ip["synonym"].as_str()
        };
        let import_prefix = parsed_imports[file].as_object()["predicates_prefix"].as_str();
        if import_prefix.is_empty() {
            return Err(ParsingException::new(
                "Empty import prefix",
                SpanString::new(file.to_string()),
            ));
        }
        let mut rename_count = 0;
        for r in rules.iter_mut() {
            rename_count += rename_predicate(
                r,
                imported_as,
                &format!("{}{}", import_prefix, imported_pred_name),
            );
        }
        let preds = &predicates_created_by_import[file];
        if !preds.contains(&format!("{}{}", import_prefix, imported_pred_name))
            && !preds.contains(imported_pred_name)
        {
            return Err(ParsingException::new(
                "Predicate imported but not defined.",
                SpanString::new(format!("{} -> {}", file, imported_pred_name)),
            ));
        }
        if rename_count == 0 {
            return Err(ParsingException::new(
                "Predicate imported but not used.",
                SpanString::new(format!("{} -> {}", file, imported_as)),
            ));
        }
    }

    // Main assembles all rules
    if this_file_name == "main" {
        let mut defined = defined_predicates(&rules);
        for (_, v) in parsed_imports.iter() {
            let irules = v.as_object()["rule"].as_array();
            let new_preds = defined_predicates(irules);
            for p in &new_preds {
                if defined.contains(p) && !p.is_empty() && !p.starts_with('@') {
                    return Err(ParsingException::new(
                        "Predicate from file is overridden by importer.",
                        SpanString::new(p.clone()),
                    ));
                }
            }
            defined.extend(new_preds);
            rules.extend(irules.clone());
        }
    }

    let mut out = JsonObject::new();
    out.insert("rule".into(), Json::Array(rules));
    out.insert("imported_predicates".into(), Json::Array(imported_predicates));
    out.insert("predicates_prefix".into(), Json::Str(prefix));
    out.insert("file_name".into(), Json::Str(this_file_name.to_string()));
    Ok(Json::Object(out))
}

fn parse_import(
    file_import_str: &str,
    parsed_imports: &mut BTreeMap<String, Json>,
    in_progress: &mut BTreeSet<String>,
    import_chain: &[String],
    import_root: &[String],
) -> ParseResult<Json> {
    if let Some(v) = parsed_imports.get(file_import_str) {
        return Ok(v.clone());
    }
    if in_progress.contains(file_import_str) {
        let chain = import_chain.join("->");
        return Err(ParsingException::new(
            format!(
                "Circular imports are not allowed: {}->{}",
                chain, file_import_str
            ),
            SpanString::new(file_import_str.to_string()),
        ));
    }
    in_progress.insert(file_import_str.to_string());

    let rel = file_import_str.replace('.', "/") + ".l";
    let mut found = None;
    let roots = if import_root.is_empty() {
        vec!["".to_string()]
    } else {
        import_root.to_vec()
    };
    for root in &roots {
        let p = if root.is_empty() {
            std::path::PathBuf::from(&rel)
        } else {
            std::path::PathBuf::from(root).join(&rel)
        };
        if p.exists() {
            found = Some(p);
            break;
        }
    }
    let path = found.ok_or_else(|| {
        ParsingException::new(
            format!("Imported file not found: {}", rel),
            SpanString::new(format!("import {}.<PREDICATE>", file_import_str)),
        )
    })?;

    let content = std::fs::read_to_string(&path).map_err(|e| {
        ParsingException::new(
            format!("Failed to read file: {}", e),
            SpanString::new(path.display().to_string()),
        )
    })?;

    let parsed = parse_file_internal(
        &content,
        file_import_str,
        parsed_imports,
        in_progress,
        import_chain.to_vec(),
        import_root,
    )?;
    parsed_imports.insert(file_import_str.to_string(), parsed.clone());
    in_progress.remove(file_import_str);
    Ok(parsed)
}

/// Parse a Synalog/Logica program file and return the AST as JSON.
/// Uses Logica mode by default for backward compatibility.
pub fn parse_file(content: &str, file_name: Option<&str>, import_root: &[String]) -> ParseResult<Json> {
    parse_file_with_mode(content, file_name, import_root, CompilationMode::Logica)
}

/// Parse a Synalog/Logica program file with explicit compilation mode.
/// - `Synalog`: Strict mode - only named arguments allowed
/// - `Logica`: Compatibility mode - positional arguments allowed
pub fn parse_file_with_mode(
    content: &str,
    file_name: Option<&str>,
    import_root: &[String],
    mode: CompilationMode,
) -> ParseResult<Json> {
    // Reset fun mode and set compilation mode for each top-level parse.
    FUN_MODE.with(|c| c.set(false));
    set_compilation_mode(mode);
    let mut parsed_imports = BTreeMap::new();
    let mut in_progress = BTreeSet::new();
    let fname = file_name.unwrap_or("main");
    parse_file_internal(content, fname, &mut parsed_imports, &mut in_progress, vec![], import_root)
}

#[cfg(test)]
#[path = "parse_test.rs"]
mod parse_test;
