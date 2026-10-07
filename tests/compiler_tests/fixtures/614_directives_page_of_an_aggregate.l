# Test: A page of grouped rows. (from tests/programs/directives/33_page_of_an_aggregate.l)

V(g:) :- g in ["a", "a", "b", "c"];
@OrderBy(A, "g");
A(g:, n? += 1) distinct :- V(g:);
