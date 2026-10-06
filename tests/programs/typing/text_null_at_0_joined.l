# A text column with a null in row 1, after a join.
# Expect: rows Q = [(1, None), (2, 'a'), (3, 'bc')]
V(k: 1, v: null);
V(k: 2, v: "a");
V(k: 3, v: "bc");
K(k: 1);
K(k: 2);
K(k: 3);
@OrderBy(Q, "k");
Q(k:, r: v) :- K(k:), V(k:, v:);
