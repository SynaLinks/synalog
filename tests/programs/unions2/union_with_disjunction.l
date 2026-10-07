# A rule with a disjunction and another rule.
# Expect: rows Q = [(1,), (2,), (3,), (4,), (5,), (6,), (7,), (8,), (100,)]
A(x: 1);
A(x: 2);
A(x: 3);
A(x: 4);
A(x: 5);
A(x: 6);
B(x: 4);
B(x: 5);
B(x: 6);
B(x: 7);
B(x: 8);
U(x:) distinct :- A(x:) | B(x:);
U(x: 100) distinct;
@OrderBy(Q, "x");
Q(x:) :- U(x:);
