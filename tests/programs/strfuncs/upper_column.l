# Upper of each row.
# Expect: rows S = [("Apple", "APPLE"), ("Banana", "BANANA"), ("kiwi", "KIWI")]
V(w:) :- w in ["Apple", "kiwi", "Banana"];
@OrderBy(S, "w");
S(w:, u: Upper(w)) :- V(w:);
