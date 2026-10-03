# Test: Negating a deep recursive predicate (stratified: it is complete first). (from tests/programs/recursion/08_deep_recursion_with_negation_after.l)

Next(x:, y: x + 1) :- x in Range(100);
Node(x:) :- x in [10, 39, 40];
@Recursive(Reach, 39);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
@OrderBy(Unreached, "x");
Unreached(x:) :- Node(x:), ~Reach(y: x);
