# An aggregate computed inside a rule body.
# Expect: rows Share = [(1, 0.25), (3, 0.75)]
V(x:) :- x in [1, 3];
Total(t? += x) distinct :- V(x:);
@OrderBy(Share, "x");
Share(x:, s:) :- V(x:), Total(t:), s == ToFloat64(x) / ToFloat64(t);
