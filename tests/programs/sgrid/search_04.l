# Words matching zzz.
# Expect: search S zzz = []
W(w: "alpha");
W(w: "beta");
W(w: "gamma");
W(w: "delta");
W(w: "epsilon");
@OrderBy(S, "w");
S(w:) :- W(w:);
