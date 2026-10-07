# Padded on the right to 7 with ab, or cut to 7.
# Expect: rows Q = [(1, 'Helloab'), (2, ' a abab'), (3, 'abababa'), (4, 'aaaabab'), (5, None), (6, 'hello w'), (7, 'naïveab'), (8, 'lolabab')]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Rpad(s, 7, "ab")) :- W(k:, s:);
