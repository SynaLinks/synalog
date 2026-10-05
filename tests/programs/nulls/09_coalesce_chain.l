# The first non-null of several.
# Expect: rows N = [(3,)]
V(a: null, b: null, c: 3);
N(v: Coalesce(a, b, c)) :- V(a:, b:, c:);
