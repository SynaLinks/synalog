# Test: A conditional comparing strings. (from tests/programs/conditionals/05_condition_on_strings.l)

V(s:) :- s in ["a", "m"];
@OrderBy(C, "s");
C(s:, w: (if s < "h" then "early" else "late")) :- V(s:);
