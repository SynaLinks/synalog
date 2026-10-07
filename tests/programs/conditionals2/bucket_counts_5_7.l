# Rows per bucket below 5, below 7, above.
# Expect: rows Q = [('high', 2), ('low', 2), ('mid', 1)]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "b");
Q(b: (if x < 5 then "low" else if x < 7 then "mid" else "high"), n? += 1) distinct :- V(x:), x is not null;
