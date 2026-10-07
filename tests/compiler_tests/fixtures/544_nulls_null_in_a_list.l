# Test: Membership of null is not true. (from tests/programs/nulls/15_null_in_a_list.l)

V(x: 1);
V(x: null);
N(x:) :- V(x:), x in [1, 2];
