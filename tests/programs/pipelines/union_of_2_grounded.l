# A grounded predicate of 2 rules.
# Expect: rows Q = [(4,)]
@Ground(W);
W(x:) distinct :- x in [0, 1];
W(x:) distinct :- x in [2, 3];
Q(n? += 1) distinct :- W(x:);
