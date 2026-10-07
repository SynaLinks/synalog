# Like distinguishes upper and lower case.
# Expect: rows L = [("abc",)]
W(w:) :- w in ["abc", "ABC"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "abc");
