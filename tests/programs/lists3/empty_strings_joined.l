# Joining lists of text, one empty, one null.
# Expect: rows Q = [(1, "a+b"), (2, ""), (3, None)]
S(k: 1, l: ["a", "b"]);
S(k: 2, l: []);
S(k: 3, l: null);
@OrderBy(Q, "k");
Q(k:, s: Join(l, "+")) :- S(k:, l:);
