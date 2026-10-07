# Unnesting a column holding an empty list and a list of texts.
# Expect: rows Q = [(2,)]
V(l: []);
V(l: ["a", "b"]);
Q(n? += 1) distinct :- V(l:), x in l;
