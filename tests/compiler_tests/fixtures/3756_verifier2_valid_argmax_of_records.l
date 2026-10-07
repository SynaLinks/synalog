# Test: A program the verifier accepts: argmax of records. (from tests/programs/verifier2/valid_argmax_of_records.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
A(best? ArgMax= {n:, s:} -> n) distinct :- N(n:, s:);
Q(s: best.s) :- A(best:);
