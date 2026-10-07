# The size of the transitive closure of the chain graph.
# Expect: rows Q = [(15,)]
E(a: 1, b: 2, w: 3);
E(a: 2, b: 3, w: 1);
E(a: 3, b: 4, w: 4);
E(a: 4, b: 5, w: 2);
E(a: 5, b: 6, w: 1);
@Recursive(T, -1);
T(a:, b:) distinct :- E(a:, b:);
T(a:, b: c) distinct :- T(a:, b:), E(a: b, b: c);
Q(n? += 1) distinct :- T(a:, b:);
