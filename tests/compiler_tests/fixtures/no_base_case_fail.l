# Compiler Test: No Base Case (should fail)
# Recursive predicate without base case.


Loop(x) :- Loop(y), x == y + 1;
Test(x) :- Loop(x);
