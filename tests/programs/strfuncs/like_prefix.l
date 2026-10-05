# Words starting with a letter, case-sensitive.
# Expect: rows S = [("Apple",)]
V(w:) :- w in ["Apple", "kiwi", "Banana"];
S(w:) :- V(w:), Like(w, "A%");
