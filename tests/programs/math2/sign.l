# The sign of x.
# Expect: rows Q = [(1, 1), (2, -1), (3, 1), (4, -1), (5, 0), (6, 1), (7, 1), (8, 1), (9, -1), (10, 1)]
V(id: 1, x: 7);
V(id: 2, x: -7);
V(id: 3, x: 2.5);
V(id: 4, x: -2.5);
V(id: 5, x: 0);
V(id: 6, x: 3);
V(id: 7, x: 0.125);
V(id: 8, x: 1000000);
V(id: 9, x: -0.75);
V(id: 10, x: 12.345);
@OrderBy(Q, "id");
Q(id:, v: (if x > 0 then 1 else if x < 0 then -1 else 0)) :- V(id:, x:);
