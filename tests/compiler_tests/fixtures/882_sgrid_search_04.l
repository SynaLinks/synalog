# Test: Words matching zzz. (from tests/programs/sgrid/search_04.l)

W(w: "alpha");
W(w: "beta");
W(w: "gamma");
W(w: "delta");
W(w: "epsilon");
@OrderBy(S, "w");
S(w:) :- W(w:);
