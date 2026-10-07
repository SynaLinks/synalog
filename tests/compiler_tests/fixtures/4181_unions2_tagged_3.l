# Test: Values above 3, tagged by their rule. (from tests/programs/unions2/tagged_3.l)

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
U(x:, src: "a") :- A(x:), x > 3;
U(x:, src: "b") :- B(x:), x > 3;
@OrderBy(Q, "x", "src");
Q(x:, src:) :- U(x:, src:);
