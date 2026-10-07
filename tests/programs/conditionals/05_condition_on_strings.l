# A conditional comparing strings.
# Expect: rows C = [("a", "early"), ("m", "late")]
V(s:) :- s in ["a", "m"];
@OrderBy(C, "s");
C(s:, w: (if s < "h" then "early" else "late")) :- V(s:);
