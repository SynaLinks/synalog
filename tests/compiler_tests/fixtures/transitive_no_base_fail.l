# Compiler Test: Transitive No Base (should fail)
# Transitive closure without base case.


Edge(a, b) :- a in Range(5), b == a + 1;
Reach(a, c) :- Reach(a, b), Edge(b, c);
Test(a, b) :- Reach(a, b);
