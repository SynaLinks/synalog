# Negating a parenthesised conjunction.
# Expect: rows Out = [(1,), (3,)]
V(x:) :- x in [1, 2, 3];
A(x: 2);
B(x: 2);
B(x: 3);
@OrderBy(Out, "x");
Out(x:) :- V(x:), ~(A(x:), B(x:));
