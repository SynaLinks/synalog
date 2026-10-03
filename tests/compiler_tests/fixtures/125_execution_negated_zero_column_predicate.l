# Test: Negating a predicate with no column. (from tests/programs/execution/42_negated_zero_column_predicate.l)

V(x:) :- x in [1, 2];
HasTwo() :- V(x: 2);
Out(x:) :- V(x:), ~HasTwo();
