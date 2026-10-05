# Like with both wildcards.
# Expect: rows L = [("bakery",), ("cake",)]
W(w:) :- w in ["cake", "bakery", "cookie"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "%a_e%");
