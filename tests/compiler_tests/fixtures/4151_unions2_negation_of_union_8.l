# Test: Values outside a union of rules that pick 8. (from tests/programs/unions2/negation_of_union_8.l)

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
Pick(x: 8) :- A(x: 8);
Pick(x: 8) :- B(x: 8);
All(x:) distinct :- A(x:) | B(x:);
@OrderBy(Q, "x");
Q(x:) :- All(x:), ~Pick(x:);
