# Round rounds a half away from zero, a computed double too.
# Expect: rows Q = [(3, -3, 4)]
Q(a: Round(5 / 2), b: Round(-5 / 2), c: Round(7 / 2));
