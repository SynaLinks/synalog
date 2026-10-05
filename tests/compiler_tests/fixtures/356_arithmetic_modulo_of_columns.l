# Test: Remainders of columns. (from tests/programs/arithmetic/13_modulo_of_columns.l)

V(a: 10, b: 3);
V(a: 12, b: 5);
@OrderBy(A, "a");
A(a:, b:, r: a % b) :- V(a:, b:);
