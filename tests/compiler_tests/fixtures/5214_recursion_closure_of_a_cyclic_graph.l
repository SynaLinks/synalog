# Test: The transitive closure of a graph with a cycle and several paths between two nodes, to a depth past its longest path: every pair joined by a path, once. (from tests/programs/recursion/54_closure_of_a_cyclic_graph.l)

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
