# The total weight of edges between reached nodes.
# Expect: rows Q = [(6,)]
E(a: 1, b: 2, w: 1);
E(a: 2, b: 3, w: 2);
E(a: 3, b: 1, w: 3);
E(a: 4, b: 5, w: 10);
@Recursive(R, -1);
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
Q(t? += w) distinct :- E(a:, b:, w:), R(x: a), R(x: b);
