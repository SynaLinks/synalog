# Test: Without a depth, a recursion takes 8 steps. (from tests/programs/recursion/26_default_depth.l)

Next(x:, y: x + 1) :- x in Range(20);
@Recursive(Reach);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
R(n? += 1) distinct :- Reach(y:);
