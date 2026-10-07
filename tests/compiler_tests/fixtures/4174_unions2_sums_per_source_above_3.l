# Test: Sums per rule of the values above 3. (from tests/programs/unions2/sums_per_source_above_3.l)

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
U(x:, src: "a") :- A(x:), x > 3;
U(x:, src: "b") :- B(x:), x > 3;
U(x:, src: "c") :- C(x:), x > 3;
@OrderBy(Q, "src");
Q(src:, s? += x) distinct :- U(x:, src:);
