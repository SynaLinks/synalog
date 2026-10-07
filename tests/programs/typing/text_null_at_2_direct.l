# A text column with a null in row 3, read directly.
# Expect: rows Q = [(1, 'a'), (2, 'bc'), (3, None)]
V(k: 1, v: "a");
V(k: 2, v: "bc");
V(k: 3, v: null);
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
