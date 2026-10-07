# Test: The greatest reversed text. (from tests/programs/text2/max_reversed.l)

W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
Q(m? Max= Reverse(s)) distinct :- W(s:);
