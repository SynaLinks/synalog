# Test: String equality distinguishes case. (from tests/programs/strings/36_strings_equal_case_sensitive.l)

V(s:) :- s in ["a", "A"];
S(s:) :- V(s:), s == "a";
