# Test: A values above 7 and B values below 7. (from tests/programs/unions2/filtered_rules_7.l)

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
U(x:) :- A(x:), x > 7;
U(x:) :- B(x:), x < 7;
@OrderBy(Q, "x");
Q(x:, n? += 1) distinct :- U(x:);
