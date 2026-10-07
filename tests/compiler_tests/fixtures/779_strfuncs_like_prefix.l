# Test: Words starting with a letter, case-sensitive. (from tests/programs/strfuncs/like_prefix.l)

V(w:) :- w in ["Apple", "kiwi", "Banana"];
S(w:) :- V(w:), Like(w, "A%");
