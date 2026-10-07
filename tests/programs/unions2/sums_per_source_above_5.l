# Sums per rule of the values above 5.
# Expect: rows Q = [('a', 6), ('b', 21), ('c', 16)]
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
C(x: 2);
C(x: 7);
C(x: 9);
U(x:, src: "a") :- A(x:), x > 5;
U(x:, src: "b") :- B(x:), x > 5;
U(x:, src: "c") :- C(x:), x > 5;
@OrderBy(Q, "src");
Q(src:, s? += x) distinct :- U(x:, src:);
