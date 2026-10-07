# Texts equal ignoring case: a join on Upper.
# Expect: rows Q = []
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "a", "b");
Q(a:, b:) :- W(k: a, s: x), W(k: b, s: y), a < b, Upper(x) == Upper(y);
