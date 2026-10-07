# Test: A grounded predicate of 4 rules. (from tests/programs/pipelines/union_of_4_grounded.l)

@Ground(W);
W(x:) distinct :- x in [0, 1];
W(x:) distinct :- x in [2, 3];
W(x:) distinct :- x in [4, 5];
W(x:) distinct :- x in [6, 7];
Q(n? += 1) distinct :- W(x:);
