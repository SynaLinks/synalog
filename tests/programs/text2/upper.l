# Upper case, accented letters too.
# Expect: rows Q = [(1, 'HELLO'), (2, ' A '), (3, ''), (4, 'AAA'), (5, None), (6, 'HELLO WORLD'), (7, 'NAÏVE'), (8, 'LOL')]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Upper(s)) :- W(k:, s:);
