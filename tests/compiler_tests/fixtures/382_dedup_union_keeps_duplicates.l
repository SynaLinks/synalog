# Test: Two rules giving the same row give it twice. (from tests/programs/dedup/03_union_keeps_duplicates.l)

U(x: 1);
U(x:) :- x in [1];
C(n? += 1) distinct :- U(x:);
