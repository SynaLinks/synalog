# Test: A number with a point is a double: 0.1 + 0.2 is not 0.3. (from tests/programs/math2/point_one_plus_point_two.l)

Q(x: 1) :- 0.1 + 0.2 == 0.3;
