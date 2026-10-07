# Test: A single step of recursion. (from tests/programs/recursion/50_depth_one.l)

Next(x:, y: x + 1) :- x in Range(10);
@Recursive(R, 1);
@OrderBy(R, "y");
R(y: 0) distinct;
R(y:) distinct :- R(y: x), Next(x:, y:);
