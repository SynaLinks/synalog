// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! A page of a predicate's rows: `limit` rows after the first `offset`, the
//! limit no more than the predicate's `@Limit`.
//!
//! The SQL takes the page with `LIMIT`/`OFFSET`, or, on an engine without
//! `OFFSET`, keeps the rows numbered past the offset up to its last row.
//! Rows are numbered by a `BIGINT`, so [`page`] gives numbers no larger than
//! `i64::MAX`, and Verus proves that the SQL keeps, of the rows `1` to
//! `i64::MAX`, exactly those asked for, both ways.

use vstd::prelude::*;

verus! {

pub struct Page {
    /// `LIMIT`, if any.
    pub limit: Option<u64>,
    /// `OFFSET`, if any (never 0).
    pub offset: Option<u64>,
    /// The last row number of the page, if any.
    pub last_row: Option<u64>,
}

pub open spec fn skipped(offset: Option<u64>) -> int {
    match offset {
        Some(o) => o as int,
        None => 0,
    }
}

/// The row numbered `r` (from 1) is on the page asked for: past the offset,
/// and within the limit, and the `@Limit` when there is a limit.
pub open spec fn asked(limit: Option<u64>, annotation: Option<i64>, offset: Option<u64>, r: int) -> bool {
    &&& r > skipped(offset)
    &&& match limit {
        Some(l) => r <= skipped(offset) + l && match annotation {
            Some(a) => a < 0 || r <= skipped(offset) + a,
            None => true,
        },
        None => true,
    }
}

/// `LIMIT` and `OFFSET` keep the row numbered `r`.
pub open spec fn kept(page: Page, r: int) -> bool {
    &&& r > skipped(page.offset)
    &&& match page.limit {
        Some(l) => r <= skipped(page.offset) + l,
        None => true,
    }
}

/// The row numbers past the offset, up to the last row, keep `r`.
pub open spec fn numbered(page: Page, r: int) -> bool {
    &&& r > skipped(page.offset)
    &&& match page.last_row {
        Some(x) => r <= x,
        None => true,
    }
}

pub open spec fn fits(x: Option<u64>) -> bool {
    match x {
        Some(v) => v <= i64::MAX,
        None => true,
    }
}

pub fn page(limit: Option<u64>, annotation: Option<i64>, offset: Option<u64>) -> (p: Page)
    ensures
        fits(p.limit) && fits(p.offset) && fits(p.last_row),
        match p.offset { Some(o) => o > 0, None => true },
        p.limit.is_none() && p.offset.is_none() <==> limit.is_none() && skipped(offset) == 0,
        forall|r: int| 1 <= r <= i64::MAX ==> (#[trigger] asked(limit, annotation, offset, r) <==> kept(p, r)),
        forall|r: int| 1 <= r <= i64::MAX ==> (#[trigger] asked(limit, annotation, offset, r) <==> numbered(p, r)),
{
    let big: u64 = i64::MAX as u64;
    // The limit asked for, the smaller of the two.
    let wanted: Option<u64> = match limit {
        Some(l) => match annotation {
            Some(a) => if a >= 0 && (a as u64) < l { Some(a as u64) } else { Some(l) },
            None => Some(l),
        },
        None => None,
    };
    // Past `i64::MAX`, a limit or an offset changes nothing: there are no
    // more rows.
    let off: Option<u64> = match offset {
        Some(o) => if o == 0 { None } else if o > big { Some(big) } else { Some(o) },
        None => None,
    };
    let lim: Option<u64> = match wanted {
        Some(l) => if l > big { Some(big) } else { Some(l) },
        None => None,
    };
    let skip: u64 = match off {
        Some(o) => o,
        None => 0,
    };
    let last_row: Option<u64> = match lim {
        Some(l) => if l > big - skip { None } else { Some(skip + l) },
        None => None,
    };
    let p = Page { limit: lim, offset: off, last_row };
    assert forall|r: int| 1 <= r <= i64::MAX implies (#[trigger] asked(limit, annotation, offset, r) <==> kept(p, r)) by {
        assert(skipped(offset) >= skipped(off));
    }
    p
}

} // verus!
