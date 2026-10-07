# Sums per rule of the values above 0.
# Expect: rows Q = [('a', 21), ('b', 30), ('c', 18)]
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
U(x:, src: "a") :- A(x:), x > 0;
U(x:, src: "b") :- B(x:), x > 0;
U(x:, src: "c") :- C(x:), x > 0;
@OrderBy(Q, "src");
Q(src:, s? += x) distinct :- U(x:, src:);
