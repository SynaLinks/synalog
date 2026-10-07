# A predicate with no column, used as a condition.
# Expect: rows Out = [(1,), (2,)]
V(x:) :- x in [1, 2];
HasTwo() :- V(x: 2);
@OrderBy(Out, "x");
Out(x:) :- V(x:), HasTwo();
