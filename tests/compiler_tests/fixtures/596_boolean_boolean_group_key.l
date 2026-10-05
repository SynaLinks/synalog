# Test: Grouping by a boolean. (from tests/programs/boolean/14_boolean_group_key.l)

V(x:) :- x in [1, 2, 5];
@OrderBy(B, "big");
B(big: x > 3, n? += 1) distinct :- V(x:);
