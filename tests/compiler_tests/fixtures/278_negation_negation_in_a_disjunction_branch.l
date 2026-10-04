# Test: A negation in one branch of a disjunction. (from tests/programs/negation/03_negation_in_a_disjunction_branch.l)

V(x:) :- x in [1, 2, 3];
Banned(x: 2);
Banned(x: 3);
@OrderBy(Out, "x");
Out(x:) distinct :- V(x:), (~Banned(x:) | x == 3);
