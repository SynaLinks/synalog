# Test: Two independent recursions in one program. (from tests/programs/recursion/49_two_recursions.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
@Recursive(R, 5);
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
@Recursive(S, 5);
S(x: 3) distinct;
S(x: a) distinct :- S(x: b), E(a:, b:);
B(x:) :- R(x:), S(x:), x > 2;
