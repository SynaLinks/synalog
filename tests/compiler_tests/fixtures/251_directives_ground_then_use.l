# Test: A grounded predicate read by another. (from tests/programs/directives/24_ground_then_use.l)

@Ground(V);
V(x:) :- x in [1, 2];
@OrderBy(Twice, "y");
Twice(y:) :- V(x:), y == x * 2;
