# Test: A recursive predicate named after a SQL keyword. (from tests/programs/execution/72_recursion_keyword_name.l)

Edge(a: 1, b: 2);
Edge(a: 2, b: 3);
@Recursive(Select, 5);
Select(x: 1) distinct;
Select(x: b) distinct :- Select(x: a), Edge(a:, b:);
Count(n? += 1) distinct :- Select();
