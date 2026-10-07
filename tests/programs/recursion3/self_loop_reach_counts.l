# How many nodes each node reaches in the self_loop graph.
# Expect: rows Q = [(1, 3), (2, 2)]
E(a: 1, b: 1, w: 1);
E(a: 1, b: 2, w: 3);
E(a: 2, b: 2, w: 1);
E(a: 2, b: 3, w: 1);
@Recursive(T, -1);
T(a:, b:) distinct :- E(a:, b:);
T(a:, b: c) distinct :- T(a:, b:), E(a: b, b: c);
@OrderBy(Q, "a");
Q(a:, n? += 1) distinct :- T(a:, b:);
