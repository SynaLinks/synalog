// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! The last check before a plan leaves the compiler: its statements write in
//! `synalog_home` only.
//!
//! Every statement of every step is read as the engine reads it (string
//! literals and comments skipped, with the engine's escapes) into the tokens
//! `synalog_verified::home::writes_in_home` decides on, proved to accept them
//! exactly when no statement is one the compiler never writes and every write
//! names a table directly in `synalog_home` (on Trino and Presto
//! `synalog_home.synalog_home`; PostgreSQL's session tables in `pg_temp`).
//!
//! The reading fails closed: a statement is one of the forms the compiler
//! writes (a query, `SET`, `CREATE`/`DROP` of a table, type, sequence or the
//! schema, `INSERT INTO`, PostgreSQL's `DO` blocks of its setup, SQLite's
//! attaching of its in-memory `synalog_home`), and anything else is refused:
//! another statement, a clause that would store a table elsewhere (`LOCATION`,
//! an `ENGINE` other than `Memory`), a write inside a query (`SELECT ...
//! INTO`, PostgreSQL's `WITH d AS (DELETE ...)`), and any text an engine
//! might read otherwise than this reader does (an unterminated literal, a
//! nested comment, MySQL's `/*!` and `--x`, a `#`, Spark's `${`).

use std::collections::HashMap;

use synalog_verified::home::{writes_in_home, DOT, FORBIDDEN, MAKE_HOME, NAME, OTHER, WRITE};

use super::home_schema;

/// A token as the engine reads it.
#[derive(Debug, Clone, PartialEq)]
enum Raw {
    /// An unquoted word: a keyword or a name, as written.
    Word(String),
    /// A quoted name, its quotes and escapes removed.
    Quoted(String),
    /// A string literal, as it reads.
    Str(String),
    Dot,
    Semi,
    Open,
    /// PostgreSQL's dollar quote (`$$`) around a `DO` block's body.
    Dollar,
    Sym(char),
    /// Text an engine may read otherwise than this reader.
    Bad,
}

fn backslash_strings(engine: &str) -> bool {
    matches!(engine, "databricks" | "bigquery" | "clickhouse")
}

fn double_quoted_strings(engine: &str) -> bool {
    matches!(engine, "databricks" | "bigquery")
}

/// Engines where `#` starts a comment.
fn hash_comments(engine: &str) -> bool {
    matches!(engine, "mysql" | "clickhouse" | "bigquery")
}

fn is_word_char(c: char) -> bool {
    c.is_alphanumeric() || c == '_' || c == '$'
}

/// The quoted text from `chars[start]` (an opening `quote`) to its closing
/// quote: its content and the index after it, or None when it never closes.
fn quoted(chars: &[char], start: usize, quote: char, backslash: bool) -> Option<(String, usize)> {
    let mut out = String::new();
    let mut i = start + 1;
    while i < chars.len() {
        let c = chars[i];
        if backslash && c == '\\' {
            let next = *chars.get(i + 1)?;
            out.push(next);
            i += 2;
        } else if c == quote {
            if chars.get(i + 1) == Some(&quote) {
                out.push(quote);
                i += 2;
            } else {
                return Some((out, i + 1));
            }
        } else {
            out.push(c);
            i += 1;
        }
    }
    None
}

fn lex(sql: &str, engine: &str) -> Vec<Raw> {
    let chars: Vec<char> = sql.chars().collect();
    let mut out = Vec::new();
    let mut i = 0;
    while i < chars.len() {
        let c = chars[i];
        let next = chars.get(i + 1).copied();
        if c.is_whitespace() {
            i += 1;
        } else if c == '-' && next == Some('-') {
            // MySQL reads `--` as a comment only before a space.
            if engine == "mysql" && !chars.get(i + 2).is_none_or(|c| c.is_whitespace() || c.is_control()) {
                out.push(Raw::Bad);
                return out;
            }
            while i < chars.len() && chars[i] != '\n' {
                i += 1;
            }
        } else if c == '/' && next == Some('*') {
            // MySQL runs what `/*!` holds; PostgreSQL nests comments.
            if chars.get(i + 2) == Some(&'!') {
                out.push(Raw::Bad);
                return out;
            }
            let mut j = i + 2;
            loop {
                if j + 1 >= chars.len() || (chars[j] == '/' && chars[j + 1] == '*') {
                    out.push(Raw::Bad);
                    return out;
                }
                if chars[j] == '*' && chars[j + 1] == '/' {
                    break;
                }
                j += 1;
            }
            i = j + 2;
        } else if c == '#' && hash_comments(engine) {
            out.push(Raw::Bad);
            return out;
        } else if c == '\'' || (c == '"' && double_quoted_strings(engine)) {
            // BigQuery's and Spark's triple-quoted and raw strings read
            // otherwise: not something the compiler writes.
            let triple = chars.get(i + 1) == Some(&c) && chars.get(i + 2) == Some(&c);
            let raw_prefix = double_quoted_strings(engine)
                && matches!(out.last(), Some(Raw::Word(w)) if w.eq_ignore_ascii_case("r") || w.eq_ignore_ascii_case("b") || w.eq_ignore_ascii_case("rb") || w.eq_ignore_ascii_case("br"))
                && i > 0
                && is_word_char(chars[i - 1]);
            if (triple && double_quoted_strings(engine)) || raw_prefix {
                out.push(Raw::Bad);
                return out;
            }
            // PostgreSQL's `E'...'` takes backslash escapes.
            let e_string = engine == "psql"
                && i > 0
                && matches!(out.last(), Some(Raw::Word(w)) if w.eq_ignore_ascii_case("e"))
                && is_word_char(chars[i - 1]);
            if e_string {
                out.pop();
            }
            match quoted(&chars, i, c, backslash_strings(engine) || e_string) {
                Some((text, end)) => {
                    out.push(Raw::Str(text));
                    i = end;
                }
                None => {
                    out.push(Raw::Bad);
                    return out;
                }
            }
        } else if c == '"' || c == '`' {
            let backslash = matches!(engine, "clickhouse") || (c == '`' && engine == "bigquery");
            match quoted(&chars, i, c, backslash) {
                Some((text, end)) => {
                    out.push(Raw::Quoted(text));
                    i = end;
                }
                None => {
                    out.push(Raw::Bad);
                    return out;
                }
            }
        } else if c == '$' && engine == "databricks" && next == Some('{') {
            out.push(Raw::Bad);
            return out;
        } else if c == '$' && engine == "psql" && next == Some('$') {
            out.push(Raw::Dollar);
            i += 2;
        } else if is_word_char(c) {
            let start = i;
            while i < chars.len() && is_word_char(chars[i]) {
                i += 1;
            }
            out.push(Raw::Word(chars[start..i].iter().collect()));
        } else {
            out.push(match c {
                '.' => Raw::Dot,
                ';' => Raw::Semi,
                '(' => Raw::Open,
                _ => Raw::Sym(c),
            });
            i += 1;
        }
    }
    out
}

/// Reads one script's statements into `synalog_verified::home`'s tokens.
struct Reader<'a> {
    engine: &'a str,
    names: HashMap<String, u64>,
    tokens: Vec<(u8, u64)>,
}

fn is_word(raw: Option<&Raw>, word: &str) -> bool {
    matches!(raw, Some(Raw::Word(w)) if w.eq_ignore_ascii_case(word))
}

fn word_of(raw: Option<&Raw>) -> Option<String> {
    match raw {
        Some(Raw::Word(w)) => Some(w.to_ascii_lowercase()),
        _ => None,
    }
}

/// Words that write, refused inside a query: `SELECT ... INTO`, a
/// data-modifying `WITH d AS (DELETE ...)`.
const WRITES_IN_A_QUERY: &[&str] = &["insert", "update", "delete", "merge", "into", "copy", "upsert", "replace"];

/// Statements of a PostgreSQL `DO` block the compiler never writes there.
const NOT_IN_A_BLOCK: &[&str] = &[
    "insert", "update", "delete", "merge", "into", "alter", "execute", "perform", "call", "copy",
    "grant", "revoke", "truncate", "comment", "rename", "lock", "set", "reset",
];

impl<'a> Reader<'a> {
    fn new(engine: &'a str) -> Self {
        Reader { engine, names: HashMap::new(), tokens: Vec::new() }
    }

    fn id(&mut self, name: &str) -> u64 {
        let next = self.names.len() as u64;
        *self.names.entry(name.to_string()).or_insert(next)
    }

    fn push(&mut self, kind: u8) {
        self.tokens.push((kind, 0));
    }

    /// One token as it is: a name, a dot, or anything else.
    fn plain(&mut self, raw: &Raw) {
        match raw {
            Raw::Word(w) | Raw::Quoted(w) => {
                let id = self.id(w);
                self.tokens.push((NAME, id));
            }
            Raw::Dot => self.push(DOT),
            Raw::Bad => self.push(FORBIDDEN),
            _ => self.push(OTHER),
        }
    }

    /// The dotted name at `s[i..]`, after a `verb` token: the index after it.
    fn target(&mut self, verb: u8, s: &[Raw], mut i: usize) -> usize {
        self.push(verb);
        loop {
            match s.get(i) {
                Some(raw @ (Raw::Word(_) | Raw::Quoted(_))) => {
                    self.plain(raw);
                    i += 1;
                    if matches!(s.get(i), Some(Raw::Dot)) {
                        self.push(DOT);
                        i += 1;
                    } else {
                        return i;
                    }
                }
                // No name, or a dot before none: the target is what was read.
                _ => return i,
            }
        }
    }

    /// A query from `s[i..]` to the end of the statement: read, any write in
    /// it refused.
    fn query(&mut self, s: &[Raw], i: usize) {
        for (k, raw) in s.iter().enumerate().skip(i) {
            let after_dot = k > 0 && matches!(s[k - 1], Raw::Dot);
            let before_open = matches!(s.get(k + 1), Some(Raw::Open));
            let writes = word_of(Some(raw)).is_some_and(|w| WRITES_IN_A_QUERY.contains(&w.as_str()));
            // A word after a dot is a column; one before `(` a function
            // (`REPLACE(s, 'a', 'b')`). A write in a query follows `(` or a
            // query's own keyword, never `AS`: `AS update` is a name.
            let named = k > 0 && is_word(s.get(k - 1), "as");
            if writes && !after_dot && !before_open && !named {
                self.push(FORBIDDEN);
            } else {
                self.plain(raw);
            }
        }
    }

    /// Words from `s[i..]` that must all be among `allowed`, to the end.
    fn only(&mut self, s: &[Raw], i: usize, allowed: &[&str]) {
        for raw in &s[i..] {
            match raw {
                Raw::Word(w) if allowed.contains(&w.to_ascii_lowercase().as_str()) => self.push(OTHER),
                Raw::Sym('=') => self.push(OTHER),
                _ => self.push(FORBIDDEN),
            }
        }
    }

    /// `CREATE ...` from `s[i..]` (after `CREATE`).
    fn create(&mut self, s: &[Raw], mut i: usize) {
        if is_word(s.get(i), "or") && is_word(s.get(i + 1), "replace") {
            i += 2;
        }
        if is_word(s.get(i), "temp") || is_word(s.get(i), "temporary") {
            i += 1;
        }
        let kind = word_of(s.get(i)).unwrap_or_default();
        i += 1;
        if is_word(s.get(i), "if") && is_word(s.get(i + 1), "not") && is_word(s.get(i + 2), "exists") {
            i += 3;
        }
        match kind.as_str() {
            "schema" | "database" => {
                let end = self.target(MAKE_HOME, s, i);
                // MySQL's collation for it.
                self.only(s, end, &["default", "collate", "character", "set", "charset", "utf8mb4_0900_bin", "utf8mb4"]);
            }
            "table" => {
                let mut end = self.target(WRITE, s, i);
                // ClickHouse keeps the table in memory, nowhere else.
                if self.engine == "clickhouse"
                    && is_word(s.get(end), "engine")
                    && matches!(s.get(end + 1), Some(Raw::Sym('=')))
                    && is_word(s.get(end + 2), "memory")
                {
                    for _ in 0..3 {
                        self.push(OTHER);
                    }
                    end += 3;
                }
                if is_word(s.get(end), "as") {
                    self.push(OTHER);
                    self.query(s, end + 1);
                } else {
                    self.only(s, end, &[]);
                }
            }
            "type" => {
                let end = self.target(WRITE, s, i);
                if is_word(s.get(end), "as") {
                    self.push(OTHER);
                    self.query(s, end + 1);
                } else {
                    self.only(s, end, &[]);
                }
            }
            "sequence" => {
                let end = self.target(WRITE, s, i);
                self.only(s, end, &[]);
            }
            _ => self.push(FORBIDDEN),
        }
    }

    /// `DROP ...` from `s[i..]` (after `DROP`).
    fn drop(&mut self, s: &[Raw], mut i: usize) {
        let kind = word_of(s.get(i)).unwrap_or_default();
        i += 1;
        if is_word(s.get(i), "if") && is_word(s.get(i + 1), "exists") {
            i += 2;
        }
        if matches!(kind.as_str(), "table" | "type" | "sequence") {
            let end = self.target(WRITE, s, i);
            self.only(s, end, &["cascade"]);
        } else {
            self.push(FORBIDDEN);
        }
    }

    /// A PostgreSQL `DO $$ ... $$` block of the compiler's setup: its own
    /// statements read as the others are; no other write.
    fn block(&mut self, s: &[Raw], i: usize) {
        if !matches!(s.get(i), Some(Raw::Dollar)) || !matches!(s.last(), Some(Raw::Dollar)) || s.len() < i + 2 {
            self.push(FORBIDDEN);
            return;
        }
        let body = &s[i + 1..s.len() - 1];
        if body.iter().any(|r| matches!(r, Raw::Dollar)) {
            self.push(FORBIDDEN);
            return;
        }
        for part in body.split(|r| matches!(r, Raw::Semi)) {
            let mut k = 0;
            while k < part.len() {
                let after_dot = k > 0 && matches!(part[k - 1], Raw::Dot);
                match word_of(part.get(k)) {
                    Some(w) if !after_dot && w == "create" => {
                        self.create(part, k + 1);
                        k = part.len();
                    }
                    Some(w) if !after_dot && w == "drop" => {
                        self.drop(part, k + 1);
                        k = part.len();
                    }
                    Some(w) if !after_dot && NOT_IN_A_BLOCK.contains(&w.as_str()) => {
                        self.push(FORBIDDEN);
                        k += 1;
                    }
                    _ => {
                        self.plain(&part[k]);
                        k += 1;
                    }
                }
            }
            self.push(OTHER);
        }
    }

    /// One statement.
    fn statement(&mut self, s: &[Raw]) {
        let Some(first) = s.first() else { return };
        if matches!(first, Raw::Open) {
            return self.query(s, 0);
        }
        match word_of(Some(first)).as_deref() {
            Some("select" | "with" | "values") => self.query(s, 0),
            Some("create") => self.create(s, 1),
            Some("drop") => self.drop(s, 1),
            Some("insert") if is_word(s.get(1), "into") => {
                let end = self.target(WRITE, s, 2);
                self.query(s, end);
            }
            // A session setting; never whose role or rights.
            Some("set") => {
                let refused = ["role", "authorization", "password", "global", "persist", "persist_only"];
                if s.iter().skip(1).any(|r| word_of(Some(r)).is_some_and(|w| refused.contains(&w.as_str()))) {
                    self.push(FORBIDDEN);
                } else {
                    s.iter().for_each(|r| self.plain(r));
                }
            }
            Some("do") if self.engine == "psql" => self.block(s, 1),
            // SQLite's in-memory database for synalog's tables, and no other.
            Some("attach") if self.engine == "sqlite" => {
                let rest: Vec<&Raw> = s.iter().skip(1).filter(|r| !is_word(Some(r), "database")).collect();
                let memory = matches!(rest.as_slice(), [Raw::Str(path), as_, Raw::Word(name)]
                    if path == ":memory:" && is_word(Some(as_), "as") && name == home_schema());
                self.push(if memory { OTHER } else { FORBIDDEN });
            }
            _ => self.push(FORBIDDEN),
        }
    }

    /// The statements of `sql`.
    fn script(&mut self, sql: &str) {
        let raws = lex(sql, self.engine);
        let (parts, unclosed) = statements(&raws);
        for part in parts {
            self.statement(part);
            self.push(OTHER);
        }
        if unclosed {
            self.push(FORBIDDEN);
        }
    }
}

/// The statements of a script: split at each `;` outside a `DO` block, and
/// whether a block is left open.
fn statements(raws: &[Raw]) -> (Vec<&[Raw]>, bool) {
    let mut parts = Vec::new();
    let mut start = 0;
    let mut in_block = false;
    for (k, raw) in raws.iter().enumerate() {
        match raw {
            Raw::Dollar => in_block = !in_block,
            Raw::Semi if !in_block => {
                parts.push(&raws[start..k]);
                start = k + 1;
            }
            _ => {}
        }
    }
    parts.push(&raws[start..]);
    (parts, in_block)
}

/// Where synalog's tables are on `engine`, and its session's own temporary
/// schema, as `writes_in_home` takes them.
fn home_of(reader: &mut Reader) -> (Vec<u64>, Option<u64>) {
    let home = home_schema();
    let parts = if matches!(reader.engine, "trino" | "presto") { vec![home, home] } else { vec![home] };
    let ids = parts.iter().map(|p| reader.id(p)).collect();
    let scratch = (reader.engine == "psql").then(|| reader.id("pg_temp"));
    (ids, scratch)
}

/// Whether every statement of `scripts` writes in synalog_home only, as
/// `engine` reads it.
pub fn writes_only_in_home<'s>(scripts: impl IntoIterator<Item = &'s str>, engine: &str) -> bool {
    let mut reader = Reader::new(engine);
    let (home, scratch) = home_of(&mut reader);
    for sql in scripts {
        reader.script(sql);
        reader.push(OTHER);
    }
    writes_in_home(&reader.tokens, &home, scratch)
}

/// The first statement of `sql` that writes outside synalog_home, as the
/// reader saw it, for the error that refuses it.
pub fn first_outside(sql: &str, engine: &str) -> Option<String> {
    let raws = lex(sql, engine);
    let (parts, unclosed) = statements(&raws);
    for part in parts {
        let mut reader = Reader::new(engine);
        let (home, scratch) = home_of(&mut reader);
        reader.statement(part);
        if !writes_in_home(&reader.tokens, &home, scratch) {
            let text: Vec<String> = part
                .iter()
                .map(|raw| match raw {
                    Raw::Word(w) => w.clone(),
                    Raw::Quoted(w) => format!("<{w}>"),
                    Raw::Str(_) => "'…'".to_string(),
                    Raw::Dot => ".".to_string(),
                    Raw::Open => "(".to_string(),
                    Raw::Dollar => "$$".to_string(),
                    Raw::Sym(c) => c.to_string(),
                    Raw::Semi => ";".to_string(),
                    Raw::Bad => "…".to_string(),
                })
                .collect();
            return Some(text.join(" ").replace(" . ", ".").chars().take(160).collect());
        }
    }
    unclosed.then(|| "an unclosed $$ block".to_string())
}

#[cfg(test)]
#[path = "home_guard_test.rs"]
mod home_guard_test;
