# Membership in lists of text, one empty, one null.
# Expect: rows Q = [(1,)]
S(k: 1, l: ["a", "b"]);
S(k: 2, l: []);
S(k: 3, l: null);
Q(k:) :- S(k:, l:), "a" in l;
