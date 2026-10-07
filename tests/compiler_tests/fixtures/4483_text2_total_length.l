# Test: The total length of the texts. (from tests/programs/text2/total_length.l)

W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
Q(t? += Length(s)) distinct :- W(s:);
