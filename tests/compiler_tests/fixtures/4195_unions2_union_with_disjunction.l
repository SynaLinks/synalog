# Test: A rule with a disjunction and another rule. (from tests/programs/unions2/union_with_disjunction.l)

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
U(x:) distinct :- A(x:) | B(x:);
U(x: 100) distinct;
@OrderBy(Q, "x");
Q(x:) :- U(x:);
