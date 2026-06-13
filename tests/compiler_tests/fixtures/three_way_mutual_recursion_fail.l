# Compiler Test: Three Way Mutual Recursion (should fail)
# A->B->C->A cycle without base cases.


A(x) :- B(y), x == y + 1;
B(x) :- C(y), x == y + 1;
C(x) :- A(y), x == y + 1;
Test(x) :- A(x);
