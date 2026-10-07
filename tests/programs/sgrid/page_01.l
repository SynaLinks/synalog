# A page of words with their lengths.
# Expect: page S 2 1 = [("beta", 4), ("delta", 5)]
W(w: "alpha");
W(w: "beta");
W(w: "gamma");
W(w: "delta");
W(w: "epsilon");
@OrderBy(S, "w");
S(w:, n: Length(w)) :- W(w:);
