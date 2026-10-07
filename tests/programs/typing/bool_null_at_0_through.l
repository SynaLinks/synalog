# A bool column with a null in row 1, through another predicate.
# Expect: rows Q = [(1, None), (2, True), (3, False)]
V(k: 1, v: null);
V(k: 2, v: true);
V(k: 3, v: false);
W(k:, v:) :- V(k:, v:);
@OrderBy(Q, "k");
Q(k:, r: v) :- W(k:, v:);
