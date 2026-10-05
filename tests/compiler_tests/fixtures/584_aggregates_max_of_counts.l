# Test: The largest group size. (from tests/programs/aggregates/25_max_of_counts.l)

V(g:) :- g in ["a", "a", "a", "b", "c", "c"];
C(g:, n? += 1) distinct :- V(g:);
A(m? Max= n) distinct :- C(n:);
