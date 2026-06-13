# Test: Recursion

# Graph edges
Edge(1, 2);
Edge(2, 3);
Edge(3, 4);
Edge(4, 5);
Edge(1, 3);

# Recursive transitive closure
@Recursive(Reachable, 10);
Reachable(a, b) :- Edge(a, b);
Reachable(a, c) :- Reachable(a, b), Edge(b, c);

# Recursive distance calculation
@Recursive(Distance, 10);
Distance(a, b) Min= 1 :- Edge(a, b);
Distance(a, c) Min= Distance(a, b) + 1 :- Distance(a, b), Edge(b, c);

@OrderBy(Test, "src", "dst");
Test(src: a, dst: b, distance: Distance(a, b)) :- Reachable(a, b);
