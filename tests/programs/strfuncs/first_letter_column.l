# The first letter of each row.
# Expect: rows S = [("Apple", "A"), ("Banana", "B"), ("kiwi", "k")]
V(w:) :- w in ["Apple", "kiwi", "Banana"];
@OrderBy(S, "w");
S(w:, f: Substr(w, 1, 1)) :- V(w:);
