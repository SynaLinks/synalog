# Test: Membership in a concatenation of columns. (from tests/programs/arrays/30_concat_then_membership.l)

V(a: [1, 2], b: [3]);
A(x:) :- V(a:, b:), x in ArrayConcat(a, b), x > 2;
