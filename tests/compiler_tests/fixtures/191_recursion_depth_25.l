# Test: Depth 25: exactly 25 steps. (from tests/programs/recursion/04_depth_25.l)

Next(x:, y: x + 1) :- x in Range(200);
@Recursive(Reach, 25);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
