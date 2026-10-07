# Verifier Test: Refused: assert bad statement.
# Expected Error: AssertionError.invalidAssertion
#
# (from tests/programs/verifier2/error_assert_bad_statement.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(n:) :- N(n:);
@Assert(Q, broken: "∀ n, Q n →");
