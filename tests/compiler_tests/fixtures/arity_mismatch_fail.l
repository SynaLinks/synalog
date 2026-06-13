# Compiler Test: Arity Mismatch (should fail)
# Data defined with 2 args but called with 3.


Data(x, y) :- x in Range(5), y == x * 2;
Test(a, b, c) :- Data(a, b, c);
