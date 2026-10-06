# Test: A list with a null holds its other elements. (from tests/programs/lists3/null_member.l)

@OrderBy(Q, "x");
Q(x:) :- x in [1, null, 3], x is not null;
