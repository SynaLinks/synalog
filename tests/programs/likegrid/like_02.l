# Words like "%t".
# Expect: rows L = [("Cat",), ("c_t",), ("cart",), ("cat",), ("ct",), ("scat",)]
W(w:) :- w in ["cat", "cart", "scat", "Cat", "ct", "c_t"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "%t");
