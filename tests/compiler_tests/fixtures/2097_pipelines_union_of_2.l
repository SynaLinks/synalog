# Test: A predicate of 2 rules. (from tests/programs/pipelines/union_of_2.l)

W(x:) distinct :- x in [0, 1];
W(x:) distinct :- x in [2, 3];
Q(n? += 1) distinct :- W(x:);
