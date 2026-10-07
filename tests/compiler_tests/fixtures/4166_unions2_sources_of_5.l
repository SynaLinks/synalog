# Test: The rules 5 comes from. (from tests/programs/unions2/sources_of_5.l)

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
U(x:, src: "a") :- A(x:);
U(x:, src: "b") :- B(x:);
@OrderBy(Q, "src");
Q(src:) :- U(x: 5, src:);
