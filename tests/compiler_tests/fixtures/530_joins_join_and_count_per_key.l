# Test: Counting the matches of each key. (from tests/programs/joins/18_join_and_count_per_key.l)

K(k:) :- k in [1, 2];
M(k: 1);
M(k: 1);
M(k: 2);
@OrderBy(J, "k");
J(k:, n? += 1) distinct :- K(k:), M(k:);
