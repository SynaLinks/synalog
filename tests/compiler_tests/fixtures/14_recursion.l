# Test: Multi-hop joins (simplified from recursion)

# Graph edges
Edge(1, 2);
Edge(2, 3);
Edge(3, 4);
Edge(4, 5);
Edge(1, 3);

# Direct connections (single hop)
DirectPath(a, b) :- Edge(a, b);

# Two-hop paths
TwoHop(a, c) :- Edge(a, b), Edge(b, c);

@OrderBy(Test, "src", "dst");
Test(src: a, dst: b) :- DirectPath(a, b);
