# A bool column with a null in row 2, read directly.
# Expect: rows Q = [(1, True), (2, None), (3, False)]
V(k: 1, v: true);
V(k: 2, v: null);
V(k: 3, v: false);
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
