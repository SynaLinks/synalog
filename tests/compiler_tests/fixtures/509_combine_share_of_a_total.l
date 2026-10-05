# Test: Each value's share of the total. (from tests/programs/combine/07_share_of_a_total.l)

V(x:) :- x in [1, 3];
@OrderBy(T, "x");
T(x:, s: x / t) :- V(x:), t == (combine += y :- V(x: y));
