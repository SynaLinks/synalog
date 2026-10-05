# Like without a wildcard is equality.
# Expect: rows S = [("abc",)]
V(s:) :- s in ["abc", "abcd"];
S(s:) :- V(s:), Like(s, "abc");
