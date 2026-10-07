# Negating a negation.
# Expect: rows Out = [(1,)]
V(x:) :- x in [1, 2];
Present(x: 1);
Missing(x:) :- V(x:), ~Present(x:);
@OrderBy(Out, "x");
Out(x:) :- V(x:), ~Missing(x:);
