# A bool column with a null in row 3, read directly.
# Expect: rows Q = [(1, True), (2, False), (3, None)]
V(k: 1, v: true);
V(k: 2, v: false);
V(k: 3, v: null);
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
