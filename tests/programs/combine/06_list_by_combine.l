# Collecting a list with a combine expression.
# Expect: rows T = [(3,)]
V(x:) :- x in [1, 2, 3];
T(n: Size(l)) :- l == (combine List= x :- V(x:));
