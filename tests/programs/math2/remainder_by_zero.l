# A remainder by zero has no value.
# Expect: rows Q = [(1, None), (2, None), (3, 1.5), (4, -1.5)]
V(id: 1, x: 7, z: 0);
V(id: 2, x: 0, z: 0);
V(id: 3, x: 7.5, z: 2);
V(id: 4, x: -7.5, z: 2);
@OrderBy(Q, "id");
Q(id:, v: x % z) :- V(id:, x:, z:);
