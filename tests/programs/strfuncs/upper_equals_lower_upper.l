# Upper of Lower is Upper.
# Expect: rows S = [(3,)]
V(w:) :- w in ["Apple", "kiwi", "Banana"];
S(n? += 1) distinct :- V(w:), Upper(Lower(w)) == Upper(w);
