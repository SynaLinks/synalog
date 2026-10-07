# RegexpExtract of a null is null.
# Expect: rows Q = [(None,)]
Q(v: RegexpExtract(null, "a"));
