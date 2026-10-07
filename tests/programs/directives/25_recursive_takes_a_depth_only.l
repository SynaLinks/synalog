# @Recursive takes the predicate and its depth, nothing else.
# Expect: error @Recursive(R): takes the predicate and its depth only
@Recursive(R, 3, iterative: true);
E(a: 1, b: 2);
R(x:) distinct :- E(a: x);
R(x: b) distinct :- R(x: a), E(a:, b:);
