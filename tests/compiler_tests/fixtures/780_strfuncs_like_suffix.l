# Test: Words ending with a letter. (from tests/programs/strfuncs/like_suffix.l)

V(w:) :- w in ["Apple", "kiwi", "Banana"];
S(w:) :- V(w:), Like(w, "%na");
