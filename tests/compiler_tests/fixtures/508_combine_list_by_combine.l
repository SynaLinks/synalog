# Test: Collecting a list with a combine expression. (from tests/programs/combine/06_list_by_combine.l)

V(x:) :- x in [1, 2, 3];
T(n: Size(l)) :- l == (combine List= x :- V(x:));
