# Digits come before letters.
# Expect: rows Q = [("1", "A", "a")]
Q(a: x, b: y, c: z) :- x == "1", y == "A", z == "a", x < y, y < z;
