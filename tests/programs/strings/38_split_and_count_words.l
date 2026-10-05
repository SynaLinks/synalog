# Counting the words of each sentence.
# Expect: rows S = [("a b c", 3), ("hello", 1)]
V(t:) :- t in ["hello", "a b c"];
@OrderBy(S, "t");
S(t:, n: Size(Split(t, " "))) :- V(t:);
