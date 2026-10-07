# Like with a % wildcard.
# Expect: rows L = [("apple",), ("apricot",)]
W(w:) :- w in ["apple", "banana", "apricot"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "ap%");
