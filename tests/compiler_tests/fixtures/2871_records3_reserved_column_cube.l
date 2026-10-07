# Test: A column named cube. (from tests/programs/records3/reserved_column_cube.l)

V(cube: 1);
V(cube: 2);
@OrderBy(Q, "cube");
Q(cube:) :- V(cube:);
