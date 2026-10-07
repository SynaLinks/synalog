# Texts per length; the null text left out.
# Expect: rows Q = [(0, 1), (3, 3), (5, 2), (11, 1)]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "l");
Q(l: Length(s), n? += 1) distinct :- W(s:), s is not null;
