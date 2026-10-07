# Test: The first letter of each row. (from tests/programs/strfuncs/first_letter_column.l)

V(w:) :- w in ["Apple", "kiwi", "Banana"];
@OrderBy(S, "w");
S(w:, f: Substr(w, 1, 1)) :- V(w:);
