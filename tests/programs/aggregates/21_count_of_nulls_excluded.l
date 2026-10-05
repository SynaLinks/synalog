# Counting the non-null values with a conditional.
# Expect: rows A = [(2,)]
V(x: 1);
V(x: null);
V(x: 3);
A(n? += (if x is null then 0 else 1)) distinct :- V(x:);
