# P negates itself: never stratified.
# Expect: error Negative recursion
@Recursive(P, 3);
Node(x:) :- x in [1];
P(x:) :- Node(x:), ~P(x:);
