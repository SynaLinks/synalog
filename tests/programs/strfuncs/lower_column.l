# Lower of each row.
# Expect: rows S = [("Apple", "apple"), ("Banana", "banana"), ("kiwi", "kiwi")]
V(w:) :- w in ["Apple", "kiwi", "Banana"];
@OrderBy(S, "w");
S(w:, u: Lower(w)) :- V(w:);
