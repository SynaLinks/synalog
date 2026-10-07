# Building text in an aggregated column.
# Expect: rows S = [("a", "a!"), ("b", "b!")]
V(s:) :- s in ["b", "a"];
@OrderBy(S, "s");
S(s:, t? Max= s ++ "!") distinct :- V(s:);
