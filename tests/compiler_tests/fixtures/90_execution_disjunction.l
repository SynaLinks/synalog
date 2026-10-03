# Test: A disjunction in a body. (from tests/programs/execution/07_disjunction.l)

V(x:) :- x in [1, 3, 5];
@OrderBy(Small, "x");
Small(x:) :- V(x:), (x == 1 | x == 5);
