# A null test in a disjunction.
# Expect: rows B = [(None,), (5,)]
V(x: null);
V(x: 1);
V(x: 5);
@OrderBy(B, "x NULLS FIRST");
B(x:) :- V(x:), x is null || x > 1;
