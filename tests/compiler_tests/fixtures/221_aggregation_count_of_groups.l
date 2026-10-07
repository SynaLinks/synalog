# Test: Counting the groups. (from tests/programs/aggregation/06_count_of_groups.l)

R(k: "a", v: 1);
R(k: "a", v: 2);
R(k: "b", v: 5);
G(k:) distinct :- R(k:);
N(n? += 1) distinct :- G();
