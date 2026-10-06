# A text column with a null in row 1, through another predicate.
# Expect: rows Q = [(1, None), (2, 'a'), (3, 'bc')]
V(k: 1, v: null);
V(k: 2, v: "a");
V(k: 3, v: "bc");
W(k:, v:) :- V(k:, v:);
@OrderBy(Q, "k");
Q(k:, r: v) :- W(k:, v:);
