# Test: The two largest groups. (from tests/programs/directives/31_limit_on_an_aggregate.l)

V(g:) :- g in ["a", "a", "b", "c", "c", "c"];
@OrderBy(A, "n desc");
@Limit(A, 2);
A(g:, n? += 1) distinct :- V(g:);
