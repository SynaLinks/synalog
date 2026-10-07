# The last two letters of each row.
# Expect: rows S = [("Apple", "le"), ("Banana", "na"), ("kiwi", "wi")]
V(w:) :- w in ["Apple", "kiwi", "Banana"];
@OrderBy(S, "w");
S(w:, l: Substr(w, Length(w) - 1, 2)) :- V(w:);
