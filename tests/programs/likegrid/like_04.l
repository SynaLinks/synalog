# Words like "%a%".
# Expect: rows L = [("Cat",), ("cart",), ("cat",), ("scat",)]
W(w:) :- w in ["cat", "cart", "scat", "Cat", "ct", "c_t"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "%a%");
