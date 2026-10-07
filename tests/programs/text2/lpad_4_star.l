# Padded on the left to 4 with *, or cut to 4.
# Expect: rows Q = [(1, 'Hell'), (2, '* a '), (3, '****'), (4, '*aaa'), (5, None), (6, 'hell'), (7, 'naïv'), (8, '*lol')]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Lpad(s, 4, "*")) :- W(k:, s:);
