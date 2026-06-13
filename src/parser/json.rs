use std::collections::BTreeMap;
use std::fmt;

pub type JsonObject = BTreeMap<String, Json>;
pub type JsonArray = Vec<Json>;

#[derive(Debug, Clone, PartialEq)]
pub enum Json {
    Null,
    Bool(bool),
    Int(i64),
    Str(String),
    Array(JsonArray),
    Object(JsonObject),
}

impl Json {
    pub fn is_null(&self) -> bool {
        matches!(self, Json::Null)
    }

    pub fn is_string(&self) -> bool {
        matches!(self, Json::Str(_))
    }

    pub fn is_int(&self) -> bool {
        matches!(self, Json::Int(_))
    }

    pub fn is_bool(&self) -> bool {
        matches!(self, Json::Bool(_))
    }

    pub fn is_array(&self) -> bool {
        matches!(self, Json::Array(_))
    }

    pub fn is_object(&self) -> bool {
        matches!(self, Json::Object(_))
    }

    pub fn as_str(&self) -> &str {
        match self {
            Json::Str(s) => s,
            _ => panic!("expected string, got {:?}", self.type_name()),
        }
    }

    pub fn as_int(&self) -> i64 {
        match self {
            Json::Int(n) => *n,
            _ => panic!("expected int, got {:?}", self.type_name()),
        }
    }

    pub fn as_array(&self) -> &JsonArray {
        match self {
            Json::Array(a) => a,
            _ => panic!("expected array, got {:?}", self.type_name()),
        }
    }

    pub fn as_array_mut(&mut self) -> &mut JsonArray {
        match self {
            Json::Array(a) => a,
            _ => panic!("expected array"),
        }
    }

    pub fn as_object(&self) -> &JsonObject {
        match self {
            Json::Object(o) => o,
            _ => panic!("expected object, got {:?}", self.type_name()),
        }
    }

    pub fn as_object_mut(&mut self) -> &mut JsonObject {
        match self {
            Json::Object(o) => o,
            _ => panic!("expected object"),
        }
    }

    fn type_name(&self) -> &'static str {
        match self {
            Json::Null => "null",
            Json::Bool(_) => "bool",
            Json::Int(_) => "int",
            Json::Str(_) => "string",
            Json::Array(_) => "array",
            Json::Object(_) => "object",
        }
    }


    fn dump(&self, out: &mut String, pretty: bool, indent: usize, depth: usize) {
        match self {
            Json::Null => out.push_str("null"),
            Json::Bool(b) => out.push_str(if *b { "true" } else { "false" }),
            Json::Int(n) => {
                use fmt::Write;
                let _ = write!(out, "{}", n);
            }
            Json::Str(s) => {
                out.push('"');
                Self::escape_into(s, out);
                out.push('"');
            }
            Json::Array(a) => {
                out.push('[');
                if !a.is_empty() {
                    if pretty { out.push('\n'); }
                    let last = a.len() - 1;
                    for (i, item) in a.iter().enumerate() {
                        Self::pad(out, pretty, (depth + 1) * indent);
                        item.dump(out, pretty, indent, depth + 1);
                        if i < last { out.push(','); }
                        if pretty { out.push('\n'); }
                    }
                    Self::pad(out, pretty, depth * indent);
                }
                out.push(']');
            }
            Json::Object(o) => {
                out.push('{');
                if !o.is_empty() {
                    if pretty { out.push('\n'); }
                    // BTreeMap already sorts keys alphabetically.
                    // For Logica compat we use priority-based ordering.
                    let mut items: Vec<_> = o.iter().collect();
                    items.sort_unstable_by(|a, b| {
                        let pa = key_priority(a.0);
                        let pb = key_priority(b.0);
                        pa.cmp(&pb).then_with(|| a.0.cmp(b.0))
                    });

                    let last = items.len() - 1;
                    for (i, (k, v)) in items.iter().enumerate() {
                        Self::pad(out, pretty, (depth + 1) * indent);
                        out.push('"');
                        // Keys are ASCII identifiers — no escaping needed.
                        out.push_str(k);
                        out.push_str("\":");
                        if pretty { out.push(' '); }
                        v.dump(out, pretty, indent, depth + 1);
                        if i < last { out.push(','); }
                        if pretty { out.push('\n'); }
                    }
                    Self::pad(out, pretty, depth * indent);
                }
                out.push('}');
            }
        }
    }

    #[inline]
    fn pad(out: &mut String, pretty: bool, spaces: usize) {
        if pretty {
            // Fast path: push spaces in chunks
            const SPACES: &str = "                                ";
            let mut remaining = spaces;
            while remaining > 0 {
                let chunk = remaining.min(SPACES.len());
                out.push_str(&SPACES[..chunk]);
                remaining -= chunk;
            }
        }
    }

    /// Escape string directly into output buffer, avoiding intermediate allocation.
    fn escape_into(s: &str, out: &mut String) {
        let bytes = s.as_bytes();
        let mut last_flush = 0;
        for (i, &b) in bytes.iter().enumerate() {
            let esc = match b {
                b'\\' => "\\\\",
                b'"' => "\\\"",
                b'\n' => "\\n",
                b'\r' => "\\r",
                b'\t' => "\\t",
                0..=0x1f => {
                    // Flush pending, then write \uXXXX
                    if last_flush < i {
                        out.push_str(&s[last_flush..i]);
                    }
                    use fmt::Write;
                    let _ = write!(out, "\\u{:04x}", b);
                    last_flush = i + 1;
                    continue;
                }
                _ => {
                    continue;
                }
            };
            if last_flush < i {
                out.push_str(&s[last_flush..i]);
            }
            out.push_str(esc);
            last_flush = i + 1;
        }
        if last_flush < bytes.len() {
            out.push_str(&s[last_flush..]);
        }
    }

    pub fn to_string_fmt(&self, pretty: bool) -> String {
        let mut out = String::with_capacity(4096);
        self.dump(&mut out, pretty, 1, 0);
        out
    }
}

impl fmt::Display for Json {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.to_string_fmt(true))
    }
}

impl From<&str> for Json {
    fn from(s: &str) -> Self {
        Json::Str(s.to_string())
    }
}

impl From<String> for Json {
    fn from(s: String) -> Self {
        Json::Str(s)
    }
}

impl From<i64> for Json {
    fn from(n: i64) -> Self {
        Json::Int(n)
    }
}

impl From<bool> for Json {
    fn from(b: bool) -> Self {
        Json::Bool(b)
    }
}

impl From<JsonArray> for Json {
    fn from(a: JsonArray) -> Self {
        Json::Array(a)
    }
}

impl From<JsonObject> for Json {
    fn from(o: JsonObject) -> Self {
        Json::Object(o)
    }
}

/// Helper to build a JsonObject from key-value pairs.
#[macro_export]
macro_rules! json_obj {
    ($($key:expr => $val:expr),* $(,)?) => {{
        let mut map = $crate::parser::JsonObject::new();
        $(
            map.insert($key.to_string(), $crate::parser::Json::from($val));
        )*
        $crate::parser::Json::Object(map)
    }};
}

fn key_priority(k: &str) -> i32 {
    match k {
        "head" => 0,
        "body" => 1,
        "full_text" => 99,
        "predicate_name" => 0,
        "record" => 1,
        "field_value" => 0,
        "field" => 0,
        "value" => 1,
        "expression" => 0,
        "literal" => 1,
        "variable" => 2,
        "predicate" => 3,
        "conjunction" => 0,
        "conjunct" => 1,
        _ => 50,
    }
}

#[cfg(test)]
#[path = "json_test.rs"]
mod json_test;