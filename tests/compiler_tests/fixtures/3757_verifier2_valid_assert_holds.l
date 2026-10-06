# Test: A program the verifier accepts: assert holds. (from tests/programs/verifier2/valid_assert_holds.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n:) :- N(n:);
@Assert(Q, positive: "∀ n, Q n → n > 0");
