# Authors herbert influenced, directly or not.
# Expect: rows Q = [('gibson',)]
Influenced(a: "austen", b: "tolkien");
Influenced(a: "tolkien", b: "herbert");
Influenced(a: "herbert", b: "gibson");
Influenced(a: "asimov", b: "herbert");
@Recursive(Down, 6);
Down(a:, b:) distinct :- Influenced(a:, b:);
Down(a:, b: c) distinct :- Down(a:, b:), Influenced(a: b, b: c);
Q(b:) :- Down(a: "herbert", b:);
