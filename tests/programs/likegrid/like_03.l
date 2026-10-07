# Words like "c_t".
# Expect: rows L = [("c_t",), ("cat",)]
W(w:) :- w in ["cat", "cart", "scat", "Cat", "ct", "c_t"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "c_t");
