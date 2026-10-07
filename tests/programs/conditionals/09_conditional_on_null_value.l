# A conditional testing for null.
# Expect: rows C = [(1, "set"), (2, "unset")]
V(k: 1, x: 5);
V(k: 2, x: null);
@OrderBy(C, "k");
C(k:, w: (if x is null then "unset" else "set")) :- V(k:, x:);
