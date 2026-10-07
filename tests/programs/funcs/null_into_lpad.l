# Lpad of a null is null.
# Expect: rows Q = [(None,)]
Q(v: Lpad(null, 3, "0"));
