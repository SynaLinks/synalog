# Test: With @Recursive, it verifies. (from tests/programs/verifier/06_recursion_with_depth.l)

@Recursive(Path, 10);
Edge(a: 1, b: 2);
Path(a:, b:) :- Edge(a:, b:);
Path(a:, b: c) :- Path(a:, b:), Edge(a: b, b: c);
