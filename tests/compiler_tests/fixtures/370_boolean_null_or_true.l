# Test: A null test in a disjunction. (from tests/programs/boolean/06_null_or_true.l)

V(x: null);
V(x: 1);
V(x: 5);
@OrderBy(B, "x NULLS FIRST");
B(x:) :- V(x:), x is null || x > 1;
