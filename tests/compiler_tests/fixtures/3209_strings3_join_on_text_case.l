# Test: A join on text tells cases apart. (from tests/programs/strings3/join_on_text_case.l)

A(k: "x", a: 1);
B(k: "x", b: 10);
B(k: "X", b: 20);
Q(a:, b:) :- A(k:, a:), B(k:, b:);
