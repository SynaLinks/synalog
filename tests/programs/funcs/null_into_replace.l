# Replace of a null is null.
# Expect: rows Q = [(None,)]
Q(v: Replace(null, "a", "b"));
