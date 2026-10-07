# Test: Filtering on a boolean column. (from tests/programs/boolean/04_filter_on_a_boolean_column.l)

V(x:) :- x in [1, 3];
B(x:, big: x > 2) :- V(x:);
T(x:) :- B(x:, big: true);
