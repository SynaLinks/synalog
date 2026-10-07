# Test: A column of nulls only. (from tests/programs/typing/null_only_column.l)

V(k: 1, v: null);
V(k: 2, v: null);
@OrderBy(Q, "k");
Q(k:, v:) :- V(k:, v:);
