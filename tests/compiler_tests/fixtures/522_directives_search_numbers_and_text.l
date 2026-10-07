# Test: A search over a number and a text column. (from tests/programs/directives/30_search_numbers_and_text.l)

V(n: 7, t: "x");
V(n: 8, t: "a7");
V(n: 9, t: "b");
@OrderBy(S, "n");
S(n:, t:) :- V(n:, t:);
