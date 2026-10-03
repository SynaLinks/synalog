# Negating a predicate with no column.
# Expect: rows Out = []
V(x:) :- x in [1, 2];
HasTwo() :- V(x: 2);
Out(x:) :- V(x:), ~HasTwo();
