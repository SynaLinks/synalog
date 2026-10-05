# Substr of each row.
# Expect: rows S = [("ap",), ("pe",)]
W(w:) :- w in ["apple", "pear"];
@OrderBy(S, "p");
S(p: Substr(w, 1, 2)) :- W(w:);
