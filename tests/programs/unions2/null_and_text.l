# A null from one rule, texts from another.
# Expect: rows Q = [(1, None), (2, "b"), (3, "c")]
U(k: 1, s: null);
U(k:, s:) :- k in [2, 3], s == (if k == 2 then "b" else "c");
@OrderBy(Q, "k");
Q(k:, s:) :- U(k:, s:);
