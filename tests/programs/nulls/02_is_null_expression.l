# IsNull as a value.
# Expect: rows N = [(True, False)]
N(a: IsNull(null), b: IsNull(1));
