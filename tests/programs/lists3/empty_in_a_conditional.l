# A conditional choosing an empty list or a list of text.
# Expect: rows Q = [(1, 0), (2, 2)]
V(k: 1);
V(k: 2);
@OrderBy(Q, "k");
Q(k:, n: Size(l)) :- V(k:), l == (if k == 1 then [] else ["a", "b"]);
