# Test: An odd depth past 20: exactly 23 steps. (from tests/programs/execution/75_deep_recursion_odd_depth.l)

Next(x:, y: x + 1) :- x in Range(100);
@Recursive(Reach, 23);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
