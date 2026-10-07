# Test: Values as text from A and as text with a mark from B, at most 3. (from tests/programs/unions2/text_union_3.l)

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
U(s: ToString(x)) :- A(x:), x <= 3;
U(s: ToString(x) ++ "*") :- B(x:), x <= 3;
@OrderBy(Q, "s");
Q(s:) :- U(s:);
