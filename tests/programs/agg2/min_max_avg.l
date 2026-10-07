# Several aggregates of one column.
# Expect: rows A = [(1, 9, 4.5)]
V(n: "a", s: 3);
V(n: "b", s: 9);
V(n: "c", s: 1);
V(n: "d", s: 5);
A(lo? Min= s, hi? Max= s, a? Avg= s) distinct :- V(n:, s:);
