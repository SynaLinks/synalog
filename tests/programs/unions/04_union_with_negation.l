# A union whose branch negates.
# Expect: rows U = [(1,), (3,)]
V(x:) :- x in [1, 2, 3];
Two(x: 2);
@OrderBy(U, "x");
U(x:) distinct :- (V(x:), ~Two(x:));
