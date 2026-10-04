# A negation in one branch of a disjunction.
# Expect: rows Out = [(1,), (3,)]
V(x:) :- x in [1, 2, 3];
Banned(x: 2);
Banned(x: 3);
@OrderBy(Out, "x");
Out(x:) distinct :- V(x:), (~Banned(x:) | x == 3);
