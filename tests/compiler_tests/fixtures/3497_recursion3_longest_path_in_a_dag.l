# Test: The longest path length from 1 in a DAG. (from tests/programs/recursion3/longest_path_in_a_dag.l)

E(a: 1, b: 2);
E(a: 1, b: 3);
E(a: 2, b: 3);
E(a: 2, b: 4);
E(a: 3, b: 4);
@Recursive(L, -1);
L(n: 1, d: 0) distinct;
L(n: b, d: d + 1) distinct :- L(n: a, d:), E(a:, b:);
Q(m? Max= d) distinct :- L(d:);
