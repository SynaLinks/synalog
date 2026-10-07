# Where '' first is, from 1; 0 when it is not there.
# Expect: rows Q = [(1, 1), (2, 1), (3, 1), (4, 1), (5, None), (6, 1), (7, 1), (8, 1)]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Strpos(s, "")) :- W(k:, s:);
