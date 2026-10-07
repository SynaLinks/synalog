# Test: The texts that are empty or null: an empty text is not null. (from tests/programs/text2/empty_or_null.l)

W(k: 1, s: "Hello");
W(k: 2, s: " a ");
W(k: 3, s: "");
W(k: 4, s: "aaa");
W(k: 5, s: null);
W(k: 6, s: "hello world");
W(k: 7, s: "naïve");
W(k: 8, s: "lol");
@OrderBy(Q, "k");
Q(k:, null_text: s is null) :- W(k:, s:), s is null || s == "";
