# A program the verifier accepts: function in a condition.
# Expect: valid
# Expect: rows Q = [(2,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Big(x) = x > 1;
Q(a:) :- E(a:), Big(a) == true;
