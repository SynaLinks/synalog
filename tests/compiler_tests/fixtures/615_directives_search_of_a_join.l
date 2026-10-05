# Test: A search over a joined predicate. (from tests/programs/directives/34_search_of_a_join.l)

A(k: 1, c: "paris");
A(k: 2, c: "lyon");
B(k:) :- k in [1, 2];
@OrderBy(J, "k");
J(k:, c:) :- A(k:, c:), B(k:);
