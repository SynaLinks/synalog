# Test: Substr of each row. (from tests/programs/strings/27_substr_of_a_column.l)

W(w:) :- w in ["apple", "pear"];
@OrderBy(S, "p");
S(p: Substr(w, 1, 2)) :- W(w:);
