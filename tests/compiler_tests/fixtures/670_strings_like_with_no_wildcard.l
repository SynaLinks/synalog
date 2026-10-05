# Test: Like without a wildcard is equality. (from tests/programs/strings/44_like_with_no_wildcard.l)

V(s:) :- s in ["abc", "abcd"];
S(s:) :- V(s:), Like(s, "abc");
