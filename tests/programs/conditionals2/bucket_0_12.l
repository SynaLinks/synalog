# Buckets below 0, below 12, and above.
# Expect: rows Q = [(1, 'mid'), (2, 'low'), (3, 'mid'), (4, None), (5, 'high'), (6, 'mid')]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, b: (if x is null then null else if x < 0 then "low" else if x < 12 then "mid" else "high")) :- V(k:, x:);
