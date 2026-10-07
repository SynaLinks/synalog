# Two independent deep recursions in one program.
# Expect: rows Both = [(21, 22)]
Next(x:, y: x + 1) :- x in Range(100);
@Recursive(A, 21);
A(y: 0) distinct;
A(y:) distinct :- A(y: x), Next(x:, y:);
@Recursive(B, 22);
B(y: 0) distinct;
B(y:) distinct :- B(y: x), Next(x:, y:);
Both(a? Max= a, b? Max= b) distinct :- A(y: a), B(y: b);
