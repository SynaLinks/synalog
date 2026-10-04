# Like with the one-character wildcard.
# Expect: rows L = [("abc",)]
W(w:) :- w in ["abc", "abbc", "ac"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "a_c");
