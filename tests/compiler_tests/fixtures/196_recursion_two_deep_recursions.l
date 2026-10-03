# Test: Two independent deep recursions in one program. (from tests/programs/recursion/07_two_deep_recursions.l)

Next(x:, y: x + 1) :- x in Range(100);
@Recursive(A, 25);
A(y: 0) distinct;
A(y:) distinct :- A(y: x), Next(x:, y:);
@Recursive(B, 30);
B(y: 0) distinct;
B(y:) distinct :- B(y: x), Next(x:, y:);
Both(a? Max= a, b? Max= b) distinct :- A(y: a), B(y: b);
