# Rows per bucket below 2, below 3, above.
# Expect: rows Q = [('high', 3), ('low', 2)]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "b");
Q(b: (if x < 2 then "low" else if x < 3 then "mid" else "high"), n? += 1) distinct :- V(x:), x is not null;
