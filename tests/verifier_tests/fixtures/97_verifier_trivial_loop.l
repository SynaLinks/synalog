# Verifier Test: The recursive case calls itself with the same arguments.
# Expected Error: RecursionError.trivialLoop
#
# (from tests/programs/verifier/07_trivial_loop.l)

@Recursive(Path, 10);
Edge(a: 1, b: 2);
Path(a:, b:) :- Edge(a:, b:);
Path(a:, b:) :- Path(a:, b:);
