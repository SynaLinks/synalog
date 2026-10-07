# A grounded predicate named after an SQL keyword gets a table that parses.
# Expect: rows R = [(1,), (2,)]
V(x: 1);
V(x: 2);
@Ground(Order);
Order(x:) :- V(x:);
@OrderBy(R, "x");
R(x:) :- Order(x:);
