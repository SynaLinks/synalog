# Test: Building text in an aggregated column. (from tests/programs/strings/43_concat_in_an_aggregate.l)

V(s:) :- s in ["b", "a"];
@OrderBy(S, "s");
S(s:, t? Max= s ++ "!") distinct :- V(s:);
