# Three predicates sharing one key.
# Expect: rows J = [(1, "a", "b", "c")]
A(k: 1, a: "a");
B(k: 1, b: "b");
C(k: 1, c: "c");
C(k: 2, c: "d");
J(k:, a:, b:, c:) :- A(k:, a:), B(k:, b:), C(k:, c:);
