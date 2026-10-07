# Like with % in the middle.
# Expect: rows L = [("abc",), ("axyzc",)]
W(w:) :- w in ["abc", "axyzc", "abd"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "a%c");
