# Test: A column named skip. (from tests/programs/records3/reserved_column_skip.l)

V(skip: 1);
V(skip: 2);
@OrderBy(Q, "skip");
Q(skip:) :- V(skip:);
