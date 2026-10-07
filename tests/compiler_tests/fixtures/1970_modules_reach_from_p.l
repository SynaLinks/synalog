# Test: An imported recursion applied to local edges, from p. (from tests/programs/modules/reach_from_p.l)

import lib.graph.Reach;
Local(a: "x", b: "y");
Local(a: "y", b: "z");
Local(a: "z", b: "w");
Local(a: "p", b: "q");
R := Reach(Edge: Local);
Q(b:) :- R(a: "p", b:);
