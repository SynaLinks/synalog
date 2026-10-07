# Test: Length of each row. (from tests/programs/strfuncs/length_column.l)

V(w:) :- w in ["Apple", "kiwi", "Banana"];
@OrderBy(S, "w");
S(w:, n: Length(w)) :- V(w:);
