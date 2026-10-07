# Test: A grounded predicate of 2 rules. (from tests/programs/pipelines/union_of_2_grounded.l)

@Ground(W);
W(x:) distinct :- x in [0, 1];
W(x:) distinct :- x in [2, 3];
Q(n? += 1) distinct :- W(x:);
