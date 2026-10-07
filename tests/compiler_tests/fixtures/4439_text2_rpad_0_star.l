# Test: Padded on the right to 0 with *, or cut to 0. (from tests/programs/text2/rpad_0_star.l)

W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Rpad(s, 0, "*")) :- W(k:, s:);
