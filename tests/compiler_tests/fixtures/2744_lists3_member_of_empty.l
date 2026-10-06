# Test: Nothing is in an empty list. (from tests/programs/lists3/member_of_empty.l)

V(x: 1);
Q(x:) :- V(x:), x in [];
