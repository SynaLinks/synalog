# Two tables of 20000 rows joined on keys compared with `is`, 20 of each
# null: 19980 pairs of equal keys and 400 of null keys. Comparing with nulls
# matching must keep a hash join: a nested loop compares 400 million pairs.
# Expect: rows Matches = [(20380,)]
# Expect: rows NullMatches = [(400,)]
# Expect: within 60
# 20000 numbers from two ranges (Trino's sequences hold 10000 at most).
N(i: 200 * a + b) :- a in Range(100), b in Range(200);
L(i:, k: i) :- N(i:), i % 1000 != 0;
L(i:, k: ToInt64(null)) :- N(i:), i % 1000 == 0;
R(j: i, k: i) :- N(i:), i % 1000 != 0;
R(j: i, k: ToInt64(null)) :- N(i:), i % 1000 == 0;
# Computed once into tables, as stored data would be.
@Ground(L);
@Ground(R);
Matches(n? += 1) distinct :- L(k:), R(k: k2), k is k2;
NullMatches(n? += 1) distinct :- L(k:), R(k: k2), k is k2, k is null;
