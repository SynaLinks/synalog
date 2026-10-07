# Test: Counting the distinct values of a union. (from tests/programs/unions/07_union_then_count_distinct.l)

U(x:) :- x in [1, 2];
U(x:) :- x in [2, 3];
D(x:) distinct :- U(x:);
C(n? += 1) distinct :- D(x:);
