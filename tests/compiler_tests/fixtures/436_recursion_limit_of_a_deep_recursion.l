# Test: @Limit on a recursion computed into tables. (from tests/programs/recursion/36_limit_of_a_deep_recursion.l)

Next(x:, y: x + 1) :- x in Range(100);
@Recursive(R, 25);
@OrderBy(R, "y desc");
@Limit(R, 2);
R(y: 0) distinct;
R(y:) distinct :- R(y: x), Next(x:, y:);
