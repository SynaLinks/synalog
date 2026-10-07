# A union of two aggregates.
# Expect: rows Q = [('a', 21), ('b', 30)]
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
S(src: "a", t? += x) distinct :- A(x:);
S(src: "b", t? += x) distinct :- B(x:);
@OrderBy(Q, "src");
Q(src:, t:) :- S(src:, t:);
