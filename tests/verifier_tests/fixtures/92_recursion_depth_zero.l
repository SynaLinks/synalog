# Verifier Test: Depth 0 is refused: a recursion takes at least one step.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/recursion/13_depth_zero.l)

Edge(a: 1, b: 2);
@Recursive(Reach, 0);
Reach(x: 1) distinct;
Reach(x: b) distinct :- Reach(x: a), Edge(a:, b:);
