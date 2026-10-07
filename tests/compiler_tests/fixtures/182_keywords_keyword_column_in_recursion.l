# Test: A recursive predicate with a column named to. (from tests/programs/keywords/11_keyword_column_in_recursion.l)

Edge(from: 1, to: 2);
Edge(from: 2, to: 3);
@Recursive(Reach, 5);
@OrderBy(Reach, "to");
Reach(to:) distinct :- Edge(from: 1, to:);
Reach(to:) distinct :- Reach(to: x), Edge(from: x, to:);
