# Test: Depth 22: exactly 22 steps. (from tests/programs/recursion/04_depth_22.l)

Next(x:, y: x + 1) :- x in Range(200);
@Recursive(Reach, 22);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
