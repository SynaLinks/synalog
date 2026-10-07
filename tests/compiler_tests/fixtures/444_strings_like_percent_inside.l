# Test: Like with % in the middle. (from tests/programs/strings/19_like_percent_inside.l)

W(w:) :- w in ["abc", "axyzc", "abd"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "a%c");
