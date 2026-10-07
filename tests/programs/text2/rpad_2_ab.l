# Padded on the right to 2 with ab, or cut to 2.
# Expect: rows Q = [(1, 'He'), (2, ' a'), (3, 'ab'), (4, 'aa'), (5, None), (6, 'he'), (7, 'na'), (8, 'lo')]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Rpad(s, 2, "ab")) :- W(k:, s:);
