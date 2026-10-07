# Test: A program the verifier accepts: keyword column name. (from tests/programs/verifier2/valid_keyword_column_name.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(select: n) :- N(n:), n == 1;
