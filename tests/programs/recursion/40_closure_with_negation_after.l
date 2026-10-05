# The nodes a closure does not reach.
# Expect: rows U = [(5,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
Node(x:) :- x in [1, 2, 3, 5];
@Recursive(R, 5);
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
U(x:) :- Node(x:), ~R(x:);
