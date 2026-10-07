# Test: How often each word appears. (from tests/programs/lists3/word_counts.l)

W(id: 1, s: "red green blue");
W(id: 2, s: "red red");
W(id: 3, s: "blue");
W(id: 4, s: "");
@OrderBy(Q, "w", "n");
Q(w:, n? += 1) distinct :- W(s:), w in Split(s, " "), w != "";
