# Test: A condition on a ratio with no value does not hold. (from tests/programs/math2/filter_on_a_ratio_by_zero.l)

V(id: 1, x: 7, z: 0);
V(id: 2, x: 0, z: 0);
V(id: 3, x: 7.5, z: 2);
V(id: 4, x: -7.5, z: 2);
Q(id:) :- V(id:, x:, z:), x / z > 1;
