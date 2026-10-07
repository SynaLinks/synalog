# A search matching nothing.
# Expect: search O zzz = []
@OrderBy(O, "s");
O(s:) :- s in ["apple", "banana"];
