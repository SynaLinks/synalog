# A text reversed, accents kept.
# Expect: rows Q = [(1, 'olleH'), (2, ' a '), (3, ''), (4, 'aaa'), (5, None), (6, 'dlrow olleh'), (7, 'evïan'), (8, 'lol')]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Reverse(s)) :- W(k:, s:);
