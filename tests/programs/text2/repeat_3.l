# A text repeated 3 times.
# Expect: rows Q = [(1, 'HelloHelloHello'), (2, ' a  a  a '), (3, ''), (4, 'aaaaaaaaa'), (5, None), (6, 'hello worldhello worldhello world'), (7, 'naïvenaïvenaïve'), (8, 'lollollol')]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Repeat(s, 3)) :- W(k:, s:);
