# Test: Like with a % wildcard. (from tests/programs/execution/40_like.l)

W(w:) :- w in ["apple", "banana", "apricot"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "ap%");
