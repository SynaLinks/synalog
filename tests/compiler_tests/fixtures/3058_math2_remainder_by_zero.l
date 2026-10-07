# Test: A remainder by zero has no value. (from tests/programs/math2/remainder_by_zero.l)

V(id: 1, x: 7, z: 0);
V(id: 2, x: 0, z: 0);
V(id: 3, x: 7.5, z: 2);
V(id: 4, x: -7.5, z: 2);
@OrderBy(Q, "id");
Q(id:, v: x % z) :- V(id:, x:, z:);
