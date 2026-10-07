# How many paths reach each node of a DAG from 1.
# Expect: rows Q = [(1, 1), (2, 1), (3, 2), (4, 3)]
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
