# Test: A negation over a column named select. (from tests/programs/keywords/04_column_select_in_negation.l)

V(select:) :- select in [1, 2];
Banned(select: 1);
Out(select:) :- V(select:), ~Banned(select:);
