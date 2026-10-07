# @Recursive bounds the number of steps: depth 2 reaches two hops past the base.
# Expect: valid
Edge(x: 1, y: 2);
Edge(x: 2, y: 3);
Edge(x: 3, y: 4);
Edge(x: 4, y: 5);
Edge(x: 5, y: 6);
@Recursive(Reach, 20);
@OrderBy(Reach, "y");
Reach(y: 1) distinct;
Reach(y:) distinct :- Reach(y: x), Edge(x:, y:);
# Expect: rows Reach = [(1,), (2,), (3,), (4,), (5,), (6,)]
