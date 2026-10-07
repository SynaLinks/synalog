# Test: Negating a parenthesised conjunction. (from tests/programs/verifier/40_negation_of_a_conjunction.l)

V(x:) :- x in [1, 2, 3];
A(x: 2);
B(x: 2);
B(x: 3);
@OrderBy(Out, "x");
Out(x:) :- V(x:), ~(A(x:), B(x:));
