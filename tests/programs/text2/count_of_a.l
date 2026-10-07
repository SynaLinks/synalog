# How many times a is in a text: the length lost by removing it.
# Expect: rows Q = [(1, 0), (2, 1), (3, 0), (4, 3), (5, None), (6, 0), (7, 1), (8, 0)]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Length(s) - Length(Replace(s, "a", ""))) :- W(k:, s:);
