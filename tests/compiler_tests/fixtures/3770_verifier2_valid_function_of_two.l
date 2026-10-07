# Test: A program the verifier accepts: function of two. (from tests/programs/verifier2/valid_function_of_two.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "v");
Add(x, y) = x + y;
Q(v: Add(a, b)) :- E(a:, b:);
