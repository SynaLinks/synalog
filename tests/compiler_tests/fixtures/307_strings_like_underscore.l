# Test: Like with the one-character wildcard. (from tests/programs/strings/05_like_underscore.l)

W(w:) :- w in ["abc", "abbc", "ac"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "a_c");
