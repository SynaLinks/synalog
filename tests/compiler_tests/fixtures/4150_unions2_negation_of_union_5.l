# Test: Values outside a union of rules that pick 5. (from tests/programs/unions2/negation_of_union_5.l)

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
Pick(x: 5) :- A(x: 5);
Pick(x: 5) :- B(x: 5);
All(x:) distinct :- A(x:) | B(x:);
@OrderBy(Q, "x");
Q(x:) :- All(x:), ~Pick(x:);
