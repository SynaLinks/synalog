# Test: An aggregate with no group column over no rows: one row, holding null, as SQL's SUM without GROUP BY (Logica's behaviour, kept). (from tests/programs/execution/33_sum_over_nothing.l)

V(x:) :- x in [1, 2];
Total(t? += x) distinct :- V(x:), x > 10;
