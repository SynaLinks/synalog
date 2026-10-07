# Values as text from A and as text with a mark from B, at most 5.
# Expect: rows Q = [('1',), ('2',), ('3',), ('4',), ('4*',), ('5',), ('5*',)]
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
U(s: ToString(x)) :- A(x:), x <= 5;
U(s: ToString(x) ++ "*") :- B(x:), x <= 5;
@OrderBy(Q, "s");
Q(s:) :- U(s:);
