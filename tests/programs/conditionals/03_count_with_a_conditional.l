# Counting the rows a condition holds for.
# Expect: rows C = [(2,)]
V(x:) :- x in [1, 2, 3, 4];
C(n? += (if x > 2 then 1 else 0)) distinct :- V(x:);
