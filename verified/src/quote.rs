// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Text written into SQL: string literals and quoted identifiers.
//!
//! A program's text (a string, a column name) reaches the SQL quoted. Each
//! quoting here comes with a lexer for it, as the engine reads it, and Verus
//! proves that the lexer, started after the opening quote, reads back exactly
//! the text and stops at the closing quote: whatever SQL follows, nothing of
//! the text is ever read as SQL.
//!
//!   * [`doubled`]: a quote inside doubled (`'it''s'`, `"a""b"`, `` `a``b` ``);
//!   * [`backslashed`]: backslash escapes (BigQuery, Spark): no quote of the
//!     literal inside it at all, so neither does a splitter that knows no
//!     escapes see it end early; and for Spark no `$`, which it substitutes
//!     (`${var}`) before it reads a statement;
//!   * [`postgres`]: PostgreSQL's literal, read back the same whether the
//!     server reads backslashes as escapes (`standard_conforming_strings`) or
//!     not.

use vstd::prelude::*;

verus! {

// ---------------------------------------------------------------------------
// Encoding, character by character
// ---------------------------------------------------------------------------

/// How a quoting writes a character.
pub enum Style {
    /// Quoted by `q`, a quote inside doubled.
    Doubled(char),
    /// Quoted by `d` with backslash escapes: a backslash doubled, the quote
    /// `\u0022` (with `quote_as_code`, `d` being `"`) or escaped, and with
    /// `dollar` a dollar `\u0024`.
    Backslashed(char, bool, bool),
    /// PostgreSQL's `E'...'`: a quote doubled, a backslash too.
    Postgres,
}

pub open spec fn piece(style: Style, c: char) -> Seq<char> {
    match style {
        Style::Doubled(q) => if c == q { seq![q, q] } else { seq![c] },
        Style::Backslashed(d, quote_as_code, dollar) => {
            if c == '\\' {
                seq!['\\', '\\']
            } else if c == d {
                if quote_as_code { seq!['\\', 'u', '0', '0', '2', '2'] } else { seq!['\\', d] }
            } else if dollar && c == '$' {
                seq!['\\', 'u', '0', '0', '2', '4']
            } else {
                seq![c]
            }
        },
        Style::Postgres => if c == '\'' { seq!['\'', '\''] } else if c == '\\' { seq!['\\', '\\'] } else { seq![c] },
    }
}

/// `s`, each character written as `style` writes it.
pub open spec fn encode(s: Seq<char>, style: Style) -> Seq<char>
    decreases s.len(),
{
    if s.len() == 0 {
        Seq::empty()
    } else {
        piece(style, s[0]) + encode(s.drop_first(), style)
    }
}

proof fn lemma_encode_concat(a: Seq<char>, b: Seq<char>, style: Style)
    ensures encode(a + b, style) == encode(a, style) + encode(b, style),
    decreases a.len(),
{
    if a.len() == 0 {
        assert(a + b =~= b);
    } else {
        assert((a + b).drop_first() =~= a.drop_first() + b);
        lemma_encode_concat(a.drop_first(), b, style);
        assert(piece(style, a[0]) + (encode(a.drop_first(), style) + encode(b, style))
            =~= (piece(style, a[0]) + encode(a.drop_first(), style)) + encode(b, style));
    }
}

/// Encoding one more character appends its piece.
proof fn lemma_encode_step(s: Seq<char>, i: int, style: Style)
    requires 0 <= i < s.len(),
    ensures encode(s.take(i + 1), style) == encode(s.take(i), style) + piece(style, s[i]),
{
    assert(s.take(i + 1) =~= s.take(i) + seq![s[i]]);
    lemma_encode_concat(s.take(i), seq![s[i]], style);
    let one = seq![s[i]];
    assert(one.drop_first() =~= Seq::<char>::empty());
    assert(encode(one.drop_first(), style) == Seq::<char>::empty());
    assert(piece(style, s[i]) + Seq::<char>::empty() =~= piece(style, s[i]));
}

proof fn lemma_take_all(s: Seq<char>)
    ensures s.take(s.len() as int) == s,
{
    assert(s.take(s.len() as int) =~= s);
}

/// Dropping a piece of `n` characters from the front.
proof fn lemma_skip(p: Seq<char>, x: Seq<char>)
    ensures (p + x).subrange(p.len() as int, (p + x).len() as int) == x,
{
    assert((p + x).subrange(p.len() as int, (p + x).len() as int) =~= x);
}

// ---------------------------------------------------------------------------
// A quote inside doubled
// ---------------------------------------------------------------------------

/// The lexer of a literal quoted by `q`, a quote inside doubled, from after
/// its opening quote: what it reads, and how many characters, the closing
/// quote included.
pub open spec fn lex_doubled(t: Seq<char>, q: char) -> Option<(Seq<char>, int)>
    decreases t.len(),
{
    if t.len() == 0 {
        None
    } else if t[0] == q {
        if t.len() >= 2 && t[1] == q {
            match lex_doubled(t.subrange(2, t.len() as int), q) {
                Some((v, n)) => Some((seq![q] + v, n + 2)),
                None => None,
            }
        } else {
            Some((Seq::empty(), 1))
        }
    } else {
        match lex_doubled(t.drop_first(), q) {
            Some((v, n)) => Some((seq![t[0]] + v, n + 1)),
            None => None,
        }
    }
}

proof fn lemma_lex_doubled(s: Seq<char>, q: char, rest: Seq<char>)
    requires rest.len() == 0 || rest[0] != q,
    ensures
        lex_doubled(encode(s, Style::Doubled(q)) + seq![q] + rest, q)
            == Some((s, encode(s, Style::Doubled(q)).len() + 1 as int)),
    decreases s.len(),
{
    let e = encode(s, Style::Doubled(q));
    let t = e + seq![q] + rest;
    if s.len() == 0 {
        assert(t =~= seq![q] + rest);
        assert(t.len() == 1 || t[1] != q);
    } else {
        let tail = encode(s.drop_first(), Style::Doubled(q)) + seq![q] + rest;
        lemma_lex_doubled(s.drop_first(), q, rest);
        let p = piece(Style::Doubled(q), s[0]);
        assert(t =~= p + tail);
        lemma_skip(p, tail);
        if s[0] == q {
            assert(t[0] == q && t[1] == q);
        } else {
            assert(t.drop_first() =~= tail);
        }
        assert(seq![s[0]] + s.drop_first() =~= s);
    }
}

/// `s` quoted by `q`, a quote inside doubled.
pub fn doubled(s: &Vec<char>, q: char) -> (out: Vec<char>)
    ensures
        out@ == seq![q] + encode(s@, Style::Doubled(q)) + seq![q],
        forall|rest: Seq<char>| (rest.len() == 0 || rest[0] != q)
            ==> #[trigger] lex_doubled(out@.drop_first() + rest, q) == Some((s@, out@.len() - 1 as int)),
{
    let mut out: Vec<char> = Vec::new();
    out.push(q);
    let mut i: usize = 0;
    while i < s.len()
        invariant
            i <= s.len(),
            out@ == seq![q] + encode(s@.take(i as int), Style::Doubled(q)),
        decreases s.len() - i,
    {
        let c = s[i];
        proof {
            lemma_encode_step(s@, i as int, Style::Doubled(q));
        }
        if c == q {
            out.push(q);
            out.push(q);
        } else {
            out.push(c);
        }
        assert(out@ =~= seq![q] + encode(s@.take(i as int + 1), Style::Doubled(q)));
        i += 1;
    }
    out.push(q);
    proof {
        lemma_take_all(s@);
        let e = encode(s@, Style::Doubled(q));
        assert forall|rest: Seq<char>| (rest.len() == 0 || rest[0] != q)
            implies #[trigger] lex_doubled(out@.drop_first() + rest, q) == Some((s@, out@.len() - 1 as int)) by {
            assert(out@.drop_first() + rest =~= e + seq![q] + rest);
            lemma_lex_doubled(s@, q, rest);
        }
    }
    out
}

// ---------------------------------------------------------------------------
// Backslash escapes
// ---------------------------------------------------------------------------

/// The lexer of a backslashed literal quoted by `d` (BigQuery, Spark), from
/// after its opening quote. Escapes other than these, which nothing here
/// writes, are left unread.
pub open spec fn lex_backslashed(t: Seq<char>, d: char) -> Option<(Seq<char>, int)>
    decreases t.len(),
{
    if t.len() == 0 {
        None
    } else if t[0] == d {
        Some((Seq::empty(), 1))
    } else if t[0] == '\\' {
        if t.len() >= 2 && (t[1] == '\\' || t[1] == '"' || t[1] == '\'' || t[1] == '`') {
            match lex_backslashed(t.subrange(2, t.len() as int), d) {
                Some((v, n)) => Some((seq![t[1]] + v, n + 2)),
                None => None,
            }
        } else if t.len() >= 6 && t[1] == 'u' && t[2] == '0' && t[3] == '0' && t[4] == '2' && (t[5] == '2' || t[5] == '4') {
            match lex_backslashed(t.subrange(6, t.len() as int), d) {
                Some((v, n)) => Some((seq![if t[5] == '2' { '"' } else { '$' }] + v, n + 6)),
                None => None,
            }
        } else {
            None
        }
    } else {
        match lex_backslashed(t.drop_first(), d) {
            Some((v, n)) => Some((seq![t[0]] + v, n + 1)),
            None => None,
        }
    }
}

pub open spec fn backslash_quote(d: char, quote_as_code: bool) -> bool {
    (d == '"' || d == '`') && (quote_as_code ==> d == '"')
}

proof fn lemma_lex_backslashed(s: Seq<char>, d: char, quote_as_code: bool, dollar: bool, rest: Seq<char>)
    requires backslash_quote(d, quote_as_code),
    ensures
        lex_backslashed(encode(s, Style::Backslashed(d, quote_as_code, dollar)) + seq![d] + rest, d)
            == Some((s, encode(s, Style::Backslashed(d, quote_as_code, dollar)).len() + 1 as int)),
    decreases s.len(),
{
    let style = Style::Backslashed(d, quote_as_code, dollar);
    let e = encode(s, style);
    let t = e + seq![d] + rest;
    if s.len() == 0 {
        assert(t =~= seq![d] + rest);
    } else {
        let tail = encode(s.drop_first(), style) + seq![d] + rest;
        lemma_lex_backslashed(s.drop_first(), d, quote_as_code, dollar, rest);
        let p = piece(style, s[0]);
        assert(t =~= p + tail);
        lemma_skip(p, tail);
        if p.len() == 1 {
            assert(t.drop_first() =~= tail);
        }
        assert(seq![s[0]] + s.drop_first() =~= s);
    }
}

/// No character of the encoding is `x`.
pub open spec fn free_of(t: Seq<char>, x: char) -> bool {
    forall|i: int| 0 <= i < t.len() ==> #[trigger] t[i] != x
}

proof fn lemma_free_of(s: Seq<char>, style: Style, x: char)
    requires forall|i: int| 0 <= i < s.len() ==> free_of(piece(style, #[trigger] s[i]), x),
    ensures free_of(encode(s, style), x),
    decreases s.len(),
{
    if s.len() > 0 {
        assert forall|i: int| 0 <= i < s.len() - 1 implies free_of(piece(style, #[trigger] s.drop_first()[i]), x) by {
            assert(s.drop_first()[i] == s[i + 1]);
        }
        lemma_free_of(s.drop_first(), style, x);
        assert(free_of(piece(style, s[0]), x));
        let e = encode(s, style);
        let p = piece(style, s[0]);
        assert forall|i: int| 0 <= i < e.len() implies #[trigger] e[i] != x by {
            if i >= p.len() {
                assert(e[i] == encode(s.drop_first(), style)[i - p.len()]);
            }
        }
    }
}

/// `s` quoted by `d` with backslash escapes.
pub fn backslashed(s: &Vec<char>, d: char, quote_as_code: bool, dollar: bool) -> (out: Vec<char>)
    requires backslash_quote(d, quote_as_code),
    ensures
        out@ == seq![d] + encode(s@, Style::Backslashed(d, quote_as_code, dollar)) + seq![d],
        forall|rest: Seq<char>| #[trigger] lex_backslashed(out@.drop_first() + rest, d) == Some((s@, out@.len() - 1 as int)),
        quote_as_code ==> free_of(encode(s@, Style::Backslashed(d, quote_as_code, dollar)), d),
        dollar ==> free_of(out@, '$'),
{
    let ghost style = Style::Backslashed(d, quote_as_code, dollar);
    let mut out: Vec<char> = Vec::new();
    out.push(d);
    let mut i: usize = 0;
    while i < s.len()
        invariant
            i <= s.len(),
            style == Style::Backslashed(d, quote_as_code, dollar),
            out@ == seq![d] + encode(s@.take(i as int), style),
        decreases s.len() - i,
    {
        let c = s[i];
        proof {
            lemma_encode_step(s@, i as int, style);
        }
        if c == '\\' {
            out.push('\\');
            out.push('\\');
        } else if c == d {
            out.push('\\');
            if quote_as_code {
                out.push('u');
                out.push('0');
                out.push('0');
                out.push('2');
                out.push('2');
            } else {
                out.push(d);
            }
        } else if dollar && c == '$' {
            out.push('\\');
            out.push('u');
            out.push('0');
            out.push('0');
            out.push('2');
            out.push('4');
        } else {
            out.push(c);
        }
        assert(out@ =~= seq![d] + encode(s@.take(i as int + 1), style));
        i += 1;
    }
    out.push(d);
    proof {
        lemma_take_all(s@);
        let e = encode(s@, style);
        assert forall|rest: Seq<char>| #[trigger] lex_backslashed(out@.drop_first() + rest, d) == Some((s@, out@.len() - 1 as int)) by {
            assert(out@.drop_first() + rest =~= e + seq![d] + rest);
            lemma_lex_backslashed(s@, d, quote_as_code, dollar, rest);
        }
        if quote_as_code {
            assert forall|i: int| 0 <= i < s@.len() implies free_of(piece(style, #[trigger] s@[i]), d) by {
                let p = piece(style, s@[i]);
                assert forall|j: int| 0 <= j < p.len() implies #[trigger] p[j] != d by {}
            }
            lemma_free_of(s@, style, d);
        }
        if dollar {
            assert forall|i: int| 0 <= i < s@.len() implies free_of(piece(style, #[trigger] s@[i]), '$') by {
                let p = piece(style, s@[i]);
                assert forall|j: int| 0 <= j < p.len() implies #[trigger] p[j] != '$' by {}
            }
            lemma_free_of(s@, style, '$');
            assert forall|i: int| 0 <= i < out@.len() implies #[trigger] out@[i] != '$' by {
                if 0 < i < out@.len() - 1 {
                    assert(out@[i] == e[i - 1]);
                }
            }
        }
    }
    out
}

// ---------------------------------------------------------------------------
// PostgreSQL
// ---------------------------------------------------------------------------

/// PostgreSQL's lexer of `E'...'`, and of `'...'` when it reads backslashes
/// as escapes (`standard_conforming_strings` off), from after the opening
/// quote. With it on, `'...'` is read by `lex_doubled`.
pub open spec fn lex_escape_string(t: Seq<char>) -> Option<(Seq<char>, int)>
    decreases t.len(),
{
    if t.len() == 0 {
        None
    } else if t[0] == '\'' {
        if t.len() >= 2 && t[1] == '\'' {
            match lex_escape_string(t.subrange(2, t.len() as int)) {
                Some((v, n)) => Some((seq!['\''] + v, n + 2)),
                None => None,
            }
        } else {
            Some((Seq::empty(), 1))
        }
    } else if t[0] == '\\' {
        if t.len() >= 2 && (t[1] == '\\' || t[1] == '\'') {
            match lex_escape_string(t.subrange(2, t.len() as int)) {
                Some((v, n)) => Some((seq![t[1]] + v, n + 2)),
                None => None,
            }
        } else {
            None
        }
    } else {
        match lex_escape_string(t.drop_first()) {
            Some((v, n)) => Some((seq![t[0]] + v, n + 1)),
            None => None,
        }
    }
}

proof fn lemma_lex_escape_string(s: Seq<char>, rest: Seq<char>)
    requires rest.len() == 0 || rest[0] != '\'',
    ensures
        lex_escape_string(encode(s, Style::Postgres) + seq!['\''] + rest)
            == Some((s, encode(s, Style::Postgres).len() + 1 as int)),
    decreases s.len(),
{
    let e = encode(s, Style::Postgres);
    let t = e + seq!['\''] + rest;
    if s.len() == 0 {
        assert(t =~= seq!['\''] + rest);
        assert(t.len() == 1 || t[1] != '\'');
    } else {
        let tail = encode(s.drop_first(), Style::Postgres) + seq!['\''] + rest;
        lemma_lex_escape_string(s.drop_first(), rest);
        let p = piece(Style::Postgres, s[0]);
        assert(t =~= p + tail);
        lemma_skip(p, tail);
        if p.len() == 1 {
            assert(t.drop_first() =~= tail);
        }
        assert(seq![s[0]] + s.drop_first() =~= s);
    }
}

/// `s` as a PostgreSQL string literal: `'...'`, or `E'...'` when it has a
/// backslash, which then reads it the same whatever the server's setting.
pub fn postgres(s: &Vec<char>) -> (out: Vec<char>)
    ensures
        // `E'...'`, read by the escape string lexer.
        out@[0] == 'E' ==> {
            &&& out@[1] == '\''
            &&& forall|rest: Seq<char>| (rest.len() == 0 || rest[0] != '\'')
                ==> #[trigger] lex_escape_string(out@.subrange(2, out@.len() as int) + rest) == Some((s@, out@.len() - 2 as int))
        },
        // `'...'`, read alike by both lexers.
        out@[0] != 'E' ==> {
            &&& out@[0] == '\''
            &&& forall|rest: Seq<char>| (rest.len() == 0 || rest[0] != '\'')
                ==> #[trigger] lex_escape_string(out@.drop_first() + rest) == Some((s@, out@.len() - 1 as int))
            &&& forall|rest: Seq<char>| (rest.len() == 0 || rest[0] != '\'')
                ==> #[trigger] lex_doubled(out@.drop_first() + rest, '\'') == Some((s@, out@.len() - 1 as int))
        },
{
    let mut backslash = false;
    let mut i: usize = 0;
    while i < s.len()
        invariant
            i <= s.len(),
            !backslash ==> forall|j: int| 0 <= j < i ==> #[trigger] s@[j] != '\\',
        decreases s.len() - i,
    {
        if s[i] == '\\' {
            backslash = true;
        }
        i += 1;
    }
    if backslash {
        let mut out: Vec<char> = Vec::new();
        out.push('E');
        out.push('\'');
        let mut i: usize = 0;
        while i < s.len()
            invariant
                i <= s.len(),
                out@ == seq!['E', '\''] + encode(s@.take(i as int), Style::Postgres),
            decreases s.len() - i,
        {
            let c = s[i];
            proof {
                lemma_encode_step(s@, i as int, Style::Postgres);
            }
            if c == '\'' {
                out.push('\'');
                out.push('\'');
            } else if c == '\\' {
                out.push('\\');
                out.push('\\');
            } else {
                out.push(c);
            }
            assert(out@ =~= seq!['E', '\''] + encode(s@.take(i as int + 1), Style::Postgres));
            i += 1;
        }
        out.push('\'');
        proof {
            lemma_take_all(s@);
            let e = encode(s@, Style::Postgres);
            assert forall|rest: Seq<char>| (rest.len() == 0 || rest[0] != '\'')
                implies #[trigger] lex_escape_string(out@.subrange(2, out@.len() as int) + rest) == Some((s@, out@.len() - 2 as int)) by {
                assert(out@.subrange(2, out@.len() as int) + rest =~= e + seq!['\''] + rest);
                lemma_lex_escape_string(s@, rest);
            }
        }
        out
    } else {
        let out = doubled(s, '\'');
        proof {
            // Without a backslash, the two encodings are one.
            lemma_same_encoding(s@);
            let e = encode(s@, Style::Postgres);
            assert forall|rest: Seq<char>| (rest.len() == 0 || rest[0] != '\'')
                implies #[trigger] lex_escape_string(out@.drop_first() + rest) == Some((s@, out@.len() - 1 as int)) by {
                assert(out@.drop_first() + rest =~= e + seq!['\''] + rest);
                lemma_lex_escape_string(s@, rest);
            }
        }
        out
    }
}

/// Without a backslash, PostgreSQL's encoding is the doubled one.
proof fn lemma_same_encoding(s: Seq<char>)
    requires free_of(s, '\\'),
    ensures encode(s, Style::Postgres) == encode(s, Style::Doubled('\'')),
    decreases s.len(),
{
    if s.len() > 0 {
        assert(free_of(s.drop_first(), '\\')) by {
            assert forall|i: int| 0 <= i < s.len() - 1 implies #[trigger] s.drop_first()[i] != '\\' by {
                assert(s[i + 1] != '\\');
            }
        }
        lemma_same_encoding(s.drop_first());
        assert(s[0] != '\\');
    }
}

} // verus!
