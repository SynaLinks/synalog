# Test: A grounded predicate of 8 rules. (from tests/programs/pipelines/union_of_8_grounded.l)

@Ground(W);
W(x:) distinct :- x in [0, 1];
W(x:) distinct :- x in [2, 3];
W(x:) distinct :- x in [4, 5];
W(x:) distinct :- x in [6, 7];
W(x:) distinct :- x in [8, 9];
W(x:) distinct :- x in [10, 11];
W(x:) distinct :- x in [12, 13];
W(x:) distinct :- x in [14, 15];
Q(n? += 1) distinct :- W(x:);
