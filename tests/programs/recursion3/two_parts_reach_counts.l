# How many nodes each node reaches in the two_parts graph.
# Expect: rows Q = [(1, 2), (2, 1), (4, 3), (5, 3), (6, 3)]
E(a: 1, b: 2, w: 1);
E(a: 2, b: 3, w: 1);
E(a: 4, b: 5, w: 1);
E(a: 5, b: 6, w: 1);
E(a: 6, b: 4, w: 1);
@Recursive(T, -1);
T(a:, b:) distinct :- E(a:, b:);
T(a:, b: c) distinct :- T(a:, b:), E(a: b, b: c);
@OrderBy(Q, "a");
Q(a:, n? += 1) distinct :- T(a:, b:);
