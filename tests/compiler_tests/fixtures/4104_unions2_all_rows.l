# Test: Two rules without distinct: every row of both. (from tests/programs/unions2/all_rows.l)

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
U(x:) :- A(x:);
U(x:) :- B(x:);
Q(n? += 1) distinct :- U(x:);
