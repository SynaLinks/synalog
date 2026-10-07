# StringAgg= skips nulls, and is null when every value is.
# Expect: rows A = [("g", None), ("h", "x")]
V(g: "g", s: null);
V(g: "h", s: null);
V(g: "h", s: "x");
@OrderBy(A, "g");
A(g:, s? StringAgg= s) distinct :- V(g:, s:);
