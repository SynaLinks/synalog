# Test: distinct keeps one of equal rows. (from tests/programs/dedup/02_distinct_removes_duplicates.l)

V(x: 1);
V(x: 1);
D(x:) distinct :- V(x:);
C(n? += 1) distinct :- D(x:);
