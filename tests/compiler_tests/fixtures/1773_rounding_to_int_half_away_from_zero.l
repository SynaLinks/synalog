# Test: ToInt64 rounds a half away from zero. (from tests/programs/rounding/to_int_half_away_from_zero.l)

Q(a: ToInt64(5 / 2), b: ToInt64(-5 / 2), c: ToInt64(3.7), d: ToInt64(9 / 4));
