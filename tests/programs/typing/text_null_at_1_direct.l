# A text column with a null in row 2, read directly.
# Expect: rows Q = [(1, 'a'), (2, None), (3, 'bc')]
V(k: 1, v: "a");
V(k: 2, v: null);
V(k: 3, v: "bc");
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
