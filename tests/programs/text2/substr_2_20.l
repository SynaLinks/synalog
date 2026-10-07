# 20 characters from position 2; fewer past the end.
# Expect: rows Q = [(1, 'ello'), (2, 'a '), (3, ''), (4, 'aa'), (5, None), (6, 'ello world'), (7, 'aïve'), (8, 'ol')]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Substr(s, 2, 20)) :- W(k:, s:);
