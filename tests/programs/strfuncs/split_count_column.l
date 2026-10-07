# Commas in each row.
# Expect: rows S = [("a,b,c", 3), ("x", 1)]
V(t:) :- t in ["x", "a,b,c"];
@OrderBy(S, "t");
S(t:, n: Size(Split(t, ","))) :- V(t:);
