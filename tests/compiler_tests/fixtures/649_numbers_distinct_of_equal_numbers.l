# Test: 2 and 2.0 written as rows of one column. (from tests/programs/numbers/04_distinct_of_equal_numbers.l)

V(x: 2.0);
V(x: 2.0);
D(x:) distinct :- V(x:);
N(n? += 1) distinct :- D(x:);
