# A record field named trim, a reserved word on some engine.
# Expect: rows Q = [(1, 3), (2, 6)]
V(k: 1);
V(k: 2);
R(k:, r: {trim: k * 3, other: k}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.trim) :- R(k:, r:);
