# Test: An aggregate over no rows, without a group, is one null row. (from tests/programs/aggregates/07_sum_of_nothing.l)

V(x:) :- x in [1], x > 5;
A(t? += x) distinct :- V(x:);
