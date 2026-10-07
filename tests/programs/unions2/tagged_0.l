# Values above 0, tagged by their rule.
# Expect: rows Q = [(1, 'a'), (2, 'a'), (3, 'a'), (4, 'a'), (4, 'b'), (5, 'a'), (5, 'b'), (6, 'a'), (6, 'b'), (7, 'b'), (8, 'b')]
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
