# Test: Text functions of null are null. (from tests/programs/strings/32_upper_of_null.l)

V(k: 1, s: null);
V(k: 2, s: "ab");
@OrderBy(S, "k");
S(k:, a: Upper(s), b: Length(s), c: Substr(s, 1, 1)) :- V(k:, s:);
