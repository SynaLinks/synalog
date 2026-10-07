# Test: A program the verifier accepts: combine in a condition. (from tests/programs/verifier2/valid_combine_in_a_condition.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n:) :- N(n:), (combine += 1 :- E(a: n)) == 1;
