# Test: Depth 20, the last unrolled one. (from tests/programs/recursion/02_depth_20_unrolled.l)

Next(x:, y: x + 1) :- x in Range(100);
@Recursive(Reach, 20);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
