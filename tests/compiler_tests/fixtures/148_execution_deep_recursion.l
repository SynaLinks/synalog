# Test: Past 20 steps, recursion is computed by iterating tables: all 40 steps run. (from tests/programs/execution/65_deep_recursion.l)

Next(x:, y: x + 1) :- x in Range(100);
@Recursive(Reach, 40);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
Far(m? Max= y) distinct :- Reach(y:);
