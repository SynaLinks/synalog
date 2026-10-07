# Records equal to records of themselves: a field compared with its square.
# Expect: rows S = [(0,), (1,)]
V(x:) :- x in [0, 1, 2, 4];
@OrderBy(S, "x");
S(x:) :- V(x:), {a: x} == {a: x * x};
