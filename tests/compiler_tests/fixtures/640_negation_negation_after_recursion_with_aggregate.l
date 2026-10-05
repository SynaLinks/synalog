# Test: Groups that a closure does not reach, counted. (from tests/programs/negation/17_negation_after_recursion_with_aggregate.l)

E(a: 1, b: 2);
Node(x:) :- x in [1, 2, 3, 4];
@Recursive(R, 5);
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
N(n? += 1) distinct :- Node(x:), ~R(x:);
