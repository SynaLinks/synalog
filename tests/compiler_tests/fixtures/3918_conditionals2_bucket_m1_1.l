# Test: Buckets below -1, below 1, and above. (from tests/programs/conditionals2/bucket_m1_1.l)

V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, b: (if x is null then null else if x < -1 then "low" else if x < 1 then "mid" else "high")) :- V(k:, x:);
