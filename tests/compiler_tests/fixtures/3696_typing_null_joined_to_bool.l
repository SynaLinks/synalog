# Test: A null column joined with a bool column on another key. (from tests/programs/typing/null_joined_to_bool.l)

A(k: 1, v: null);
B(k: 1, w: true);
Q(k:, v:, w:) :- A(k:, v:), B(k:, w:);
