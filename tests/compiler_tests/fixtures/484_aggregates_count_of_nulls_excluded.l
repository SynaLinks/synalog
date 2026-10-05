# Test: Counting the non-null values with a conditional. (from tests/programs/aggregates/21_count_of_nulls_excluded.l)

V(x: 1);
V(x: null);
V(x: 3);
A(n? += (if x is null then 0 else 1)) distinct :- V(x:);
