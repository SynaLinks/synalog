// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! The type name of a `Cast`/`TryCast`, which the compiler pastes into a
//! `CAST(expr AS <name>)` unquoted.
//!
//! A type name is a run of type characters: letters, digits, `_`, spaces,
//! and the brackets `(`, `)`, `<`, `>` and comma of parameterized types
//! (`DECIMAL(38, 2)`, `ARRAY<INT64>`). [`accepts`] takes a name only when its
//! characters are all type characters and its brackets are balanced, never
//! closing one that did not open. Verus proves an accepted name:
//!
//!   * holds no character that could end the `CAST(...)` early or start
//!     anything after it — no quote, semicolon, backslash, dash, star or
//!     slash, so no second statement, no comment, no string;
//!   * keeps the brackets balanced, so no `)` or `>` escapes the `CAST(`.
//!
//! So `CAST(expr AS <name>)` stays one cast expression, whatever the name.

use vstd::prelude::*;

verus! {

pub open spec fn is_type_char(c: char) -> bool {
    ||| ('a' <= c <= 'z')
    ||| ('A' <= c <= 'Z')
    ||| ('0' <= c <= '9')
    ||| c == '_'
    ||| c == ' '
    ||| c == '('
    ||| c == ')'
    ||| c == '<'
    ||| c == '>'
    ||| c == ','
}

/// A character that could end the cast or start something after it.
pub open spec fn is_dangerous(c: char) -> bool {
    ||| c == ';'
    ||| c == '\''
    ||| c == '"'
    ||| c == '`'
    ||| c == '\\'
    ||| c == '-'
    ||| c == '/'
    ||| c == '*'
    ||| c == '='
}

proof fn lemma_type_char_not_dangerous(c: char)
    requires is_type_char(c),
    ensures !is_dangerous(c),
{
}

/// The bracket depth after `t`: `(` and `<` open, `)` and `>` close.
pub open spec fn depth(t: Seq<char>) -> int
    decreases t.len(),
{
    if t.len() == 0 {
        0
    } else {
        depth(t.drop_last()) + open_close(t.last())
    }
}

pub open spec fn open_close(c: char) -> int {
    if c == '(' || c == '<' { 1 } else if c == ')' || c == '>' { -1 } else { 0 }
}

/// Brackets balance, and no prefix closes more than it opened.
pub open spec fn balanced(t: Seq<char>) -> bool {
    &&& depth(t) == 0
    &&& forall|i: int| 0 <= i <= t.len() ==> depth(#[trigger] t.take(i)) >= 0
}

/// The accepted type names: every character a type character, brackets balanced.
pub open spec fn accepted(t: Seq<char>) -> bool {
    &&& (forall|i: int| 0 <= i < t.len() ==> is_type_char(#[trigger] t[i]))
    &&& balanced(t)
}

proof fn lemma_depth_step(t: Seq<char>, i: int)
    requires 0 <= i < t.len(),
    ensures depth(t.take(i + 1)) == depth(t.take(i)) + open_close(t[i]),
{
    assert(t.take(i + 1).drop_last() =~= t.take(i));
    assert(t.take(i + 1).last() == t[i]);
}

/// Whether `s` is an accepted type name.
pub fn accepts(s: &Vec<char>) -> (ok: bool)
    ensures ok == accepted(s@),
{
    let mut i: usize = 0;
    // The bracket depth so far, as a `usize`: `i < s.len() <= usize::MAX`
    // bounds it, and a close at depth 0 is a bracket never opened.
    let mut d: usize = 0;
    while i < s.len()
        invariant
            i <= s.len(),
            d <= i,
            d == depth(s@.take(i as int)),
            depth(s@.take(i as int)) >= 0,
            forall|j: int| 0 <= j < i ==> is_type_char(#[trigger] s@[j]),
            forall|j: int| 0 <= j <= i ==> depth(#[trigger] s@.take(j)) >= 0,
        decreases s.len() - i,
    {
        let c = s[i];
        proof {
            lemma_depth_step(s@, i as int);
        }
        let type_char = ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9')
            || c == '_' || c == ' ' || c == '(' || c == ')' || c == '<' || c == '>' || c == ',';
        if !type_char {
            // A non-type character: this is not an accepted name.
            assert(!is_type_char(c));
            return false;
        }
        if c == '(' || c == '<' {
            d = d + 1;
        } else if c == ')' || c == '>' {
            if d == 0 {
                // A bracket closes one never opened.
                assert(depth(s@.take(i as int + 1)) < 0);
                return false;
            }
            d = d - 1;
        }
        i += 1;
    }
    proof {
        assert(s@.take(s.len() as int) =~= s@);
    }
    let balanced = d == 0;
    proof {
        if !balanced {
            assert(depth(s@) != 0);
        }
    }
    balanced
}

/// An accepted type name holds no dangerous character.
pub proof fn lemma_accepted_is_safe(t: Seq<char>)
    requires accepted(t),
    ensures forall|i: int| 0 <= i < t.len() ==> !is_dangerous(#[trigger] t[i]),
{
    assert forall|i: int| 0 <= i < t.len() implies !is_dangerous(#[trigger] t[i]) by {
        lemma_type_char_not_dangerous(t[i]);
    }
}

} // verus!
