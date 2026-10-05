# Test: Three predicates sharing one key. (from tests/programs/joins/21_join_three_on_one_key.l)

A(k: 1, a: "a");
B(k: 1, b: "b");
C(k: 1, c: "c");
C(k: 2, c: "d");
J(k:, a:, b:, c:) :- A(k:, a:), B(k:, b:), C(k:, c:);
