# ToInt64 rounds a half away from zero.
# Expect: rows Q = [(3, -3, 4, 2)]
Q(a: ToInt64(5 / 2), b: ToInt64(-5 / 2), c: ToInt64(3.7), d: ToInt64(9 / 4));
