# Test: Words like "c%". (from tests/programs/likegrid/like_01.l)

W(w:) :- w in ["cat", "cart", "scat", "Cat", "ct", "c_t"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "c%");
