# Test: Depth 21, the first iterated one. (from tests/programs/recursion/03_depth_21_iterated.l)

Next(x:, y: x + 1) :- x in Range(100);
@Recursive(Reach, 21);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
