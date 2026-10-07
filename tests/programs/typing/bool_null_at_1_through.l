# A bool column with a null in row 2, through another predicate.
# Expect: rows Q = [(1, True), (2, None), (3, False)]
V(k: 1, v: true);
V(k: 2, v: null);
V(k: 3, v: false);
W(k:, v:) :- V(k:, v:);
@OrderBy(Q, "k");
Q(k:, r: v) :- W(k:, v:);
