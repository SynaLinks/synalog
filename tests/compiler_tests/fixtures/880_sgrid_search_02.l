# Test: Words matching ta$. (from tests/programs/sgrid/search_02.l)

W(w: "alpha");
W(w: "beta");
W(w: "gamma");
W(w: "delta");
W(w: "epsilon");
@OrderBy(S, "w");
S(w:) :- W(w:);
