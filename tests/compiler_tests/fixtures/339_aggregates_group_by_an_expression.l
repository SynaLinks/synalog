# Test: Grouping by a computed key. (from tests/programs/aggregates/10_group_by_an_expression.l)

V(x:) :- x in [1, 2, 3, 4, 5];
@OrderBy(A, "k");
A(k: x % 2, n? += 1) distinct :- V(x:);
