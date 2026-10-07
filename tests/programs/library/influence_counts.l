# How many authors each influenced.
# Expect: rows Q = [('asimov', 2), ('austen', 3), ('herbert', 1), ('tolkien', 2)]
Influenced(a: "austen", b: "tolkien");
Influenced(a: "tolkien", b: "herbert");
Influenced(a: "herbert", b: "gibson");
Influenced(a: "asimov", b: "herbert");
@Recursive(Down, 6);
Down(a:, b:) distinct :- Influenced(a:, b:);
Down(a:, b: c) distinct :- Down(a:, b:), Influenced(a: b, b: c);
@OrderBy(Q, "a", "n");
Q(a:, n? += 1) distinct :- Down(a:);
