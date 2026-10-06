# Sizes: an empty list has none, a null list no size.
# Expect: rows Q = [(1, 2), (2, 0), (3, None)]
S(k: 1, l: ["a", "b"]);
S(k: 2, l: []);
S(k: 3, l: null);
@OrderBy(Q, "k");
Q(k:, n: Size(l)) :- S(k:, l:);
