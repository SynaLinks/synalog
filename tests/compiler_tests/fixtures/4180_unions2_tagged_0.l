# Test: Values above 0, tagged by their rule. (from tests/programs/unions2/tagged_0.l)

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
U(x:, src: "a") :- A(x:), x > 0;
U(x:, src: "b") :- B(x:), x > 0;
@OrderBy(Q, "x", "src");
Q(x:, src:) :- U(x:, src:);
