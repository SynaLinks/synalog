# Test: A program the verifier accepts: string functions bound. (from tests/programs/verifier2/valid_string_functions_bound.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "u");
Q(u: Upper(s), l: Length(s)) :- N(s:);
