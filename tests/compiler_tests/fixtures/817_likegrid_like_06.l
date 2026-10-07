# Test: Words like "c%t". (from tests/programs/likegrid/like_06.l)

W(w:) :- w in ["cat", "cart", "scat", "Cat", "ct", "c_t"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "c%t");
