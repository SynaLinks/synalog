# A text column with a null in row 1, read directly.
# Expect: rows Q = [(1, None), (2, 'a'), (3, 'bc')]
V(k: 1, v: null);
V(k: 2, v: "a");
V(k: 3, v: "bc");
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
