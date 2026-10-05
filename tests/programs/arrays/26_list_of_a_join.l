# Collecting the values of a join.
# Expect: rows A = [(2,)]
X(k: 1, v: "a");
X(k: 1, v: "b");
X(k: 2, v: "c");
K(k: 1);
L(l? List= v) distinct :- K(k:), X(k:, v:);
A(n: Size(l)) :- L(l:);
