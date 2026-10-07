# Test: ' ' replaced by '_' everywhere. (from tests/programs/text2/replace_space_to_underscore.l)

W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, v: Replace(s, " ", "_")) :- W(k:, s:);
