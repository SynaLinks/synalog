# Compiler Test: Nested Disjunction Unbound (should fail)
# Variable not bound in all paths through nested disjunction.


A(x) :- x in Range(10);
B(x, y) :- x in Range(5), y == x + 1;
C(x, y, z) :- x in Range(3), y == x, z == x + 2;
Test(x, y, z) :- (A(x) | (B(x, y) | C(x, y, z)));
