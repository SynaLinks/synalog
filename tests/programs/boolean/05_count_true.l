# Counting the true values of a boolean column.
# Expect: rows T = [(2,)]
V(x:) :- x in [1, 3, 4];
B(x:, big: x > 2) :- V(x:);
T(n? += (if big then 1 else 0)) distinct :- B(big:);
