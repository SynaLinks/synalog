# Test: Depth 99: exactly 99 steps. (from tests/programs/recursion/04_depth_99.l)

Next(x:, y: x + 1) :- x in Range(200);
@Recursive(Reach, 99);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
