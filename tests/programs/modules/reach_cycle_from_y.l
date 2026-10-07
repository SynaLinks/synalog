# An imported recursion over local edges with a cycle, from y.
# Expect: rows Q = [('x',), ('y',), ('z',)]
import lib.graph.Reach;
Loop(a: "x", b: "y");
Loop(a: "y", b: "x");
Loop(a: "y", b: "z");
R := Reach(Edge: Loop);
@OrderBy(Q, "b");
Q(b:) :- R(a: "y", b:);
