# A column named cube.
# Expect: rows Q = [(1,), (2,)]
V(cube: 1);
V(cube: 2);
@OrderBy(Q, "cube");
Q(cube:) :- V(cube:);
