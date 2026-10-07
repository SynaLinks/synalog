# Test: Null is not equal to null: no row is equal, and a sum of no rows is null. (from tests/programs/nulls/20_null_not_equal_to_itself.l)

V(x: null);
W(x:) :- V(x:), x == x;
N(n? += 1) distinct :- V(), ~W();
