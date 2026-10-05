# Test: A combine expression with a filter in its body. (from tests/programs/combine/09_combine_with_a_filter.l)

V(x:) :- x in [1, 2, 3];
T(t:) :- t == (combine += x :- V(x:), x > 1);
