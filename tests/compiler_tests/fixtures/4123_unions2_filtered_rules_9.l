# Test: A values above 9 and B values below 9. (from tests/programs/unions2/filtered_rules_9.l)

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
U(x:) :- A(x:), x > 9;
U(x:) :- B(x:), x < 9;
@OrderBy(Q, "x");
Q(x:, n? += 1) distinct :- U(x:);
