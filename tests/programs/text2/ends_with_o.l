# Whether a text ends with 'o'.
# Expect: rows Q = [(1, True), (2, False), (3, False), (4, False), (5, None), (6, False), (7, False), (8, False)]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: EndsWith(s, "o")) :- W(k:, s:);
