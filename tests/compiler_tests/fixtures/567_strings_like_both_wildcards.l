# Test: Like with both wildcards. (from tests/programs/strings/34_like_both_wildcards.l)

W(w:) :- w in ["cake", "bakery", "cookie"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "%a_e%");
