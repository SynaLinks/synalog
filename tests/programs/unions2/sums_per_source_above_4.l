# Sums per rule of the values above 4.
# Expect: rows Q = [('a', 11), ('b', 26), ('c', 16)]
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
U(x:, src: "a") :- A(x:), x > 4;
U(x:, src: "b") :- B(x:), x > 4;
U(x:, src: "c") :- C(x:), x > 4;
@OrderBy(Q, "src");
Q(src:, s? += x) distinct :- U(x:, src:);
