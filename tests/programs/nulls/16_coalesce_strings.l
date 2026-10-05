# Coalesce of strings.
# Expect: rows N = [("fallback",)]
V(s: null);
N(v: Coalesce(s, "fallback")) :- V(s:);
