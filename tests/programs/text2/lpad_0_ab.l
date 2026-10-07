# Padded on the left to 0 with ab, or cut to 0.
# Expect: rows Q = [(1, ''), (2, ''), (3, ''), (4, ''), (5, None), (6, ''), (7, ''), (8, '')]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Lpad(s, 0, "ab")) :- W(k:, s:);
