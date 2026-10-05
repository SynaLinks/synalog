# Test: Upper of Lower is Upper. (from tests/programs/strfuncs/upper_equals_lower_upper.l)

V(w:) :- w in ["Apple", "kiwi", "Banana"];
S(n? += 1) distinct :- V(w:), Upper(Lower(w)) == Upper(w);
