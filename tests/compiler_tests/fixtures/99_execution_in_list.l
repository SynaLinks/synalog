# Test: Membership in a list as a filter. (from tests/programs/execution/16_in_list.l)

V(x:) :- x in [1, 2, 3, 4];
@OrderBy(Picked, "x");
Picked(x:) :- V(x:), Constraint(x in [2, 4]);
