# Test: Words like "_a_". (from tests/programs/likegrid/like_07.l)

W(w:) :- w in ["cat", "cart", "scat", "Cat", "ct", "c_t"];
@OrderBy(L, "w");
L(w:) :- W(w:), Like(w, "_a_");
