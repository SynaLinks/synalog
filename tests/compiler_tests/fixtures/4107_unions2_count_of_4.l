# Test: How many times 4 is in the union. (from tests/programs/unions2/count_of_4.l)

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
Q(n? += 1) distinct :- U(x: 4);
