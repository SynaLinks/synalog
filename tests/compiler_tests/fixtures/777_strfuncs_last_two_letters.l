# Test: The last two letters of each row. (from tests/programs/strfuncs/last_two_letters.l)

V(w:) :- w in ["Apple", "kiwi", "Banana"];
@OrderBy(S, "w");
S(w:, l: Substr(w, Length(w) - 1, 2)) :- V(w:);
