# Refused: reserved today.
# Expect: error Reserved predicate name 'Today'
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Today(date: "x");
Q(d:) :- Today(date: d);
