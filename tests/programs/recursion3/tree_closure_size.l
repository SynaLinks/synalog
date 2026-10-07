# The size of the transitive closure of the tree graph.
# Expect: rows Q = [(10,)]
E(a: 1, b: 2, w: 1);
E(a: 1, b: 3, w: 4);
E(a: 2, b: 4, w: 2);
E(a: 2, b: 5, w: 6);
E(a: 3, b: 6, w: 1);
E(a: 3, b: 7, w: 1);
@Recursive(T, -1);
T(a:, b:) distinct :- E(a:, b:);
T(a:, b: c) distinct :- T(a:, b:), E(a: b, b: c);
Q(n? += 1) distinct :- T(a:, b:);
