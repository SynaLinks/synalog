# Strings compare in order.
# Expect: rows S = [("apple",)]
W(w:) :- w in ["apple", "pear"];
S(w:) :- W(w:), w < "banana";
