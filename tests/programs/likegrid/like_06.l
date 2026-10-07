# Words like "c%t".
# Expect: rows L = [("c_t",), ("cart",), ("cat",), ("ct",)]
W(w:) :- w in ["cat", "cart", "scat", "Cat", "ct", "c_t"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "c%t");
