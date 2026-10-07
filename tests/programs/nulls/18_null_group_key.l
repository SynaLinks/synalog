# Rows with a null key form one group.
# Expect: rows N = [(None, 2), (1, 1)]
V(g: null, x: 1);
V(g: null, x: 2);
V(g: 1, x: 3);
@OrderBy(N, "g nulls first");
N(g:, n? += 1) distinct :- V(g:, x:);
