# A conditional whose branches are a null and a number.
# Expect: rows Q = [(1, None), (2, 4)]
V(k: 1);
V(k: 2);
@OrderBy(Q, "k");
Q(k:, v: (if k == 1 then null else k * 2)) :- V(k:);
