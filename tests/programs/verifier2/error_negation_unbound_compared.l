# Refused: negation unbound compared.
# Expect: error only appears negated
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(n:) :- N(n:), ~(E(a: n), m > 1);
