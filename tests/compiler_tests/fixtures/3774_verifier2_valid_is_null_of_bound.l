# Test: A program the verifier accepts: is null of bound. (from tests/programs/verifier2/valid_is_null_of_bound.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
V(x: null);
V(x: 1);
Q(n? += 1) distinct :- V(x:), x is null;
