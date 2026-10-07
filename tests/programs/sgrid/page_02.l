# A page of words with their lengths.
# Expect: page S 10 3 = [("epsilon", 7), ("gamma", 5)]
W(w: "alpha");
W(w: "beta");
W(w: "gamma");
W(w: "delta");
W(w: "epsilon");
@OrderBy(S, "w");
S(w:, n: Length(w)) :- W(w:);
