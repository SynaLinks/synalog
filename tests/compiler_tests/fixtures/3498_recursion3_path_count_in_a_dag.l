# Test: How many paths reach each node of a DAG from 1. (from tests/programs/recursion3/path_count_in_a_dag.l)

E(a: 1, b: 2);
E(a: 1, b: 3);
E(a: 2, b: 3);
E(a: 2, b: 4);
E(a: 3, b: 4);
@Recursive(Path, -1);
Path(p: "1", last: 1) distinct;
Path(p: p ++ "-" ++ ToString(b), last: b) distinct :- Path(p:, last: a), E(a:, b:);
@OrderBy(Q, "n");
Q(n: last, c? += 1) distinct :- Path(last:);
