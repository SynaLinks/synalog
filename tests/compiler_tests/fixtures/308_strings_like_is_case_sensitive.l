# Test: Like distinguishes upper and lower case. (from tests/programs/strings/06_like_is_case_sensitive.l)

W(w:) :- w in ["abc", "ABC"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "abc");
