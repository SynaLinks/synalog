# Test: Every pair an imported recursion reaches. (from tests/programs/modules/reach_pairs.l)

import lib.graph.Reach;
Local(a: "x", b: "y");
Local(a: "y", b: "z");
Local(a: "z", b: "w");
Local(a: "p", b: "q");
R := Reach(Edge: Local);
@OrderBy(Q, "a", "b");
Q(a:, b:) :- R(a:, b:);
