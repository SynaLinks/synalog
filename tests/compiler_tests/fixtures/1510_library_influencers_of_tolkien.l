# Test: Authors who influenced tolkien, directly or not. (from tests/programs/library/influencers_of_tolkien.l)

Influenced(a: "austen", b: "tolkien");
Influenced(a: "tolkien", b: "herbert");
Influenced(a: "herbert", b: "gibson");
Influenced(a: "asimov", b: "herbert");
@Recursive(Down, 6);
Down(a:, b:) distinct :- Influenced(a:, b:);
Down(a:, b: c) distinct :- Down(a:, b:), Influenced(a: b, b: c);
Q(a:) :- Down(a:, b: "tolkien");
