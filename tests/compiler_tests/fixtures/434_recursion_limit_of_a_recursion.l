# Test: @Limit applies to the result of a recursion, not to each step. (from tests/programs/recursion/34_limit_of_a_recursion.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 3, b: 4);
E(a: 4, b: 5);
@Recursive(R, 5);
@OrderBy(R, "x desc");
@Limit(R, 2);
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
