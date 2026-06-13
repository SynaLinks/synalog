# Test: Transitivity patterns
@Engine("duckdb");

# Graph edges
Edge(1, 2);
Edge(2, 3);
Edge(3, 4);
Edge(4, 5);
Edge(5, 1);

# Transitive closure base case
Reachable(x, y) :- Edge(x, y);

# Transitive closure recursive case
Reachable(x, z) :- Reachable(x, y), Edge(y, z);

# Symmetry pattern (if A knows B, then B knows A)
Knows("Alice", "Bob");
Knows("Bob", "Charlie");
SymKnows(a, b) :- Knows(a, b);
SymKnows(a, b) :- Knows(b, a);

# Reflexivity (every node reaches itself)
Node(x) :- Edge(x, _);
Node(y) :- Edge(_, y);
Reflexive(x, x) :- Node(x);

@OrderBy(Test, "x", "y");
Test(x:, y:) :- Edge(x, y);
