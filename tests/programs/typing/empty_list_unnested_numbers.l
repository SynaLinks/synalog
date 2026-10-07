# Unnesting a column holding an empty list and a list of numbers.
# Expect: rows Q = [(2,)]
V(l: []);
V(l: [1, 2]);
Q(n? += 1) distinct :- V(l:), x in l;
