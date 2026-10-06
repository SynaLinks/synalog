# Test: A program the verifier accepts: combine with local var. (from tests/programs/verifier2/valid_combine_with_local_var.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n:, m: (combine Max= b :- E(a: n, b:))) :- N(n:);
