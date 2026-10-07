# Test: Membership in a list. (from tests/programs/verifier/18_in_a_list.l)

Item(x:) :- x in [1, 2, 3];
@OrderBy(Small, "x");
Small(x:) :- Item(x:), x in [1, 2];
