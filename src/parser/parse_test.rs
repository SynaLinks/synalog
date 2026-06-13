use crate::parser::json::Json;
use crate::parser::parse::*;
use crate::parser::span::SpanString;

// ====== Literal parsing ======

#[test]
fn test_parse_number() {
    let s = SpanString::new("42".to_string());
    let result = parse_number(&s).unwrap();
    assert_eq!(result.as_object()["number"], Json::Str("42".to_string()));
}

#[test]
fn test_parse_number_float() {
    let s = SpanString::new("3.14".to_string());
    let result = parse_number(&s).unwrap();
    assert_eq!(result.as_object()["number"], Json::Str("3.14".to_string()));
}

#[test]
fn test_parse_number_negative() {
    let s = SpanString::new("-7".to_string());
    let result = parse_number(&s).unwrap();
    assert_eq!(result.as_object()["number"], Json::Str("-7".to_string()));
}

#[test]
fn test_parse_string_double_quotes() {
    let s = SpanString::new("\"hello\"".to_string());
    let result = parse_string(&s).unwrap();
    assert!(result.as_object().contains_key("the_string"));
}

#[test]
fn test_parse_string_single_quotes() {
    let s = SpanString::new("'hello'".to_string());
    let result = parse_string(&s).unwrap();
    assert!(result.as_object().contains_key("the_string"));
}

#[test]
fn test_parse_string_triple_quotes() {
    let s = SpanString::new("\"\"\"multi\nline\"\"\"".to_string());
    let result = parse_string(&s).unwrap();
    assert!(result.as_object().contains_key("the_string"));
}

#[test]
fn test_parse_boolean_true() {
    let s = SpanString::new("true".to_string());
    let result = parse_boolean(&s).unwrap();
    assert_eq!(result.as_object()["the_bool"], Json::Str("true".to_string()));
}

#[test]
fn test_parse_boolean_false() {
    let s = SpanString::new("false".to_string());
    let result = parse_boolean(&s).unwrap();
    assert_eq!(result.as_object()["the_bool"], Json::Str("false".to_string()));
}

#[test]
fn test_parse_null() {
    let s = SpanString::new("null".to_string());
    let result = parse_null(&s).unwrap();
    assert_eq!(result.as_object()["the_null"], Json::Str("null".to_string()));
}

// ====== Variable parsing ======

#[test]
fn test_parse_variable() {
    let s = SpanString::new("my_var".to_string());
    let result = parse_variable(&s).unwrap().unwrap();
    assert_eq!(result.as_object()["var_name"], Json::Str("my_var".to_string()));
}

#[test]
fn test_parse_variable_rejects_uppercase() {
    let s = SpanString::new("MyVar".to_string());
    assert!(parse_variable(&s).unwrap().is_none());
}

#[test]
fn test_parse_variable_rejects_x_prefix() {
    let s = SpanString::new("x_internal".to_string());
    assert!(parse_variable(&s).is_err());
}

#[test]
fn test_parse_variable_underscore_start() {
    let s = SpanString::new("_private".to_string());
    let result = parse_variable(&s).unwrap().unwrap();
    assert_eq!(result.as_object()["var_name"], Json::Str("_private".to_string()));
}

// ====== Predicate literal parsing ======

#[test]
fn test_parse_predicate_literal() {
    let s = SpanString::new("MyPredicate".to_string());
    let result = parse_predicate_literal(&s).unwrap();
    assert_eq!(result.as_object()["predicate_name"], Json::Str("MyPredicate".to_string()));
}

#[test]
fn test_parse_predicate_literal_rejects_lowercase() {
    let s = SpanString::new("myPredicate".to_string());
    assert!(parse_predicate_literal(&s).is_none());
}

#[test]
fn test_parse_predicate_literal_nil() {
    let s = SpanString::new("nil".to_string());
    let result = parse_predicate_literal(&s).unwrap();
    assert_eq!(result.as_object()["predicate_name"], Json::Str("nil".to_string()));
}

// ====== Expression parsing ======

#[test]
fn test_parse_expression_number() {
    let s = SpanString::new("42".to_string());
    let result = parse_expression(&s).unwrap();
    assert!(result.as_object().contains_key("literal"));
    assert!(result.as_object().contains_key("expression_heritage"));
}

#[test]
fn test_parse_expression_variable() {
    let s = SpanString::new("my_var".to_string());
    let result = parse_expression(&s).unwrap();
    assert!(result.as_object().contains_key("variable"));
}

#[test]
fn test_parse_expression_string() {
    let s = SpanString::new("\"hello world\"".to_string());
    let result = parse_expression(&s).unwrap();
    assert!(result.as_object().contains_key("literal"));
}

#[test]
fn test_parse_expression_call() {
    let s = SpanString::new("Foo(x)".to_string());
    let result = parse_expression(&s).unwrap();
    assert!(result.as_object().contains_key("call"));
    let call = result.as_object()["call"].as_object();
    assert_eq!(call["predicate_name"], Json::Str("Foo".to_string()));
}

#[test]
fn test_parse_expression_infix_plus() {
    let s = SpanString::new("a + b".to_string());
    let result = parse_expression(&s).unwrap();
    assert!(result.as_object().contains_key("call"));
    let call = result.as_object()["call"].as_object();
    assert_eq!(call["predicate_name"], Json::Str("+".to_string()));
}

#[test]
fn test_parse_expression_infix_multiply() {
    let s = SpanString::new("a * b".to_string());
    let result = parse_expression(&s).unwrap();
    assert!(result.as_object().contains_key("call"));
    let call = result.as_object()["call"].as_object();
    assert_eq!(call["predicate_name"], Json::Str("*".to_string()));
}

#[test]
fn test_parse_expression_list() {
    let s = SpanString::new("[1, 2, 3]".to_string());
    let result = parse_expression(&s).unwrap();
    assert!(result.as_object().contains_key("literal"));
    let lit = result.as_object()["literal"].as_object();
    assert!(lit.contains_key("the_list"));
}

#[test]
fn test_parse_expression_record() {
    let s = SpanString::new("{name: x, age: y}".to_string());
    let result = parse_expression(&s).unwrap();
    assert!(result.as_object().contains_key("record"));
}

#[test]
fn test_parse_expression_if_then_else() {
    let s = SpanString::new("if x > 0 then 1 else 0".to_string());
    let result = parse_expression(&s).unwrap();
    assert!(result.as_object().contains_key("implication"));
}

// ====== Call parsing ======

#[test]
fn test_parse_call_simple() {
    let s = SpanString::new("Foo(a, b)".to_string());
    let result = parse_call(&s, false).unwrap().unwrap();
    assert_eq!(result.as_object()["predicate_name"], Json::Str("Foo".to_string()));
    let fvs = result.as_object()["record"].as_object()["field_value"].as_array();
    assert_eq!(fvs.len(), 2);
}

#[test]
fn test_parse_call_named_args() {
    let s = SpanString::new("Foo(name: x, age: y)".to_string());
    let result = parse_call(&s, false).unwrap().unwrap();
    let fvs = result.as_object()["record"].as_object()["field_value"].as_array();
    assert_eq!(fvs.len(), 2);
    assert_eq!(fvs[0].as_object()["field"], Json::Str("name".to_string()));
    assert_eq!(fvs[1].as_object()["field"], Json::Str("age".to_string()));
}

#[test]
fn test_parse_call_imperative() {
    let s = SpanString::new("@Engine(\"duckdb\")".to_string());
    let result = parse_call(&s, false).unwrap().unwrap();
    assert_eq!(result.as_object()["predicate_name"], Json::Str("@Engine".to_string()));
}

#[test]
fn test_parse_call_empty_args() {
    let s = SpanString::new("Foo()".to_string());
    let result = parse_call(&s, false).unwrap().unwrap();
    let fvs = result.as_object()["record"].as_object()["field_value"].as_array();
    assert!(fvs.is_empty());
}

#[test]
fn test_parse_call_shorthand_named() {
    let s = SpanString::new("Foo(name:, age:)".to_string());
    let result = parse_call(&s, false).unwrap().unwrap();
    let fvs = result.as_object()["record"].as_object()["field_value"].as_array();
    assert_eq!(fvs.len(), 2);
    assert_eq!(fvs[0].as_object()["field"], Json::Str("name".to_string()));
}

// ====== Proposition parsing ======

#[test]
fn test_parse_proposition_predicate() {
    let s = SpanString::new("Foo(x)".to_string());
    let result = parse_proposition(&s).unwrap();
    assert!(result.as_object().contains_key("predicate"));
}

#[test]
fn test_parse_proposition_conjunction() {
    let s = SpanString::new("Foo(x), Bar(y)".to_string());
    let result = parse_proposition(&s).unwrap();
    assert!(result.as_object().contains_key("conjunction"));
    let conj = result.as_object()["conjunction"].as_object()["conjunct"].as_array();
    assert_eq!(conj.len(), 2);
}

#[test]
fn test_parse_proposition_disjunction() {
    let s = SpanString::new("Foo(x) | Bar(y)".to_string());
    let result = parse_proposition(&s).unwrap();
    assert!(result.as_object().contains_key("disjunction"));
}

#[test]
fn test_parse_proposition_unification() {
    let s = SpanString::new("x == 42".to_string());
    let result = parse_proposition(&s).unwrap();
    assert!(result.as_object().contains_key("unification"));
}

#[test]
fn test_parse_proposition_negation() {
    let s = SpanString::new("~Foo(x)".to_string());
    let result = parse_proposition(&s).unwrap();
    assert!(result.as_object().contains_key("predicate"));
    let pred = result.as_object()["predicate"].as_object();
    assert_eq!(pred["predicate_name"], Json::Str("IsNull".to_string()));
}

#[test]
fn test_parse_proposition_inclusion() {
    let s = SpanString::new("x in [1, 2, 3]".to_string());
    let result = parse_proposition(&s).unwrap();
    assert!(result.as_object().contains_key("inclusion"));
}

#[test]
fn test_parse_proposition_infix_comparison() {
    let s = SpanString::new("x > 10".to_string());
    let result = parse_proposition(&s).unwrap();
    assert!(result.as_object().contains_key("predicate"));
    let pred = result.as_object()["predicate"].as_object();
    assert_eq!(pred["predicate_name"], Json::Str(">".to_string()));
}

// ====== Rule parsing ======

#[test]
fn test_parse_rule_fact() {
    let s = SpanString::new("Parent(name: \"Alice\")".to_string());
    let result = parse_rule(&s).unwrap();
    assert!(result.as_object().contains_key("head"));
    assert!(!result.as_object().contains_key("body"));
    assert_eq!(
        result.as_object()["head"].as_object()["predicate_name"],
        Json::Str("Parent".to_string())
    );
}

#[test]
fn test_parse_rule_with_body() {
    let s = SpanString::new("Grandparent(x, z) :- Parent(x, y), Parent(y, z)".to_string());
    let result = parse_rule(&s).unwrap();
    assert!(result.as_object().contains_key("head"));
    assert!(result.as_object().contains_key("body"));
}

#[test]
fn test_parse_rule_distinct() {
    let s = SpanString::new("Count(type:, n? += 1) distinct :- Item(type:)".to_string());
    let result = parse_rule(&s).unwrap();
    assert_eq!(result.as_object()["distinct_denoted"], Json::Bool(true));
}

#[test]
fn test_parse_rule_imperative() {
    let s = SpanString::new("@Engine(\"duckdb\")".to_string());
    let result = parse_rule(&s).unwrap();
    assert_eq!(
        result.as_object()["head"].as_object()["predicate_name"],
        Json::Str("@Engine".to_string())
    );
}

#[test]
fn test_parse_rule_with_assignment() {
    let s = SpanString::new("Square(x) = x * x".to_string());
    let result = parse_rule(&s).unwrap();
    let fvs = result.as_object()["head"].as_object()["record"].as_object()["field_value"].as_array();
    assert!(fvs.len() >= 2);
    let last = fvs.last().unwrap().as_object();
    assert_eq!(last["field"], Json::Str("logica_value".to_string()));
}

#[test]
fn test_parse_rule_full_text_preserved() {
    let s = SpanString::new("Foo(x) :- Bar(x)".to_string());
    let result = parse_rule(&s).unwrap();
    assert!(result.as_object().contains_key("full_text"));
}

// ====== ParseFile tests ======

#[test]
fn test_parse_file_empty() {
    let result = parse_file("", None, &[]).unwrap();
    assert!(result.as_object()["rule"].as_array().is_empty());
}

#[test]
fn test_parse_file_single_fact() {
    let result = parse_file("Person(name: \"Alice\");", None, &[]).unwrap();
    let rules = result.as_object()["rule"].as_array();
    assert_eq!(rules.len(), 1);
    assert_eq!(
        rules[0].as_object()["head"].as_object()["predicate_name"],
        Json::Str("Person".to_string())
    );
}

#[test]
fn test_parse_file_multiple_facts() {
    let program = r#"
        Person(name: "Alice", age: 30);
        Person(name: "Bob", age: 25);
    "#;
    let result = parse_file(program, None, &[]).unwrap();
    assert_eq!(result.as_object()["rule"].as_array().len(), 2);
}

#[test]
fn test_parse_file_rule_with_body() {
    let program = r#"
        Parent(parent: "Alice", child: "Bob");
        Parent(parent: "Bob", child: "Carol");
        Grandparent(grandparent:, grandchild:) :-
            Parent(parent: grandparent, child: middle),
            Parent(parent: middle, child: grandchild);
    "#;
    let result = parse_file(program, None, &[]).unwrap();
    let rules = result.as_object()["rule"].as_array();
    assert_eq!(rules.len(), 3);
    assert!(rules[2].as_object().contains_key("body"));
}

#[test]
fn test_parse_file_with_comments() {
    let program = r#"
        # This is a comment
        Person(name: "Alice"); # inline comment
        /* block comment */
        Person(name: "Bob");
    "#;
    let result = parse_file(program, None, &[]).unwrap();
    assert_eq!(result.as_object()["rule"].as_array().len(), 2);
}

#[test]
fn test_parse_file_imperative() {
    let program = r#"
        @Engine("duckdb");
        Person(name: "Alice");
    "#;
    let result = parse_file(program, None, &[]).unwrap();
    let rules = result.as_object()["rule"].as_array();
    assert_eq!(rules.len(), 2);
    assert_eq!(
        rules[0].as_object()["head"].as_object()["predicate_name"],
        Json::Str("@Engine".to_string())
    );
}

#[test]
fn test_parse_file_aggregation() {
    let program = "Count(type:, n? += 1) distinct :- Item(type:);";
    let result = parse_file(program, None, &[]).unwrap();
    assert_eq!(result.as_object()["rule"].as_array().len(), 1);
}

#[test]
fn test_parse_file_disjunction_rewrite() {
    let program = "A(x) :- B(x) | C(x);";
    let result = parse_file(program, None, &[]).unwrap();
    // Disjunction should be rewritten into 2 rules
    assert_eq!(result.as_object()["rule"].as_array().len(), 2);
}

#[test]
fn test_parse_file_negation() {
    let program = "InterestingBird(x) :- Bird(x), CanSing(x), ~CanFly(x);";
    let result = parse_file(program, None, &[]).unwrap();
    assert_eq!(result.as_object()["rule"].as_array().len(), 1);
}

#[test]
fn test_parse_file_functor() {
    let program = "G := F(A: C, B: D);";
    let result = parse_file(program, None, &[]).unwrap();
    let rules = result.as_object()["rule"].as_array();
    assert_eq!(rules.len(), 1);
    assert_eq!(
        rules[0].as_object()["head"].as_object()["predicate_name"],
        Json::Str("@Make".to_string())
    );
}

#[test]
fn test_parse_file_record_literal() {
    let program = "Book(title: \"1984\", info: {author: \"Orwell\", year: 1949});";
    let result = parse_file(program, None, &[]).unwrap();
    assert_eq!(result.as_object()["rule"].as_array().len(), 1);
}

#[test]
fn test_parse_file_if_then_else() {
    let program = "Category(x) = if x > 100 then \"big\" else \"small\";";
    let result = parse_file(program, None, &[]).unwrap();
    assert_eq!(result.as_object()["rule"].as_array().len(), 1);
}

#[test]
fn test_parse_file_output_structure() {
    let result = parse_file("Foo(x: 1);", None, &[]).unwrap();
    let obj = result.as_object();
    assert!(obj.contains_key("rule"));
    assert!(obj.contains_key("imported_predicates"));
    assert!(obj.contains_key("predicates_prefix"));
    assert!(obj.contains_key("file_name"));
    assert_eq!(obj["file_name"], Json::Str("main".to_string()));
    assert_eq!(obj["predicates_prefix"], Json::Str(String::new()));
}

// ====== Error handling ======

#[test]
fn test_unmatched_paren_error() {
    assert!(parse_file("Foo(x;", None, &[]).is_err());
}

#[test]
fn test_too_many_colons_error() {
    assert!(parse_file("A(x) :- B(x) :- C(x);", None, &[]).is_err());
}

#[test]
fn test_positional_after_named_error() {
    let s = SpanString::new("Foo(name: x, y)".to_string());
    assert!(parse_call(&s, false).is_err());
}
