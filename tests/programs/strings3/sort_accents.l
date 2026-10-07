# Accented letters come after the ASCII letters.
# Expect: rows Q = [("e",), ("z",), ("é",)]
V(w: "é");
V(w: "z");
V(w: "e");
@OrderBy(Q, "w");
Q(w:) :- V(w:);
