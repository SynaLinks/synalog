# Refused: order by no predicate.
# Expect: error needs the predicate it is about
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy("n");
Q(n:) :- N(n:);
