# Test: A program the verifier accepts: conditional value. (from tests/programs/verifier2/valid_conditional_value.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n:, w: (if n > 1 then "big" else "small")) :- N(n:);
