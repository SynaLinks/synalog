# Test: Counting the true values of a boolean column. (from tests/programs/boolean/05_count_true.l)

V(x:) :- x in [1, 3, 4];
B(x:, big: x > 2) :- V(x:);
T(n? += (if big then 1 else 0)) distinct :- B(big:);
