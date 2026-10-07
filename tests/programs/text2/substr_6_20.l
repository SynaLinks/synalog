# 20 characters from position 6; fewer past the end.
# Expect: rows Q = [(1, ''), (2, ''), (3, ''), (4, ''), (5, None), (6, ' world'), (7, ''), (8, '')]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Substr(s, 6, 20)) :- W(k:, s:);
