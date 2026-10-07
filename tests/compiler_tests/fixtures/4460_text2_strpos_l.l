# Test: Where 'l' first is, from 1; 0 when it is not there. (from tests/programs/text2/strpos_l.l)

W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Strpos(s, "l")) :- W(k:, s:);
