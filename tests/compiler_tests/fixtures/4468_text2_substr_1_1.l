# Test: 1 characters from position 1; fewer past the end. (from tests/programs/text2/substr_1_1.l)

W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Substr(s, 1, 1)) :- W(k:, s:);
