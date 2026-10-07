# A join filtered on both sides.
# Expect: rows J = [(2, "b")]
A(k:) :- k in [1, 2, 3];
B(k: 1, v: "a");
B(k: 2, v: "b");
B(k: 3, v: "c");
J(k:, v:) :- A(k:), B(k:, v:), k > 1, v != "c";
