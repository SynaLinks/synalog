# Whether a text starts with ''.
# Expect: rows Q = [(1, True), (2, True), (3, True), (4, True), (5, None), (6, True), (7, True), (8, True)]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: StartsWith(s, "")) :- W(k:, s:);
