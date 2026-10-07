# ToInt64 of text.
# Expect: rows Q = [(12, 7)]
Q(a: ToInt64("12"), b: ToInt64(Substr("x7", 2, 1)));
