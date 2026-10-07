# The least trimmed text that is not empty.
# Expect: rows Q = [('Hello',)]
W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
Q(m? Min= Trim(s)) distinct :- W(s:), Trim(s) != "";
