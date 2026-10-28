// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! How many times an unrolled recursion repeats its iteration.
//!
//! A flat iterative recursion precomputes `ignition_steps` steps, then an
//! `@Iteration` loop that advances two steps per repetition. [`repetitions`]
//! is how many repetitions reach the requested `depth`. Verus proves two
//! things the compiler depends on and a past version got wrong:
//!
//!   * the count is enough — `ignition_steps + 2 * (repetitions - 1) >= depth`,
//!     so the loop computes at least `depth` steps;
//!   * the arithmetic does not overflow, given the compiler's depth cap.

use vstd::prelude::*;

verus! {

/// Repetitions of the two-step iteration to reach `depth`, given `ignition_steps`
/// steps already precomputed. The compiler caps `depth` (an infinite recursion
/// becomes `1_000_000_000`), well below the bound here, so the `i64` arithmetic
/// cannot overflow.
pub fn repetitions(depth: i64, ignition_steps: i64) -> (r: i64)
    requires
        1 <= ignition_steps <= depth,
        depth <= 2_000_000_000,
    ensures
        r >= 1,
        ignition_steps + 2 * (r - 1) >= depth,
{
    (depth - ignition_steps + 1) / 2 + 1
}

} // verus!
