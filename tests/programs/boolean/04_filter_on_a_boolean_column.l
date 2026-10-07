# Filtering on a boolean column.
# Expect: rows T = [(3,)]
V(x:) :- x in [1, 3];
B(x:, big: x > 2) :- V(x:);
T(x:) :- B(x:, big: true);
