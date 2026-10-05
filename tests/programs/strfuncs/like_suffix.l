# Words ending with a letter.
# Expect: rows S = [("Banana",)]
V(w:) :- w in ["Apple", "kiwi", "Banana"];
S(w:) :- V(w:), Like(w, "%na");
