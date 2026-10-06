# RegexpReplace of a null is null.
# Expect: rows Q = [(None,)]
Q(v: RegexpReplace(null, "a", "b"));
