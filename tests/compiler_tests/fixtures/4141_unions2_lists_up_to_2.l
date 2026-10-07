# Test: Lists collected by two rules of one predicate, values up to 2. (from tests/programs/unions2/lists_up_to_2.l)

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
L(src: "a", l? List= x) distinct :- A(x:), x <= 2;
L(src: "b", l? List= x) distinct :- B(x:), x <= 2;
M(src: "a", l: []);
M(src: "b", l: []);
All(src:, l:) :- L(src:, l:);
All(src:, l:) :- M(src:, l:), ~L(src:);
@OrderBy(Q, "src");
Q(src:, n: Size(l)) :- All(src:, l:);
