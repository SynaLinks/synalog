# Coalesce over several nulls.
# Expect: rows N = [(3,)]
N(x: Coalesce(null, null, 3));
