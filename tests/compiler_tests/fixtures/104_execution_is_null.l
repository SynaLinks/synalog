# Test: Filtering null values. (from tests/programs/execution/21_is_null.l)

R(x: 1);
R(x: null);
Known(x:) :- R(x:), ~IsNull(x);
