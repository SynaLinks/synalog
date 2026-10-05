# Authors who influenced herbert, directly or not.
# Expect: rows Q = [('asimov',), ('austen',), ('tolkien',)]
Influenced(a: "austen", b: "tolkien");
Influenced(a: "tolkien", b: "herbert");
Influenced(a: "herbert", b: "gibson");
Influenced(a: "asimov", b: "herbert");
@Recursive(Down, 6);
Down(a:, b:) distinct :- Influenced(a:, b:);
Down(a:, b: c) distinct :- Down(a:, b:), Influenced(a: b, b: c);
@OrderBy(Q, "a");
Q(a:) :- Down(a:, b: "herbert");
