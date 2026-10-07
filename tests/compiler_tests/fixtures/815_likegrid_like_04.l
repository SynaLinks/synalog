# Test: Words like "%a%". (from tests/programs/likegrid/like_04.l)

W(w:) :- w in ["cat", "cart", "scat", "Cat", "ct", "c_t"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "%a%");
