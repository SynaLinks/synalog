# Test: Upper of each row. (from tests/programs/strfuncs/upper_column.l)

V(w:) :- w in ["Apple", "kiwi", "Banana"];
@OrderBy(S, "w");
S(w:, u: Upper(w)) :- V(w:);
