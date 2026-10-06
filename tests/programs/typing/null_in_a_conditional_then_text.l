# A conditional whose branches are a null and a text.
# Expect: rows Q = [(1, None), (2, "two")]
V(k: 1);
V(k: 2);
@OrderBy(Q, "k");
Q(k:, v: (if k == 1 then null else "two")) :- V(k:);
