# Verifier Test: Recursion needs @Recursive.
# Expected Error: RecursionError.unboundedRecursion
#
# (from tests/programs/verifier/05_recursion_without_depth.l)

Edge(a: 1, b: 2);
Path(a:, b:) :- Edge(a:, b:);
Path(a:, b: c) :- Path(a:, b:), Edge(a: b, b: c);
