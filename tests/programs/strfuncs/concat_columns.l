# Concatenating two columns.
# Expect: rows S = [("a-1",), ("b-2",)]
V(s: "a", n: 1);
V(s: "b", n: 2);
@OrderBy(S, "t");
S(t: s ++ "-" ++ ToString(n)) :- V(s:, n:);
