# Test: ArgMax over a keyword column. (from tests/programs/keywords/14_keyword_column_argmax.l)

S(order: 1, s: 5);
S(order: 2, s: 9);
Best(order? ArgMax= order -> s) distinct :- S(order:, s:);
