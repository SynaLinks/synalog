# Test: A union whose branch negates. (from tests/programs/unions/04_union_with_negation.l)

V(x:) :- x in [1, 2, 3];
Two(x: 2);
@OrderBy(U, "x");
U(x:) distinct :- (V(x:), ~Two(x:));
