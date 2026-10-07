# Test: An imported recursion over local edges with a cycle, from z. (from tests/programs/modules/reach_cycle_from_z.l)

import lib.graph.Reach;
Loop(a: "x", b: "y");
Loop(a: "y", b: "x");
Loop(a: "y", b: "z");
R := Reach(Edge: Loop);
Q(b:) :- R(a: "z", b:);
