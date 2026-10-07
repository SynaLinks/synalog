# Splitting each row's text.
# Expect: rows A = [("a,b", 2), ("c", 1)]
V(t:) :- t in ["a,b", "c"];
@OrderBy(A, "t");
A(t:, n: Size(Split(t, ","))) :- V(t:);
