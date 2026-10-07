# Test: Concatenating two columns. (from tests/programs/strfuncs/concat_columns.l)

V(s: "a", n: 1);
V(s: "b", n: 2);
@OrderBy(S, "t");
S(t: s ++ "-" ++ ToString(n)) :- V(s:, n:);
