# 1 characters from position 2; fewer past the end.
# Expect: rows Q = [(1, 'e'), (2, 'a'), (3, ''), (4, 'a'), (5, None), (6, 'e'), (7, 'a'), (8, 'o')]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Substr(s, 2, 1)) :- W(k:, s:);
