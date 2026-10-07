# 'o' replaced by '0' everywhere.
# Expect: rows Q = [(1, 'Hell0'), (2, ' a '), (3, ''), (4, 'aaa'), (5, None), (6, 'hell0 w0rld'), (7, 'naïve'), (8, 'l0l')]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Replace(s, "o", "0")) :- W(k:, s:);
