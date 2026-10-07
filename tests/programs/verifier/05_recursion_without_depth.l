# Recursion needs @Recursive.
# Expect: error missing @Recursive

Edge(a: 1, b: 2);
Path(a:, b:) :- Edge(a:, b:);
Path(a:, b: c) :- Path(a:, b:), Edge(a: b, b: c);
