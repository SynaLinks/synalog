# The transitive closure of a graph with a cycle and several paths between two
# nodes, to a depth past its longest path: every pair joined by a path, once.
# Expect: rows T = [(1, 1), (1, 2), (1, 3), (1, 4), (2, 1), (2, 2), (2, 3), (2, 4), (3, 1), (3, 2), (3, 3), (3, 4), (5, 4)]
E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 3, b: 1);
E(a: 1, b: 3);
E(a: 3, b: 4);
E(a: 5, b: 4);
@Recursive(T, 20);
@OrderBy(T, "a", "b");
T(a:, b:) distinct :- E(a:, b:);
T(a:, b: c) distinct :- T(a:, b:), E(a: b, b: c);
