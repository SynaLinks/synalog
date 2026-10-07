# @OrderBy on two columns, the second descending.
# Expect: rows S = [("a", 2), ("a", 1), ("b", 3)]
R(k: "b", v: 3);
R(k: "a", v: 1);
R(k: "a", v: 2);
@OrderBy(S, "k", "v DESC");
S(k:, v:) :- R(k:, v:);
