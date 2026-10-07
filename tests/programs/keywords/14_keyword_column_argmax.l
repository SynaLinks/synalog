# ArgMax over a keyword column.
# Expect: rows Best = [(2,)]
S(order: 1, s: 5);
S(order: 2, s: 9);
Best(order? ArgMax= order -> s) distinct :- S(order:, s:);
