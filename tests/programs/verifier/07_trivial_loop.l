# The recursive case calls itself with the same arguments.
# Expect: error Trivial infinite loop

@Recursive(Path, 10);
Edge(a: 1, b: 2);
Path(a:, b:) :- Edge(a:, b:);
Path(a:, b:) :- Path(a:, b:);
