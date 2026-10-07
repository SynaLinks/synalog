# StartsWith of a null is null.
# Expect: rows Q = [(None,)]
Q(v: StartsWith(null, "a"));
