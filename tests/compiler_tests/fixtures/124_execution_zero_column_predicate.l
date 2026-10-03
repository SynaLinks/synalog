# Test: A predicate with no column, used as a condition. (from tests/programs/execution/41_zero_column_predicate.l)

V(x:) :- x in [1, 2];
HasTwo() :- V(x: 2);
@OrderBy(Out, "x");
Out(x:) :- V(x:), HasTwo();
