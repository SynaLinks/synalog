# Test: Padded on the left to 7 with ab, or cut to 7. (from tests/programs/text2/lpad_7_ab.l)

W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Lpad(s, 7, "ab")) :- W(k:, s:);
