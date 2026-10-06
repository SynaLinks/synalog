# A column of nulls only, tested.
# Expect: rows Q = [(2,)]
V(k: 1, v: null);
V(k: 2, v: null);
Q(n? += 1) distinct :- V(v:), v is null;
