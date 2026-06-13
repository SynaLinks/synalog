# Test: Recursive predicates with @Recursive annotation

# Graph edges
Edge(1, 2);
Edge(2, 3);
Edge(3, 4);
Edge(4, 5);
Edge(5, 6);
Edge(6, 7);

# Transitive closure with iteration limit
@Recursive(Reachable, 10);
Reachable(x, y) :- Edge(x, y);
Reachable(x, z) :- Reachable(x, y), Edge(y, z);

# Path length tracking
@Recursive(PathLen, 10);
PathLen(x, y, 1) :- Edge(x, y);
PathLen(x, z, len) :-
  PathLen(x, y, prev_len),
  Edge(y, z),
  len == prev_len + 1;

# Shortest path (using Min aggregation)
@Recursive(ShortestPath, 10);
ShortestPath(x, y, min_len? Min= 1) distinct :- Edge(x, y);
ShortestPath(x, z, min_len? Min= len) distinct :-
  ShortestPath(x, y, min_len: prev),
  Edge(y, z),
  len == prev + 1;

@OrderBy(Test, "x", "y");
Test(x:, y:) :- Reachable(x, y);
