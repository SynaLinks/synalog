# Test: A combine over no rows is null. (from tests/programs/combine/05_combine_of_nothing.l)

V(x:) :- x in [1], x > 5;
T(t:) :- t == (combine += x :- V(x:));
