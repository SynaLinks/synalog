# A texts column with a null in row 2, through another predicate.
# Expect: rows Q = [(1, 1), (2, None), (3, 2)]
V(k: 1, v: ["a"]);
V(k: 2, v: null);
V(k: 3, v: ["b", "c"]);
W(k:, v:) :- V(k:, v:);
@OrderBy(Q, "k");
Q(k:, r: Size(v)) :- W(k:, v:);
