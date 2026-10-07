# Test: An imported recursion over local edges with a cycle, from x. (from tests/programs/modules/reach_cycle_from_x.l)

import lib.graph.Reach;
Loop(a: "x", b: "y");
Loop(a: "y", b: "x");
Loop(a: "y", b: "z");
R := Reach(Edge: Loop);
@OrderBy(Q, "b");
Q(b:) :- R(a: "x", b:);
