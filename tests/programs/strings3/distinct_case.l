# Distinct keeps both cases.
# Expect: rows Q = [(2,)]
V(w: "a");
V(w: "A");
V(w: "a");
D(w:) distinct :- V(w:);
Q(n? += 1) distinct :- D(w:);
