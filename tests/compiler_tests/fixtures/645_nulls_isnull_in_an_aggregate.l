# Test: Counting the nulls of a column. (from tests/programs/nulls/25_isnull_in_an_aggregate.l)

V(x: null);
V(x: 1);
V(x: null);
N(n? += (if IsNull(x) then 1 else 0)) distinct :- V(x:);
