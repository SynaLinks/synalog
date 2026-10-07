# Test: A deep recursion with a filter in the step. (from tests/programs/recursion/52_deep_with_join_condition.l)

Next(x:, y: x + 2) :- x in Range(100);
@Recursive(R, 30);
R(y: 0) distinct;
R(y:) distinct :- R(y: x), Next(x:, y:), y < 25;
M(m? Max= y) distinct :- R(y:);
@OrderBy(R2, "m");
R2(m:) :- M(m:);
