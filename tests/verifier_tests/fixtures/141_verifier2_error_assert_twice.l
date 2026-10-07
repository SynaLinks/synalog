# Verifier Test: Refused: assert twice.
# Expected Error: AssertionError.duplicateAssertion
#
# (from tests/programs/verifier2/error_assert_twice.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(n:) :- N(n:);
@Assert(Q, a: "∀ n, Q n → n > 0");
@Assert(Q, a: "∀ n, Q n → n > 0");
