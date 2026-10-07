# Test: Counting the words of each sentence. (from tests/programs/strings/38_split_and_count_words.l)

V(t:) :- t in ["hello", "a b c"];
@OrderBy(S, "t");
S(t:, n: Size(Split(t, " "))) :- V(t:);
