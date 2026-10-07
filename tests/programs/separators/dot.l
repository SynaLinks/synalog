# A dot separates; it is not a pattern.
# Expect: rows Q = [(["a", "b", "c"],)]
Q(parts: Split("a.b.c", "."));
