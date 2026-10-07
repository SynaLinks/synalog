# Every pair an imported recursion reaches.
# Expect: rows Q = [('p', 'q'), ('x', 'w'), ('x', 'y'), ('x', 'z'), ('y', 'w'), ('y', 'z'), ('z', 'w')]
import lib.graph.Reach;
Local(a: "x", b: "y");
Local(a: "y", b: "z");
Local(a: "z", b: "w");
Local(a: "p", b: "q");
R := Reach(Edge: Local);
@OrderBy(Q, "a", "b");
Q(a:, b:) :- R(a:, b:);
