# Test: A closure that converges before its 100 steps: the extra steps change nothing. (from tests/programs/execution/76_deep_recursion_converges.l)

Next(x:, y: x + 1) :- x in Range(4);
@Recursive(Reach, 100);
Reach(x:, y:) distinct :- Next(x:, y:);
Reach(x:, y: z) distinct :- Reach(x:, y:), Next(x: y, y: z);
N(n? += 1) distinct :- Reach();
