use crate::parser::span::SpanString;

#[test]
fn test_span_string_basic() {
    let s = SpanString::new("hello world".to_string());
    assert_eq!(s.view(), "hello world");
    assert_eq!(s.len(), 11);
    assert!(!s.is_empty());
}

#[test]
fn test_span_string_empty() {
    let s = SpanString::new(String::new());
    assert!(s.is_empty());
    assert_eq!(s.len(), 0);
}

#[test]
fn test_span_string_slice() {
    let s = SpanString::new("hello world".to_string());
    let sub = s.slice(6, 11);
    assert_eq!(sub.view(), "world");
    assert_eq!(sub.len(), 5);
}

#[test]
fn test_span_string_slice_from() {
    let s = SpanString::new("hello world".to_string());
    let sub = s.slice_from(6);
    assert_eq!(sub.view(), "world");
}

#[test]
fn test_span_string_slice_to() {
    let s = SpanString::new("hello world".to_string());
    let sub = s.slice_to(5);
    assert_eq!(sub.view(), "hello");
}

#[test]
fn test_span_string_starts_ends_with() {
    let s = SpanString::new("hello world".to_string());
    assert!(s.starts_with("hello"));
    assert!(s.ends_with("world"));
    assert!(!s.starts_with("world"));
    assert!(!s.ends_with("hello"));
}

#[test]
fn test_span_string_at() {
    let s = SpanString::new("abc".to_string());
    assert_eq!(s.at(0), b'a');
    assert_eq!(s.at(1), b'b');
    assert_eq!(s.at(2), b'c');
}

#[test]
fn test_span_string_pieces() {
    let s = SpanString::new("hello world".to_string());
    let sub = s.slice(6, 11);
    let (before, mid, after) = sub.pieces();
    assert_eq!(before, "hello ");
    assert_eq!(mid, "world");
    assert_eq!(after, "");
}

#[test]
fn test_span_string_nested_slicing() {
    let s = SpanString::new("abcdefghij".to_string());
    let sub1 = s.slice(2, 8); // "cdefgh"
    let sub2 = sub1.slice(1, 4); // "def"
    assert_eq!(sub2.view(), "def");
}
