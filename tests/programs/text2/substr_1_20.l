# 20 characters from position 1; fewer past the end.
# Expect: rows Q = [(1, 'Hello'), (2, ' a '), (3, ''), (4, 'aaa'), (5, None), (6, 'hello world'), (7, 'naïve'), (8, 'lol')]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Substr(s, 1, 20)) :- W(k:, s:);
