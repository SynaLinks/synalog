# A backslash separates as itself.
# Expect: rows Q = [(["a", "b"],)]
Q(parts: Split('a\\b', '\\'));
