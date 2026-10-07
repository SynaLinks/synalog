# Test: The first row of a join. (from tests/programs/ordering/14_limit_one_of_a_join.l)

A(k: 2, v: "y");
A(k: 1, v: "x");
B(k:) :- k in [1, 2];
@OrderBy(O, "k");
@Limit(O, 1);
O(k:, v:) :- A(k:, v:), B(k:);
