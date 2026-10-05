# Test: A page of words with their lengths. (from tests/programs/sgrid/page_01.l)

W(w: "alpha");
W(w: "beta");
W(w: "gamma");
W(w: "delta");
W(w: "epsilon");
@OrderBy(S, "w");
S(w:, n: Length(w)) :- W(w:);
