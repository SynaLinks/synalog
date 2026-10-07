# A text column with a null in row 2, after a join.
# Expect: rows Q = [(1, 'a'), (2, None), (3, 'bc')]
V(k: 1, v: "a");
V(k: 2, v: null);
V(k: 3, v: "bc");
K(k: 1);
K(k: 2);
K(k: 3);
@OrderBy(Q, "k");
Q(k:, r: v) :- K(k:), V(k:, v:);
