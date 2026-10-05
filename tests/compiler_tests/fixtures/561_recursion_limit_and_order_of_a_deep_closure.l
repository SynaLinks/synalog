# Test: The last rows of a closure computed into tables. (from tests/programs/recursion/43_limit_and_order_of_a_deep_closure.l)

Next(x:, y: x + 1) :- x in Range(100);
@Recursive(R, 30);
@OrderBy(R, "y desc");
@Limit(R, 3);
R(y: 0) distinct;
R(y:) distinct :- R(y: x), Next(x:, y:);
