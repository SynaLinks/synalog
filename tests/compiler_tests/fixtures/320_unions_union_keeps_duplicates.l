# Test: A union without distinct keeps duplicates. (from tests/programs/unions/03_union_keeps_duplicates.l)

U(x:) :- x in [1, 2];
U(x:) :- x in [2, 3];
N(n? += 1) distinct :- U();
