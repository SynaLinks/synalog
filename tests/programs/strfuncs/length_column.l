# Length of each row.
# Expect: rows S = [("Apple", 5), ("Banana", 6), ("kiwi", 4)]
V(w:) :- w in ["Apple", "kiwi", "Banana"];
@OrderBy(S, "w");
S(w:, n: Length(w)) :- V(w:);
