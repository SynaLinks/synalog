# Test: A shifted by 7 with B. (from tests/programs/unions2/shifted_union_7.l)

A(x: 1);
A(x: 2);
A(x: 3);
A(x: 4);
A(x: 5);
A(x: 6);
B(x: 4);
B(x: 5);
B(x: 6);
B(x: 7);
B(x: 8);
U(x: x + 7) distinct :- A(x:);
U(x:) distinct :- B(x:);
Q(n? += 1) distinct :- U(x:);
