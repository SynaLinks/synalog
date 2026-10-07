# Test: Commas in each row. (from tests/programs/strfuncs/split_count_column.l)

V(t:) :- t in ["x", "a,b,c"];
@OrderBy(S, "t");
S(t:, n: Size(Split(t, ","))) :- V(t:);
