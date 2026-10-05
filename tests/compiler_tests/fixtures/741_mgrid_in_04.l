# Test: Membership joins with the list's elements: a value listed twice matches twice, unless the predicate is distinct. (from tests/programs/mgrid/in_04.l)

V(x:) :- x in [1];
D(x:) distinct :- V(x:), x in [1, 1];
@OrderBy(M, "x");
M(x:) :- V(x:), x in [1, 1];
