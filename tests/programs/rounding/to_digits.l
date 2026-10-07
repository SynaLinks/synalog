# Round to digits, of a computed double.
# Expect: rows Q = [(2.333, 2.57, 0.1)]
Q(a: Round(7 / 3, 3), b: Round(2.567, 2), c: Round(1 / 8, 1));
