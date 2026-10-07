# Test: A column named trim. (from tests/programs/records3/reserved_column_trim.l)

V(trim: 1);
V(trim: 2);
@OrderBy(Q, "trim");
Q(trim:) :- V(trim:);
