# A depends on not A through recursion.
# Expect: error Negative recursion

@Recursive(A, 5);
Node(x:) :- x in [1, 2];
A(x:) :- Node(x:), ~B(x:);
B(x:) :- Node(x:), A(x:);
