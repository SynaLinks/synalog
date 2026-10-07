# Test: A grounded predicate named after an SQL keyword gets a table that parses. (from tests/programs/directives/ground_named_like_a_keyword.l)

V(x: 1);
V(x: 2);
@Ground(Order);
Order(x:) :- V(x:);
@OrderBy(R, "x");
R(x:) :- Order(x:);
