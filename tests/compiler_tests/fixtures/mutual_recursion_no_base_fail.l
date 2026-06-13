# Compiler Test: Mutual Recursion No Base (should fail)
# Even and Odd mutually recursive without base cases.


Even(x) :- Odd(y), x == y + 1;
Odd(x) :- Even(y), x == y + 1;
Test(x) :- Even(x);
