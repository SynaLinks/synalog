# Test: Several aggregates of one column. (from tests/programs/agg2/min_max_avg.l)

V(n: "a", s: 3);
V(n: "b", s: 9);
V(n: "c", s: 1);
V(n: "d", s: 5);
A(lo? Min= s, hi? Max= s, a? Avg= s) distinct :- V(n:, s:);
