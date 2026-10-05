# Test: Lower of each row. (from tests/programs/strfuncs/lower_column.l)

V(w:) :- w in ["Apple", "kiwi", "Banana"];
@OrderBy(S, "w");
S(w:, u: Lower(w)) :- V(w:);
