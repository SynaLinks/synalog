# Text functions of null are null.
# Expect: rows S = [(1, None, None, None), (2, "AB", 2, "a")]
V(k: 1, s: null);
V(k: 2, s: "ab");
@OrderBy(S, "k");
S(k:, a: Upper(s), b: Length(s), c: Substr(s, 1, 1)) :- V(k:, s:);
