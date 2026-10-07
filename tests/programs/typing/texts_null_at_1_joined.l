# A texts column with a null in row 2, after a join.
# Expect: rows Q = [(1, 1), (2, None), (3, 2)]
V(k: 1, v: ["a"]);
V(k: 2, v: null);
V(k: 3, v: ["b", "c"]);
K(k: 1);
K(k: 2);
K(k: 3);
@OrderBy(Q, "k");
Q(k:, r: Size(v)) :- K(k:), V(k:, v:);
