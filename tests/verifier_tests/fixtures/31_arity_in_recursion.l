# Verifier Test: Arity Mismatch In Recursive Call
# Expected Error: ArityError.arityMismatch
#
# Base case defines 2 arguments but recursive case uses 3.


Edge(a, b) :- a in Range(5), b == a + 1;

Path(a, b) :- Edge(a, b);
# ERROR: Path defined with 2 args but called with 3
Path(a, c) :- Path(a, b, extra), Edge(b, c);

Test(a, b) :- Path(a, b);
