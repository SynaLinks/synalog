# Verifier Test: A depends on not A through recursion.
# Expected Error: StratificationError
#
# (from tests/programs/verifier/08_negative_recursion.l)

@Recursive(A, 5);
Node(x:) :- x in [1, 2];
A(x:) :- Node(x:), ~B(x:);
B(x:) :- Node(x:), A(x:);
