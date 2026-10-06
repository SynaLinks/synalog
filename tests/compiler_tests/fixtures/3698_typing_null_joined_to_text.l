# Test: A null column joined with a text column on another key. (from tests/programs/typing/null_joined_to_text.l)

A(k: 1, v: null);
B(k: 1, w: "x");
Q(k:, v:, w:) :- A(k:, v:), B(k:, w:);
