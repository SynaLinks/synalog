# Negating a predicate without rows keeps everything.
# Expect: rows Out = [(1,), (2,)]
V(x:) :- x in [1, 2];
None(x:) :- V(x:), x > 10;
@OrderBy(Out, "x");
Out(x:) :- V(x:), ~None(x:);
