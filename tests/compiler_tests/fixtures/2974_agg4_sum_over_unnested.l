# Test: A sum over the elements of lists. (from tests/programs/agg4/sum_over_unnested.l)

L(k: "a", l: [1, 2, 3]);
L(k: "b", l: [10]);
@OrderBy(Q, "k", "t");
Q(k:, t? += x) distinct :- L(k:, l:), x in l;
