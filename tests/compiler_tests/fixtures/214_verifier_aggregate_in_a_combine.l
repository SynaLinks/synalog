# Test: An aggregate computed inside a rule body. (from tests/programs/verifier/39_aggregate_in_a_combine.l)

V(x:) :- x in [1, 3];
Total(t? += x) distinct :- V(x:);
@OrderBy(Share, "x");
Share(x:, s:) :- V(x:), Total(t:), s == ToFloat64(x) / ToFloat64(t);
