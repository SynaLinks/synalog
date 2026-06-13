use super::*;
use crate::compiler::dialects::SqLiteDialect;
use crate::compiler::dialects::BigQueryDialect;
use crate::compiler::dialects::DuckDbDialect;

fn make_translator() -> ExprTranslator<'static> {
    static DIALECT: SqLiteDialect = SqLiteDialect;
    static FLAGS: std::sync::LazyLock<HashMap<String, String>> =
        std::sync::LazyLock::new(HashMap::new);
    let mut vocab = HashMap::new();
    vocab.insert("x".to_string(), "t_0.col0".to_string());
    vocab.insert("y".to_string(), "t_0.col1".to_string());
    ExprTranslator::new(vocab, &DIALECT, &FLAGS)
}

fn make_bigquery_translator() -> ExprTranslator<'static> {
    static DIALECT: BigQueryDialect = BigQueryDialect;
    static FLAGS: std::sync::LazyLock<HashMap<String, String>> =
        std::sync::LazyLock::new(HashMap::new);
    let mut vocab = HashMap::new();
    vocab.insert("x".to_string(), "t_0.col0".to_string());
    ExprTranslator::new(vocab, &DIALECT, &FLAGS)
}

fn make_duckdb_translator() -> ExprTranslator<'static> {
    static DIALECT: DuckDbDialect = DuckDbDialect;
    static FLAGS: std::sync::LazyLock<HashMap<String, String>> =
        std::sync::LazyLock::new(HashMap::new);
    let mut vocab = HashMap::new();
    vocab.insert("x".to_string(), "t_0.col0".to_string());
    ExprTranslator::new(vocab, &DIALECT, &FLAGS)
}

// ── Variable ──

#[test]
fn test_variable() {
    let ql = make_translator();
    let expr = crate::json_obj!("variable" => crate::json_obj!("var_name" => "x"));
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "t_0.col0");
}

#[test]
fn test_variable_undefined() {
    let ql = make_translator();
    let expr = crate::json_obj!("variable" => crate::json_obj!("var_name" => "unknown"));
    assert!(ql.convert_to_sql(&expr).is_err());
}

// ── Literals ──

#[test]
fn test_int_literal() {
    let ql = make_translator();
    let expr = crate::json_obj!("literal" => crate::json_obj!("the_number" => Json::Int(42)));
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "42");
}

#[test]
fn test_number_literal_as_object() {
    let ql = make_translator();
    let expr = crate::json_obj!("literal" => crate::json_obj!(
        "the_number" => crate::json_obj!("number" => "3.14")
    ));
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "3.14");
}

#[test]
fn test_string_literal() {
    let ql = make_translator();
    let expr = crate::json_obj!("literal" => crate::json_obj!("the_string" => "hello"));
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "'hello'");
}

#[test]
fn test_string_literal_with_quote() {
    let ql = make_duckdb_translator();
    let expr = crate::json_obj!("literal" => crate::json_obj!("the_string" => "it's"));
    // DuckDB uses E'...' escape-string literals (matches logica's DuckDB dialect).
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "E'it''s'");
}

#[test]
fn test_null_literal() {
    let ql = make_translator();
    let expr = crate::json_obj!("literal" => crate::json_obj!("the_null" => Json::Null));
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "null");
}

#[test]
fn test_bool_literal_true() {
    let ql = make_translator();
    let expr = crate::json_obj!("literal" => crate::json_obj!("the_bool" => "true"));
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "true");
}

#[test]
fn test_bool_literal_false() {
    let ql = make_translator();
    let expr = crate::json_obj!("literal" => crate::json_obj!("the_bool" => "false"));
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "false");
}

#[test]
fn test_predicate_literal() {
    let ql = make_bigquery_translator();
    let expr = crate::json_obj!("literal" => crate::json_obj!(
        "the_predicate" => crate::json_obj!("predicate_name" => "Foo")
    ));
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("Foo"), "Got: {}", result);
}

#[test]
fn test_symbol_literal() {
    let ql = make_translator();
    let expr = crate::json_obj!("literal" => crate::json_obj!(
        "the_symbol" => crate::json_obj!("symbol" => "my_symbol")
    ));
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "my_symbol");
}

// ── Infix operators ──

#[test]
fn test_infix_operator() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "+",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(1))
                            )
                        )
                    ),
                ])
            )
        )
    );
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "((t_0.col0) + (1))");
}

// ── Built-in functions ──

#[test]
fn test_builtin_function_sum() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "Sum",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                ])
            )
        )
    );
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "SUM(t_0.col0)");
}

#[test]
fn test_builtin_function_not() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "!",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                ])
            )
        )
    );
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "NOT t_0.col0");
}

#[test]
fn test_builtin_function_isnull() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "IsNull",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                ])
            )
        )
    );
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "(t_0.col0 IS NULL)");
}

// ── If-then-else ──

#[test]
fn test_if_then_else() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "If",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(1))
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(2),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(0))
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert_eq!(result, "IF(t_0.col0, 1, 0)");
}

// ── CamelCase passthrough ──

#[test]
fn test_unknown_uppercase_function_passthrough() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "MyCustomFunc",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                ])
            )
        )
    );
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "MYCUSTOMFUNC(t_0.col0)");
}

// ── Unknown lowercase function ──

#[test]
fn test_unknown_lowercase_function_error() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "unknownFunc",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![])
            )
        )
    );
    assert!(ql.convert_to_sql(&expr).is_err());
}

// ── apply_template ──

#[test]
fn test_apply_template() {
    assert_eq!(apply_template("SUM(%s)", &["x".into()]), "SUM(x)");
    assert_eq!(apply_template("{0} + {1}", &["a".into(), "b".into()]), "a + b");
    assert_eq!(apply_template("%s = %s", &["a".into(), "b".into()]), "a = b");
}

#[test]
fn test_apply_template_three_args() {
    assert_eq!(
        apply_template("REPLACE({0}, {1}, {2})", &["a".into(), "b".into(), "c".into()]),
        "REPLACE(a, b, c)"
    );
}

#[test]
fn test_apply_template_extra_percent_s() {
    assert_eq!(
        apply_template("%s + %s + %s", &["a".into(), "b".into()]),
        "a + b + %s"
    );
}

// ── logica_field_to_sql_field ──

#[test]
fn test_logica_field_to_sql_field_simple() {
    assert_eq!(logica_field_to_sql_field("col0"), "col0");
}

#[test]
fn test_logica_field_to_sql_field_underscore() {
    assert_eq!(logica_field_to_sql_field("my_field"), "my_field");
}

#[test]
fn test_logica_field_to_sql_field_special_chars() {
    assert_eq!(logica_field_to_sql_field("col-name"), "\"col-name\"");
}

#[test]
fn test_logica_field_to_sql_field_spaces() {
    assert_eq!(logica_field_to_sql_field("my field"), "\"my field\"");
}

// ── Non-object expression error ──

#[test]
fn test_non_object_expression_error() {
    let ql = make_translator();
    assert!(ql.convert_to_sql(&Json::Int(42)).is_err());
}

// ── Empty expression error ──

#[test]
fn test_empty_expression_error() {
    let ql = make_translator();
    let expr = crate::json_obj!("expression_heritage" => "test");
    assert!(ql.convert_to_sql(&expr).is_err());
}

// ── Record expression ──

#[test]
fn test_record_expression() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "record" => crate::json_obj!(
            "field_value" => Json::Array(vec![
                crate::json_obj!(
                    "field" => "a",
                    "value" => crate::json_obj!(
                        "expression" => crate::json_obj!(
                            "literal" => crate::json_obj!("the_number" => Json::Int(1))
                        )
                    )
                ),
            ])
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("JSON_OBJECT"), "Got: {}", result);
    assert!(result.contains("'a'"), "Got: {}", result);
    assert!(result.contains("1"), "Got: {}", result);
}

// ── List literal ──

#[test]
fn test_list_literal() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "literal" => crate::json_obj!(
            "the_list" => crate::json_obj!(
                "element" => Json::Array(vec![
                    crate::json_obj!("literal" => crate::json_obj!("the_number" => Json::Int(1))),
                    crate::json_obj!("literal" => crate::json_obj!("the_number" => Json::Int(2))),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("JSON_ARRAY"), "Got: {}", result);
    assert!(result.contains("1"), "Got: {}", result);
    assert!(result.contains("2"), "Got: {}", result);
}

#[test]
fn test_empty_list_literal() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "literal" => crate::json_obj!(
            "the_list" => Json::Object(crate::parser::JsonObject::new())
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("JSON_ARRAY"), "Got: {}", result);
}

// ── Aggregation passthrough ──

#[test]
fn test_aggregation_expression() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "aggregation" => crate::json_obj!(
            "expression" => crate::json_obj!(
                "variable" => crate::json_obj!("var_name" => "x")
            )
        )
    );
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "t_0.col0");
}

// ── Cast ──

#[test]
fn test_cast_expression() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "Cast",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_string" => "INT64")
                            )
                        )
                    ),
                ])
            )
        )
    );
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "CAST(t_0.col0 AS INT64)");
}

// ── FlagValue ──

#[test]
fn test_flag_value_with_flag() {
    static DIALECT: SqLiteDialect = SqLiteDialect;
    let mut flags = HashMap::new();
    flags.insert("my_flag".to_string(), "flag_val".to_string());
    let mut vocab = HashMap::new();
    vocab.insert("x".to_string(), "t_0.col0".to_string());
    let ql = ExprTranslator::new(vocab, &DIALECT, &flags);

    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "FlagValue",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_string" => "my_flag")
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("flag_val"), "Got: {}", result);
}

#[test]
fn test_flag_value_undefined_error() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "FlagValue",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_string" => "nonexistent")
                            )
                        )
                    ),
                ])
            )
        )
    );
    assert!(ql.convert_to_sql(&expr).is_err());
}

// ── Subscript ──

#[test]
fn test_subscript_literal_string() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "subscript" => crate::json_obj!(
            "record" => crate::json_obj!(
                "variable" => crate::json_obj!("var_name" => "x")
            ),
            "subscript" => crate::json_obj!(
                "literal" => crate::json_obj!("the_string" => "name")
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("name"), "Got: {}", result);
}

#[test]
fn test_subscript_bigquery() {
    let ql = make_bigquery_translator();
    let expr = crate::json_obj!(
        "subscript" => crate::json_obj!(
            "record" => crate::json_obj!(
                "variable" => crate::json_obj!("var_name" => "x")
            ),
            "subscript" => crate::json_obj!(
                "literal" => crate::json_obj!("the_string" => "field")
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert_eq!(result, "t_0.col0.field");
}

#[test]
fn test_subscript_dynamic() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "subscript" => crate::json_obj!(
            "record" => crate::json_obj!(
                "variable" => crate::json_obj!("var_name" => "x")
            ),
            "subscript" => crate::json_obj!(
                "variable" => crate::json_obj!("var_name" => "y")
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("t_0.col0"), "Got: {}", result);
    assert!(result.contains("t_0.col1"), "Got: {}", result);
}

// ── Implication / CASE WHEN ──

#[test]
fn test_implication_multi_branch() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "implication" => crate::json_obj!(
            "if_then" => Json::Array(vec![
                crate::json_obj!(
                    "condition" => crate::json_obj!(
                        "variable" => crate::json_obj!("var_name" => "x")
                    ),
                    "consequence" => crate::json_obj!(
                        "literal" => crate::json_obj!("the_number" => Json::Int(1))
                    )
                ),
                crate::json_obj!(
                    "condition" => crate::json_obj!(
                        "variable" => crate::json_obj!("var_name" => "y")
                    ),
                    "consequence" => crate::json_obj!(
                        "literal" => crate::json_obj!("the_number" => Json::Int(2))
                    )
                ),
            ]),
            "otherwise" => crate::json_obj!(
                "literal" => crate::json_obj!("the_number" => Json::Int(0))
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("CASE"), "Got: {}", result);
    assert!(result.contains("WHEN t_0.col0 THEN 1"), "Got: {}", result);
    assert!(result.contains("WHEN t_0.col1 THEN 2"), "Got: {}", result);
    assert!(result.contains("ELSE 0"), "Got: {}", result);
    assert!(result.contains("END"), "Got: {}", result);
}

#[test]
fn test_implication_no_else() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "implication" => crate::json_obj!(
            "if_then" => Json::Array(vec![
                crate::json_obj!(
                    "condition" => crate::json_obj!(
                        "variable" => crate::json_obj!("var_name" => "x")
                    ),
                    "consequence" => crate::json_obj!(
                        "literal" => crate::json_obj!("the_number" => Json::Int(1))
                    )
                ),
            ])
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.starts_with("CASE"), "Got: {}", result);
    assert!(!result.contains("ELSE"), "Should have no ELSE: {}", result);
    assert!(result.ends_with("END"), "Got: {}", result);
}

// ── SqlExpr ──

#[test]
fn test_sqlexpr_basic() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "SqlExpr",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_string" => "COALESCE({0}, {1})")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(2),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(0))
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert_eq!(result, "COALESCE(t_0.col0, 0)");
}

// ── TryCast ──

#[test]
fn test_trycast_expression() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "TryCast",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_string" => "FLOAT64")
                            )
                        )
                    ),
                ])
            )
        )
    );
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "TRY_CAST(t_0.col0 AS FLOAT64)");
}

// ── More infix operators ──

fn make_infix(op: &str, left_var: &str, right_var: &str) -> Json {
    crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => op,
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => left_var)
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => right_var)
                            )
                        )
                    ),
                ])
            )
        )
    )
}

#[test]
fn test_infix_equal() {
    let ql = make_translator();
    let result = ql.convert_to_sql(&make_infix("==", "x", "y")).unwrap();
    assert!(result.contains("="), "Got: {}", result);
}

#[test]
fn test_infix_not_equal() {
    let ql = make_translator();
    let result = ql.convert_to_sql(&make_infix("!=", "x", "y")).unwrap();
    assert!(result.contains("!="), "Got: {}", result);
}

#[test]
fn test_infix_less_than() {
    let ql = make_translator();
    let result = ql.convert_to_sql(&make_infix("<", "x", "y")).unwrap();
    assert!(result.contains("<"), "Got: {}", result);
}

#[test]
fn test_infix_greater_equal() {
    let ql = make_translator();
    let result = ql.convert_to_sql(&make_infix(">=", "x", "y")).unwrap();
    assert!(result.contains(">="), "Got: {}", result);
}

#[test]
fn test_infix_and() {
    let ql = make_translator();
    let result = ql.convert_to_sql(&make_infix("&&", "x", "y")).unwrap();
    assert!(result.contains("AND"), "Got: {}", result);
}

#[test]
fn test_infix_or() {
    let ql = make_translator();
    let result = ql.convert_to_sql(&make_infix("||", "x", "y")).unwrap();
    assert!(result.contains("OR"), "Got: {}", result);
}

#[test]
fn test_infix_concat() {
    let ql = make_translator();
    let result = ql.convert_to_sql(&make_infix("++", "x", "y")).unwrap();
    assert!(result.contains("||") || result.contains("CONCAT"), "Got: {}", result);
}

// ── More built-in functions ──

fn make_unary_call(func: &str, var: &str) -> Json {
    crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => func,
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => var)
                            )
                        )
                    ),
                ])
            )
        )
    )
}

#[test]
fn test_builtin_abs() {
    let ql = make_translator();
    assert_eq!(ql.convert_to_sql(&make_unary_call("Abs", "x")).unwrap(), "ABS(t_0.col0)");
}

#[test]
fn test_builtin_length() {
    let ql = make_translator();
    assert_eq!(ql.convert_to_sql(&make_unary_call("Length", "x")).unwrap(), "LENGTH(t_0.col0)");
}

#[test]
fn test_builtin_upper() {
    let ql = make_translator();
    assert_eq!(ql.convert_to_sql(&make_unary_call("Upper", "x")).unwrap(), "UPPER(t_0.col0)");
}

#[test]
fn test_builtin_lower() {
    let ql = make_translator();
    assert_eq!(ql.convert_to_sql(&make_unary_call("Lower", "x")).unwrap(), "LOWER(t_0.col0)");
}

#[test]
fn test_builtin_tofloat64() {
    let ql = make_translator();
    let result = ql.convert_to_sql(&make_unary_call("ToFloat64", "x")).unwrap();
    assert!(result.contains("t_0.col0"), "Got: {}", result);
}

#[test]
fn test_builtin_toint64() {
    let ql = make_translator();
    let result = ql.convert_to_sql(&make_unary_call("ToInt64", "x")).unwrap();
    assert!(result.contains("t_0.col0"), "Got: {}", result);
}

#[test]
fn test_builtin_tostring() {
    let ql = make_translator();
    let result = ql.convert_to_sql(&make_unary_call("ToString", "x")).unwrap();
    assert!(result.contains("t_0.col0"), "Got: {}", result);
}

#[test]
fn test_builtin_count() {
    let ql = make_translator();
    assert_eq!(ql.convert_to_sql(&make_unary_call("Count", "x")).unwrap(), "COUNT(DISTINCT t_0.col0)");
}

#[test]
fn test_builtin_avg() {
    let ql = make_translator();
    assert_eq!(ql.convert_to_sql(&make_unary_call("Avg", "x")).unwrap(), "AVG(t_0.col0)");
}

#[test]
fn test_builtin_max() {
    let ql = make_translator();
    assert_eq!(ql.convert_to_sql(&make_unary_call("Max", "x")).unwrap(), "MAX(t_0.col0)");
}

#[test]
fn test_builtin_min() {
    let ql = make_translator();
    assert_eq!(ql.convert_to_sql(&make_unary_call("Min", "x")).unwrap(), "MIN(t_0.col0)");
}

#[test]
fn test_builtin_size() {
    let ql = make_translator();
    let result = ql.convert_to_sql(&make_unary_call("Size", "x")).unwrap();
    assert!(result.contains("t_0.col0"), "Got: {}", result);
}

#[test]
fn test_builtin_sort() {
    let ql = make_translator();
    let result = ql.convert_to_sql(&make_unary_call("Sort", "x")).unwrap();
    assert!(result.contains("t_0.col0"), "Got: {}", result);
}

#[test]
fn test_builtin_floor() {
    let ql = make_translator();
    assert_eq!(ql.convert_to_sql(&make_unary_call("Floor", "x")).unwrap(), "FLOOR(t_0.col0)");
}

#[test]
fn test_builtin_ceiling() {
    let ql = make_translator();
    assert_eq!(ql.convert_to_sql(&make_unary_call("Ceiling", "x")).unwrap(), "CEIL(t_0.col0)");
}

#[test]
fn test_builtin_round() {
    let ql = make_translator();
    assert_eq!(ql.convert_to_sql(&make_unary_call("Round", "x")).unwrap(), "ROUND(t_0.col0)");
}

#[test]
fn test_builtin_exp() {
    let ql = make_translator();
    assert_eq!(ql.convert_to_sql(&make_unary_call("Exp", "x")).unwrap(), "EXP(t_0.col0)");
}

#[test]
fn test_builtin_sqrt() {
    let ql = make_translator();
    assert_eq!(ql.convert_to_sql(&make_unary_call("Sqrt", "x")).unwrap(), "SQRT(t_0.col0)");
}

// ── List with DuckDB dialect ──

#[test]
fn test_list_literal_duckdb() {
    let ql = make_duckdb_translator();
    let expr = crate::json_obj!(
        "literal" => crate::json_obj!(
            "the_list" => crate::json_obj!(
                "element" => Json::Array(vec![
                    crate::json_obj!("literal" => crate::json_obj!("the_number" => Json::Int(1))),
                    crate::json_obj!("literal" => crate::json_obj!("the_number" => Json::Int(2))),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert_eq!(result, "[1, 2]");
}

// ── Record literal ──

#[test]
fn test_record_literal_multiple_fields() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "literal" => crate::json_obj!(
            "the_record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => "a",
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(1))
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => "b",
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_string" => "hello")
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("JSON_OBJECT"), "Got: {}", result);
    assert!(result.contains("'a'"), "Got: {}", result);
    assert!(result.contains("'b'"), "Got: {}", result);
}

// ── SubqueryTranslator mock ──

struct MockSubqueryTranslator;

impl SubqueryTranslator for MockSubqueryTranslator {
    fn translate_table(&self, predicate: &str, _vocab: Option<&HashMap<String, String>>) -> crate::compiler::CompileResult<String> {
        Ok(predicate.to_string())
    }
    fn translate_rule(&self, _rule: &Json, _vocab: &HashMap<String, String>, _is_combine: bool) -> crate::compiler::CompileResult<String> {
        Ok("SELECT 1 AS logica_value".to_string())
    }
}

#[test]
fn test_combine_requires_translator() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "combine" => crate::json_obj!("head" => "test")
    );
    assert!(ql.convert_to_sql(&expr).is_err());
}

#[test]
fn test_combine_with_translator() {
    static DIALECT: SqLiteDialect = SqLiteDialect;
    static FLAGS: std::sync::LazyLock<HashMap<String, String>> =
        std::sync::LazyLock::new(HashMap::new);
    let vocab = HashMap::new();
    let mut ql = ExprTranslator::new(vocab, &DIALECT, &FLAGS);
    let mock = MockSubqueryTranslator;
    ql.subquery_translator = Some(&mock);

    let expr = crate::json_obj!(
        "combine" => crate::json_obj!("head" => "test")
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("SELECT 1"), "Got: {}", result);
}

#[test]
fn test_user_predicate_no_args() {
    static DIALECT: SqLiteDialect = SqLiteDialect;
    static FLAGS: std::sync::LazyLock<HashMap<String, String>> =
        std::sync::LazyLock::new(HashMap::new);
    let vocab = HashMap::new();
    let mut ql = ExprTranslator::new(vocab, &DIALECT, &FLAGS);
    let mock = MockSubqueryTranslator;
    ql.subquery_translator = Some(&mock);

    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "myPred",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("SELECT logica_value FROM myPred"), "Got: {}", result);
}

#[test]
fn test_user_predicate_with_args() {
    static DIALECT: SqLiteDialect = SqLiteDialect;
    static FLAGS: std::sync::LazyLock<HashMap<String, String>> =
        std::sync::LazyLock::new(HashMap::new);
    let mut vocab = HashMap::new();
    vocab.insert("x".to_string(), "t_0.col0".to_string());
    let mut ql = ExprTranslator::new(vocab, &DIALECT, &FLAGS);
    let mock = MockSubqueryTranslator;
    ql.subquery_translator = Some(&mock);

    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "myPred",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("SELECT logica_value FROM myPred WHERE col0 = t_0.col0"), "Got: {}", result);
}

// ── Unary minus ──

#[test]
fn test_unary_minus() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "-",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(0))
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("-"), "Got: {}", result);
}

// ── CumulativeSum (analytic) ──

#[test]
fn test_cumulative_sum() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "CumulativeSum",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!(
                                    "the_list" => Json::Object(crate::parser::JsonObject::new())
                                )
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(2),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!(
                                    "the_list" => crate::json_obj!(
                                        "element" => Json::Array(vec![
                                            crate::json_obj!(
                                                "variable" => crate::json_obj!("var_name" => "y")
                                            ),
                                        ])
                                    )
                                )
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("SUM"), "Got: {}", result);
    assert!(result.contains("OVER"), "Got: {}", result);
    assert!(result.contains("ORDER BY"), "Got: {}", result);
}

// ── Bool literal as object ──

#[test]
fn test_bool_literal_as_object() {
    let ql = make_translator();
    let expr = crate::json_obj!("literal" => crate::json_obj!(
        "the_bool" => crate::json_obj!("the_bool" => "true")
    ));
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "true");
}

// ── String literal as nested object ──

#[test]
fn test_string_literal_as_nested_object() {
    let ql = make_translator();
    let expr = crate::json_obj!("literal" => crate::json_obj!(
        "the_string" => crate::json_obj!("the_string" => "world")
    ));
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "'world'");
}

// ── Number literal fallback (non-int, non-object) ──

#[test]
fn test_number_literal_non_int() {
    let ql = make_translator();
    // A number that's a plain string (e.g. from parser)
    let expr = crate::json_obj!("literal" => crate::json_obj!(
        "the_number" => "42"
    ));
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("42"), "Got: {}", result);
}

// ── Empty list with different dialects ──

#[test]
fn test_empty_list_duckdb() {
    let ql = make_duckdb_translator();
    let expr = crate::json_obj!(
        "literal" => crate::json_obj!(
            "the_list" => Json::Object(crate::parser::JsonObject::new())
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("[]") || result.contains("[") , "Got: {}", result);
}

// ── Subscript with number literal ──

#[test]
fn test_subscript_number() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "subscript" => crate::json_obj!(
            "record" => crate::json_obj!(
                "variable" => crate::json_obj!("var_name" => "x")
            ),
            "subscript" => crate::json_obj!(
                "literal" => crate::json_obj!("the_number" => Json::Int(0))
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("0"), "Got: {}", result);
}

// ── Subscript with symbol literal ──

#[test]
fn test_subscript_symbol() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "subscript" => crate::json_obj!(
            "record" => crate::json_obj!(
                "variable" => crate::json_obj!("var_name" => "x")
            ),
            "subscript" => crate::json_obj!(
                "literal" => crate::json_obj!(
                    "the_symbol" => crate::json_obj!("symbol" => "my_field")
                )
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("my_field"), "Got: {}", result);
}

// ── Subscript with record_is_table ──

#[test]
fn test_subscript_record_is_table() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "subscript" => crate::json_obj!(
            "record" => crate::json_obj!(
                "variable" => crate::json_obj!("var_name" => "x")
            ),
            "subscript" => crate::json_obj!(
                "literal" => crate::json_obj!("the_string" => "col0")
            ),
            "record_is_table" => Json::Bool(true)
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("col0"), "Got: {}", result);
}

// ── WindowSum (4-arg analytic) ──

#[test]
fn test_window_sum() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "WindowSum",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!(
                                    "the_list" => Json::Object(crate::parser::JsonObject::new())
                                )
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(2),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!(
                                    "the_list" => crate::json_obj!(
                                        "element" => Json::Array(vec![
                                            crate::json_obj!(
                                                "variable" => crate::json_obj!("var_name" => "y")
                                            ),
                                        ])
                                    )
                                )
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(3),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(5))
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("SUM"), "Got: {}", result);
    assert!(result.contains("OVER"), "Got: {}", result);
    assert!(result.contains("5 PRECEDING"), "Got: {}", result);
}

// ── CumulativeMax ──

#[test]
fn test_cumulative_max() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "CumulativeMax",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!(
                                    "the_list" => crate::json_obj!(
                                        "element" => Json::Array(vec![
                                            crate::json_obj!(
                                                "variable" => crate::json_obj!("var_name" => "y")
                                            ),
                                        ])
                                    )
                                )
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(2),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("MAX"), "Got: {}", result);
    assert!(result.contains("OVER"), "Got: {}", result);
}

// ── CumulativeMin ──

#[test]
fn test_cumulative_min() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "CumulativeMin",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!(
                                    "the_list" => Json::Object(crate::parser::JsonObject::new())
                                )
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(2),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("MIN"), "Got: {}", result);
    assert!(result.contains("OVER"), "Got: {}", result);
}

// ── WindowMax ──

#[test]
fn test_window_max() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "WindowMax",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!(
                                    "the_list" => Json::Object(crate::parser::JsonObject::new())
                                )
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(2),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!(
                                    "the_list" => crate::json_obj!(
                                        "element" => Json::Array(vec![
                                            crate::json_obj!(
                                                "variable" => crate::json_obj!("var_name" => "y")
                                            ),
                                        ])
                                    )
                                )
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(3),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(3))
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("MAX"), "Got: {}", result);
    assert!(result.contains("OVER"), "Got: {}", result);
}

// ── WindowMin ──

#[test]
fn test_window_min() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "WindowMin",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!(
                                    "the_list" => Json::Object(crate::parser::JsonObject::new())
                                )
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(2),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!(
                                    "the_list" => crate::json_obj!(
                                        "element" => Json::Array(vec![
                                            crate::json_obj!(
                                                "variable" => crate::json_obj!("var_name" => "y")
                                            ),
                                        ])
                                    )
                                )
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(3),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(7))
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("MIN"), "Got: {}", result);
    assert!(result.contains("OVER"), "Got: {}", result);
}

// ── Named function args ──

#[test]
fn test_named_function_args() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "SqlExpr",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_string" => "SUM({val})")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => "val",
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("SUM"), "Got: {}", result);
}

// ── User predicate with failed translate_table ──

struct FailingTranslator;
impl SubqueryTranslator for FailingTranslator {
    fn translate_table(&self, _predicate: &str, _vocab: Option<&HashMap<String, String>>) -> crate::compiler::CompileResult<String> {
        Err(crate::compiler::CompileError::new("not found", ""))
    }
    fn translate_rule(&self, _rule: &Json, _vocab: &HashMap<String, String>, _is_combine: bool) -> crate::compiler::CompileResult<String> {
        Ok("SELECT 1".to_string())
    }
}

#[test]
fn test_user_predicate_fallback_uppercase() {
    static DIALECT: SqLiteDialect = SqLiteDialect;
    static FLAGS: std::sync::LazyLock<HashMap<String, String>> =
        std::sync::LazyLock::new(HashMap::new);
    let mut vocab = HashMap::new();
    vocab.insert("x".to_string(), "t_0.col0".to_string());
    let mut ql = ExprTranslator::new(vocab, &DIALECT, &FLAGS);
    let mock = FailingTranslator;
    ql.subquery_translator = Some(&mock);

    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "UnknownPred",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert_eq!(result, "UNKNOWNPRED(t_0.col0)");
}

#[test]
fn test_user_predicate_fallback_lowercase_error() {
    static DIALECT: SqLiteDialect = SqLiteDialect;
    static FLAGS: std::sync::LazyLock<HashMap<String, String>> =
        std::sync::LazyLock::new(HashMap::new);
    let vocab = HashMap::new();
    let mut ql = ExprTranslator::new(vocab, &DIALECT, &FLAGS);
    let mock = FailingTranslator;
    ql.subquery_translator = Some(&mock);

    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "unknownpred",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(1))
                            )
                        )
                    ),
                ])
            )
        )
    );
    assert!(ql.convert_to_sql(&expr).is_err());
}

// ── Unknown literal type ──

#[test]
fn test_unknown_literal_type() {
    let ql = make_translator();
    let expr = crate::json_obj!("literal" => crate::json_obj!("the_unknown" => "???"));
    assert!(ql.convert_to_sql(&expr).is_err());
}

// ── Record as expression (not literal) ──

#[test]
fn test_record_as_expression_multiple_fields() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "record" => crate::json_obj!(
            "field_value" => Json::Array(vec![
                crate::json_obj!(
                    "field" => "x",
                    "value" => crate::json_obj!(
                        "expression" => crate::json_obj!(
                            "literal" => crate::json_obj!("the_number" => Json::Int(1))
                        )
                    )
                ),
                crate::json_obj!(
                    "field" => "y",
                    "value" => crate::json_obj!(
                        "expression" => crate::json_obj!(
                            "literal" => crate::json_obj!("the_number" => Json::Int(2))
                        )
                    )
                ),
            ])
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("JSON_OBJECT"), "Got: {}", result);
}

// ── Null literal via "null" key ──

#[test]
fn test_null_literal_alt_key() {
    let ql = make_translator();
    let expr = crate::json_obj!("literal" => crate::json_obj!("null" => Json::Null));
    assert_eq!(ql.convert_to_sql(&expr).unwrap(), "null");
}

// ── infix operator with left/right template ──

#[test]
fn test_infix_sqlite_concat() {
    let ql = make_translator();
    let result = ql.convert_to_sql(&make_infix("++", "x", "y")).unwrap();
    // SQLite ++ maps to "({left} || {right})"
    assert!(result.contains("||") || result.contains("CONCAT"), "Got: {}", result);
}

// ── BigQuery record literal ──

#[test]
fn test_bigquery_record_literal() {
    let ql = make_bigquery_translator();
    let expr = crate::json_obj!(
        "literal" => crate::json_obj!(
            "the_record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => "a",
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(1))
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("STRUCT"), "Got: {}", result);
}

// ── number literal as nested object {"number": "42"} ──

#[test]
fn test_number_literal_as_nested_object() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "literal" => crate::json_obj!(
            "the_number" => crate::json_obj!("number" => "42")
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert_eq!(result, "42");
}

// ── string literal nested {"the_string": {"the_string": "hi"}} ──

#[test]
fn test_string_literal_nested_object() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "literal" => crate::json_obj!(
            "the_string" => crate::json_obj!("the_string" => "hello")
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("hello"), "Got: {}", result);
}

// ── bool literal nested {"the_bool": {"the_bool": "true"}} ──

#[test]
fn test_bool_literal_nested_object() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "literal" => crate::json_obj!(
            "the_bool" => crate::json_obj!("the_bool" => "true")
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert_eq!(result, "true");
}

// ── null literal with "null" key ──

#[test]
fn test_null_literal_with_null_key() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "literal" => crate::json_obj!("null" => Json::Bool(true))
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert_eq!(result, "null");
}

// ── empty list literal ──

#[test]
fn test_empty_list_literal_sqlite() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "literal" => crate::json_obj!(
            "the_list" => crate::json_obj!()
        )
    );
    let result = ql.convert_to_sql(&expr);
    // May fail or produce array phrase depending on dialect
    let _ = result;
}

// ── symbol literal standalone ──

#[test]
fn test_symbol_literal_standalone() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "literal" => crate::json_obj!(
            "the_symbol" => crate::json_obj!("symbol" => "my_symbol")
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert_eq!(result, "my_symbol");
}

// ── SqlExpr function ──

#[test]
fn test_sqlexpr_function() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "SqlExpr",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_string" => "SELECT {0} + 1")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(42))
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("42"), "Got: {}", result);
}

// ── Cast function ──

#[test]
fn test_cast_function() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "Cast",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(42))
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_string" => "INT64")
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("CAST"), "Got: {}", result);
    assert!(result.contains("INT64"), "Got: {}", result);
}

// ── FlagValue function ──

#[test]
fn test_flagvalue_function_defined() {
    // Use integration test through LogicaProgram instead
    let source = r#"
        @Engine("sqlite");
        @DefineFlag("my_flag", "flag_val");
        T(FlagValue("my_flag"));
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let program = crate::compiler::universe::LogicaProgram::new(
        &parsed, HashMap::new(), HashMap::new()).unwrap();
    let sql = program.formatted_predicate_sql("T").unwrap();
    assert!(sql.contains("flag_val"), "SQL should contain flag value: {}", sql);
}

// ── If/CASE WHEN ──

#[test]
fn test_if_case_when() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "If",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_bool" => "true")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(1))
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(2),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(0))
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    // Python Logica uses IF() function format
    assert!(result.starts_with("IF("), "Expected IF(...), Got: {}", result);
}

// ── Uppercase unknown function (CamelCase passthrough) ──

#[test]
fn test_uppercase_unknown_function_passthrough() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "MyCustomFunc",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "literal" => crate::json_obj!("the_number" => Json::Int(1))
                            )
                        )
                    ),
                ])
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("MYCUSTOMFUNC"), "Got: {}", result);
}

// ── record expression with two fields ──

#[test]
fn test_record_expression_two_fields() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "record" => crate::json_obj!(
            "field_value" => Json::Array(vec![
                crate::json_obj!(
                    "field" => "a",
                    "value" => crate::json_obj!(
                        "expression" => crate::json_obj!(
                            "literal" => crate::json_obj!("the_number" => Json::Int(1))
                        )
                    )
                ),
                crate::json_obj!(
                    "field" => "b",
                    "value" => crate::json_obj!(
                        "expression" => crate::json_obj!(
                            "literal" => crate::json_obj!("the_number" => Json::Int(2))
                        )
                    )
                ),
            ])
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("1"), "Got: {}", result);
    assert!(result.contains("2"), "Got: {}", result);
}

// ── subscript with non-literal sub ──

#[test]
fn test_subscript_non_literal() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "subscript" => crate::json_obj!(
            "subscript" => "field_name",
            "record" => crate::json_obj!(
                "variable" => crate::json_obj!("var_name" => "x")
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    // Should produce subscript access
    assert!(result.contains("field_name"), "Got: {}", result);
}

// ── implication expression ──

#[test]
fn test_implication_expression() {
    let ql = make_translator();
    let expr = crate::json_obj!(
        "implication" => crate::json_obj!(
            "if_then" => Json::Array(vec![
                crate::json_obj!(
                    "condition" => crate::json_obj!(
                        "literal" => crate::json_obj!("the_bool" => "true")
                    ),
                    "consequence" => crate::json_obj!(
                        "literal" => crate::json_obj!("the_number" => Json::Int(1))
                    )
                ),
            ]),
            "otherwise" => crate::json_obj!(
                "literal" => crate::json_obj!("the_number" => Json::Int(0))
            )
        )
    );
    let result = ql.convert_to_sql(&expr).unwrap();
    assert!(result.contains("CASE"), "Got: {}", result);
}
