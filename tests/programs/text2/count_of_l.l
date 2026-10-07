# How many times l is in a text: the length lost by removing it.
# Expect: rows Q = [(1, 2), (2, 0), (3, 0), (4, 0), (5, None), (6, 3), (7, 0), (8, 2)]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Length(s) - Length(Replace(s, "l", ""))) :- W(k:, s:);
