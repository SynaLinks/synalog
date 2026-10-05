# Test: Pairs of strings with a < b. (from tests/programs/compare/lt_strings.l)

V(s:) :- s in ["a", "b"];
@OrderBy(C, "a", "b");
C(a:, b:) :- V(s: a), V(s: b), a < b;
