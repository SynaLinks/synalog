# Test: Words like "C%". (from tests/programs/likegrid/like_05.l)

W(w:) :- w in ["cat", "cart", "scat", "Cat", "ct", "c_t"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "C%");
