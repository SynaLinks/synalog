# Words like "_a_".
# Expect: rows L = [("Cat",), ("cat",)]
W(w:) :- w in ["cat", "cart", "scat", "Cat", "ct", "c_t"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "_a_");
