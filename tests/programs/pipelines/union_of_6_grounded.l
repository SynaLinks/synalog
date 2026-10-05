# A grounded predicate of 6 rules.
# Expect: rows Q = [(12,)]
@Ground(W);
W(x:) distinct :- x in [0, 1];
W(x:) distinct :- x in [2, 3];
W(x:) distinct :- x in [4, 5];
W(x:) distinct :- x in [6, 7];
W(x:) distinct :- x in [8, 9];
W(x:) distinct :- x in [10, 11];
Q(n? += 1) distinct :- W(x:);
