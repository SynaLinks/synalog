// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Where a compiled program writes: in `synalog_home`, and nowhere else.
//!
//! Before the compiler returns a plan, it reads every statement into tokens
//! (`src/compiler/home_guard.rs`, outside this proof: string literals and
//! comments skipped as the engine reads them, names interned to `u64`
//! symbols, a write's verb and modifiers folded into one token) and asks
//! [`writes_in_home`] whether to return it. That decision is proved here: it
//! accepts the statements exactly when
//!
//!   * none is a statement the compiler never writes ([`FORBIDDEN`]: an
//!     `UPDATE`, a `DELETE`, an `ALTER`, a `GRANT`, a `COPY`, dynamic SQL...);
//!   * every write ([`WRITE`]: `CREATE TABLE`, `DROP TABLE`, `INSERT INTO`...)
//!     names a table directly in `home` (`synalog_home.t`; on Trino and
//!     Presto `synalog_home.synalog_home.t`), or in the session's own
//!     temporary schema where there is one (PostgreSQL's `pg_temp.t`);
//!   * every schema it makes ([`MAKE_HOME`]) is `home` itself.
//!
//! A write whose target is no name (`CREATE TABLE (`), a name with one part
//! too few (`synalog_home` alone, or `synalog_home.t` on Trino, a schema of
//! the customer's catalog) or too many is refused: the decision fails closed.
//! [`lemma_home_table`] proves a table the compiler names in `home` is
//! accepted.

use vstd::prelude::*;

verus! {

/// A name: one part of a dotted name (`synalog_home`, `t`), quoted or not.
pub const NAME: u8 = 0;
/// The dot between two parts of a name.
pub const DOT: u8 = 1;
/// A write of the name that follows: `CREATE TABLE`, `DROP TABLE IF EXISTS`,
/// `INSERT INTO`, `CREATE TYPE`...
pub const WRITE: u8 = 2;
/// The making of the schema that follows: `CREATE SCHEMA IF NOT EXISTS`.
pub const MAKE_HOME: u8 = 3;
/// A statement the compiler never writes, refused wherever it is.
pub const FORBIDDEN: u8 = 4;
/// Anything else: a keyword, a literal, an operator.
pub const OTHER: u8 = 5;

/// The dotted name starting at token `i`: its parts, up to the first token
/// that is neither a name nor the dot before one.
pub open spec fn target(t: Seq<(u8, u64)>, i: int) -> Seq<u64>
    decreases t.len() - i,
{
    if 0 <= i < t.len() && t[i].0 == NAME {
        if i + 1 < t.len() && t[i + 1].0 == DOT {
            seq![t[i].1] + target(t, i + 2)
        } else {
            seq![t[i].1]
        }
    } else {
        Seq::empty()
    }
}

/// `parts` names a table directly in `home` (or in the session's temporary
/// schema `scratch`), or, when a schema is made, `home` itself.
pub open spec fn in_home(parts: Seq<u64>, home: Seq<u64>, scratch: Option<u64>, schema: bool) -> bool {
    if schema {
        parts == home
    } else {
        (parts.len() == home.len() + 1 && parts.subrange(0, home.len() as int) == home)
            || match scratch {
                Some(s) => parts.len() == 2 && parts[0] == s,
                None => false,
            }
    }
}

/// No forbidden statement, every write's target in `home`, every schema made
/// `home` itself.
pub open spec fn all_in_home(t: Seq<(u8, u64)>, home: Seq<u64>, scratch: Option<u64>) -> bool {
    forall|i: int| 0 <= i < t.len() ==> #[trigger] token_in_home(t, i, home, scratch)
}

pub open spec fn token_in_home(t: Seq<(u8, u64)>, i: int, home: Seq<u64>, scratch: Option<u64>) -> bool {
    &&& t[i].0 != FORBIDDEN
    &&& t[i].0 == WRITE ==> in_home(target(t, i + 1), home, scratch, false)
    &&& t[i].0 == MAKE_HOME ==> in_home(target(t, i + 1), home, scratch, true)
}

/// The parts of the dotted name starting at token `i`, appended to `out`.
fn read_target(t: &Vec<(u8, u64)>, i: usize, out: &mut Vec<u64>)
    requires
        i <= t.len(),
    ensures
        final(out)@ == old(out)@ + target(t@, i as int),
    decreases t.len() - i,
{
    let ghost before = out@;
    if i < t.len() && t[i].0 == NAME {
        out.push(t[i].1);
        if i + 1 < t.len() && t[i + 1].0 == DOT {
            let ghost pushed = out@;
            read_target(t, i + 2, out);
            assert(pushed =~= before + seq![t@[i as int].1]);
            assert(out@ =~= before + (seq![t@[i as int].1] + target(t@, i as int + 2)));
        } else {
            assert(out@ =~= before + seq![t@[i as int].1]);
        }
    } else {
        assert(out@ =~= before + Seq::<u64>::empty());
    }
}

/// `parts` starts with `home`.
fn starts_with(parts: &Vec<u64>, home: &Vec<u64>) -> (r: bool)
    ensures
        r == (parts@.len() >= home@.len() && parts@.subrange(0, home@.len() as int) == home@),
{
    if parts.len() < home.len() {
        return false;
    }
    let mut k: usize = 0;
    while k < home.len()
        invariant
            k <= home.len(),
            home.len() <= parts.len(),
            forall|j: int| 0 <= j < k ==> parts@[j] == home@[j],
        decreases home.len() - k,
    {
        if parts[k] != home[k] {
            assert(parts@.subrange(0, home@.len() as int)[k as int] != home@[k as int]);
            return false;
        }
        k += 1;
    }
    assert(parts@.subrange(0, home@.len() as int) =~= home@);
    true
}

/// The decision of [`in_home`].
fn part_of_home(parts: &Vec<u64>, home: &Vec<u64>, scratch: Option<u64>, schema: bool) -> (r: bool)
    requires
        home.len() < usize::MAX,
    ensures
        r == in_home(parts@, home@, scratch, schema),
{
    let prefix = starts_with(parts, home);
    if schema {
        if parts.len() == home.len() {
            assert(parts@ =~= parts@.subrange(0, home@.len() as int));
        }
        return prefix && parts.len() == home.len();
    }
    let in_scratch = match scratch {
        Some(s) => parts.len() == 2 && parts[0] == s,
        None => false,
    };
    (prefix && parts.len() == home.len() + 1) || in_scratch
}

/// Whether to return the statements read into `t`: exactly when they write in
/// `home` only ([`all_in_home`]).
pub fn writes_in_home(t: &Vec<(u8, u64)>, home: &Vec<u64>, scratch: Option<u64>) -> (r: bool)
    requires
        home.len() < usize::MAX,
    ensures
        r == all_in_home(t@, home@, scratch),
{
    let mut i: usize = 0;
    while i < t.len()
        invariant
            i <= t.len(),
            home.len() < usize::MAX,
            forall|k: int| 0 <= k < i ==> #[trigger] token_in_home(t@, k, home@, scratch),
        decreases t.len() - i,
    {
        let kind = t[i].0;
        if kind == FORBIDDEN {
            assert(!token_in_home(t@, i as int, home@, scratch));
            return false;
        }
        if kind == WRITE || kind == MAKE_HOME {
            let mut parts: Vec<u64> = Vec::new();
            read_target(t, i + 1, &mut parts);
            assert(parts@ =~= target(t@, i as int + 1));
            if !part_of_home(&parts, home, scratch, kind == MAKE_HOME) {
                assert(!token_in_home(t@, i as int, home@, scratch));
                return false;
            }
        }
        assert(token_in_home(t@, i as int, home@, scratch));
        i += 1;
    }
    true
}

/// A table the compiler names in `home` is accepted: `home`'s parts, then the
/// table's.
pub proof fn lemma_home_table(home: Seq<u64>, table: u64, scratch: Option<u64>)
    ensures
        in_home(home + seq![table], home, scratch, false),
{
    assert((home + seq![table]).subrange(0, home.len() as int) =~= home);
}

/// A name with only `home`'s parts, or fewer, is never a table in it: on
/// Trino and Presto, `synalog_home.t` is a schema of the customer's catalog.
pub proof fn lemma_too_short_is_refused(parts: Seq<u64>, home: Seq<u64>)
    requires
        parts.len() <= home.len(),
    ensures
        !in_home(parts, home, None, false),
{
}

} // verus!
