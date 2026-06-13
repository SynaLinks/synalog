use crate::parser::span::SpanString;
use crate::parser::traverse::*;

// ====== Comment removal ======

#[test]
fn test_remove_line_comments() {
    let s = SpanString::new("a + b # this is a comment\nc + d".to_string());
    let result = remove_comments(&s).unwrap();
    assert_eq!(result, "a + b \nc + d");
}

#[test]
fn test_remove_block_comments() {
    let s = SpanString::new("a /* block comment */ + b".to_string());
    let result = remove_comments(&s).unwrap();
    assert_eq!(result, "a  + b");
}

#[test]
fn test_strings_preserved_in_comments() {
    let s = SpanString::new("x = \"hello # not a comment\"".to_string());
    let result = remove_comments(&s).unwrap();
    assert_eq!(result, "x = \"hello # not a comment\"");
}

#[test]
fn test_remove_multiple_comments() {
    let s = SpanString::new("a # c1\nb # c2\nc".to_string());
    let result = remove_comments(&s).unwrap();
    assert_eq!(result, "a \nb \nc");
}

#[test]
fn test_remove_nested_block_comment_not_supported() {
    // Logica doesn't support nested block comments; inner /* is ignored
    let s = SpanString::new("a /* outer */ b".to_string());
    let result = remove_comments(&s).unwrap();
    assert_eq!(result, "a  b");
}

// ====== Strip ======

#[test]
fn test_strip_spaces() {
    let s = SpanString::new("  hello  ".to_string());
    let stripped = strip_spaces(&s);
    assert_eq!(stripped.view(), "hello");
}

#[test]
fn test_strip_parens() {
    let s = SpanString::new("((hello))".to_string());
    let stripped = strip(&s);
    assert_eq!(stripped.view(), "hello");
}

#[test]
fn test_strip_preserves_meaningful_parens() {
    let s = SpanString::new("(a, b)".to_string());
    let stripped = strip(&s);
    assert_eq!(stripped.view(), "a, b");
}

#[test]
fn test_strip_no_change() {
    let s = SpanString::new("hello".to_string());
    let stripped = strip(&s);
    assert_eq!(stripped.view(), "hello");
}

// ====== Split ======

#[test]
fn test_split_semicolon() {
    let s = SpanString::new("a; b; c".to_string());
    let parts = split(&s, ";").unwrap();
    assert_eq!(parts.len(), 3);
    assert_eq!(parts[0].view(), "a");
    assert_eq!(parts[1].view(), "b");
    assert_eq!(parts[2].view(), "c");
}

#[test]
fn test_split_respects_parens() {
    let s = SpanString::new("F(a, b), G(c)".to_string());
    let parts = split(&s, ",").unwrap();
    assert_eq!(parts.len(), 2);
    assert_eq!(parts[0].view(), "F(a, b)");
    assert_eq!(parts[1].view(), "G(c)");
}

#[test]
fn test_split_in_two() {
    let s = SpanString::new("head :- body".to_string());
    let (head, body) = split_in_two(&s, ":-").unwrap();
    assert_eq!(head.view(), "head");
    assert_eq!(body.view(), "body");
}

#[test]
fn test_split_in_two_error() {
    let s = SpanString::new("no separator here".to_string());
    let result = split_in_two(&s, ":-");
    assert!(result.is_err());
}

#[test]
fn test_split_in_one_or_two_one() {
    let s = SpanString::new("just one".to_string());
    let result = split_in_one_or_two(&s, ":").unwrap();
    assert!(result.is_ok()); // Ok means one part
}

#[test]
fn test_split_in_one_or_two_two() {
    let s = SpanString::new("key: value".to_string());
    let result = split_in_one_or_two(&s, ":").unwrap();
    assert!(result.is_err()); // Err means two parts
}

#[test]
fn test_split_respects_strings() {
    let s = SpanString::new("a, \"b, c\", d".to_string());
    let parts = split(&s, ",").unwrap();
    assert_eq!(parts.len(), 3);
}

#[test]
fn test_split_pipe_not_double_pipe() {
    let s = SpanString::new("a || b".to_string());
    let parts = split(&s, "|").unwrap();
    // || should NOT be split as two |
    assert_eq!(parts.len(), 1);
}

#[test]
fn test_split_on_whitespace() {
    let s = SpanString::new("a  b\tc".to_string());
    let parts = split_on_whitespace(&s).unwrap();
    assert_eq!(parts.len(), 3);
    assert_eq!(parts[0].view(), "a");
    assert_eq!(parts[1].view(), "b");
    assert_eq!(parts[2].view(), "c");
}

// ====== is_whole ======

#[test]
fn test_is_whole_balanced() {
    let s = SpanString::new("a + b".to_string());
    assert!(is_whole(&s));
}

#[test]
fn test_is_whole_unbalanced() {
    let s = SpanString::new("a + (b".to_string());
    assert!(!is_whole(&s));
}

// ====== Error handling ======

#[test]
fn test_parsing_exception_show_message() {
    let s = SpanString::new("hello error world".to_string());
    let loc = s.slice(6, 11);
    let err = ParsingException::new("Something went wrong", loc);
    let msg = err.show_message();
    assert!(msg.contains("Something went wrong"));
    assert!(msg.contains("error"));
}
