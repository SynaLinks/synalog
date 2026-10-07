# A recursive predicate with a column named to.
# Expect: rows Reach = [(2,), (3,)]
Edge(from: 1, to: 2);
Edge(from: 2, to: 3);
@Recursive(Reach, 5);
@OrderBy(Reach, "to");
Reach(to:) distinct :- Edge(from: 1, to:);
Reach(to:) distinct :- Reach(to: x), Edge(from: x, to:);
