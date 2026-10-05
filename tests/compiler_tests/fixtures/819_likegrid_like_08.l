# Test: Words like "%". (from tests/programs/likegrid/like_08.l)

W(w:) :- w in ["cat", "cart", "scat", "Cat", "ct", "c_t"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "%");
