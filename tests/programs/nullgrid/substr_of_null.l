# Substr(s, 1, 1) of a null is null.
# Expect: rows N = [(1, None), (2, "ok")]
V(k: 1, s: null);
V(k: 2, s: "ab");
@OrderBy(N, "k");
N(k:, v: (if k == 1 then (if IsNull(Substr(s, 1, 1)) then null else "bad") else "ok")) :- V(k:, s:);
