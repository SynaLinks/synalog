# An imported recursion applied to local edges, from x.
# Expect: rows Q = [('w',), ('y',), ('z',)]
import lib.graph.Reach;
Local(a: "x", b: "y");
Local(a: "y", b: "z");
Local(a: "z", b: "w");
Local(a: "p", b: "q");
R := Reach(Edge: Local);
@OrderBy(Q, "b");
Q(b:) :- R(a: "x", b:);
