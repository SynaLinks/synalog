# Test: A predicate without distinct keeps duplicate rows. (from tests/programs/dedup/01_duplicates_kept.l)

V(x: 1);
V(x: 1);
C(n? += 1) distinct :- V(x:);
