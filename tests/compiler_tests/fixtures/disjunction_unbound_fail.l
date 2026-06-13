# Compiler Test: Disjunction Unbound (should fail)
# Variable 'y' not bound in all disjunction branches.


A(x) :- x in Range(10);
B(x, y) :- x in Range(5), y == x * 2;
Test(x, y) :- (A(x) | B(x, y));
