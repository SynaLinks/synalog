# Test: Accented letters come after the ASCII letters. (from tests/programs/strings3/sort_accents.l)

V(w: "é");
V(w: "z");
V(w: "e");
@OrderBy(Q, "w");
Q(w:) :- V(w:);
