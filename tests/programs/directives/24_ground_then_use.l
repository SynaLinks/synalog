# A grounded predicate read by another.
# Expect: rows Twice = [(2,), (4,)]
@Ground(V);
V(x:) :- x in [1, 2];
@OrderBy(Twice, "y");
Twice(y:) :- V(x:), y == x * 2;
