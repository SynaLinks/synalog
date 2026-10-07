# A field named group.
# Expect: rows Q = [(1, 2), (2, 4)]
V(k: 1);
V(k: 2);
R(k:, r: {group: k * 2}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.group) :- R(k:, r:);
