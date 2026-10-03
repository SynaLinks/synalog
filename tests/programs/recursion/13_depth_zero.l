# Depth 0 is refused: a recursion takes at least one step.
# Expect: error the depth is a whole number of steps, 1 or more, or -1
Edge(a: 1, b: 2);
@Recursive(Reach, 0);
Reach(x: 1) distinct;
Reach(x: b) distinct :- Reach(x: a), Edge(a:, b:);
