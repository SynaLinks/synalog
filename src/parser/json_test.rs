use crate::parser::json::Json;

#[test]
fn test_json_to_string_compact() {
    let j = json_obj!("name" => "test", "value" => Json::Int(42));
    let s = j.to_string_fmt(false);
    assert!(s.contains("\"name\":\"test\""));
    assert!(s.contains("\"value\":42"));
}

#[test]
fn test_json_to_string_pretty() {
    let j = json_obj!("key" => "val");
    let s = j.to_string_fmt(true);
    assert!(s.contains('\n'));
}

#[test]
fn test_json_null() {
    assert!(Json::Null.is_null());
    assert!(!Json::Null.is_string());
}

#[test]
fn test_json_bool() {
    let j = Json::Bool(true);
    assert!(j.is_bool());
    assert_eq!(j.to_string_fmt(false), "true");
}

#[test]
fn test_json_int() {
    let j = Json::Int(42);
    assert!(j.is_int());
    assert_eq!(j.as_int(), 42);
}

#[test]
fn test_json_string() {
    let j = Json::Str("hello".to_string());
    assert!(j.is_string());
    assert_eq!(j.as_str(), "hello");
}

#[test]
fn test_json_array() {
    let j = Json::Array(vec![Json::Int(1), Json::Int(2)]);
    assert!(j.is_array());
    assert_eq!(j.as_array().len(), 2);
}

#[test]
fn test_json_object() {
    let j = json_obj!("a" => Json::Int(1));
    assert!(j.is_object());
    assert_eq!(j.as_object()["a"], Json::Int(1));
}

#[test]
fn test_json_escape_special_chars() {
    let j = Json::Str("line\nnewline".to_string());
    let s = j.to_string_fmt(false);
    assert_eq!(s, "\"line\\nnewline\"");
}

#[test]
fn test_json_nested_object() {
    let inner = json_obj!("x" => Json::Int(1));
    let outer = json_obj!("inner" => inner);
    assert!(outer.as_object()["inner"].is_object());
}
