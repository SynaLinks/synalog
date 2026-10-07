# Test: Records equal to records of themselves: a field compared with its square. (from tests/programs/selfref/records_of_themselves.l)

V(x:) :- x in [0, 1, 2, 4];
@OrderBy(S, "x");
S(x:) :- V(x:), {a: x} == {a: x * x};
