# Test: A null column joined with a number column on another key. (from tests/programs/typing/null_joined_to_number.l)

A(k: 1, v: null);
B(k: 1, w: 5);
Q(k:, v:, w:) :- A(k:, v:), B(k:, w:);
