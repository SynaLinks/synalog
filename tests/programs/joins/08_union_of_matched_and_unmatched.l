# A left-join-like union: matched rows, then unmatched ones.
# Expect: rows L = [(1, "a"), (2, "none")]
A(id:) :- id in [1, 2];
B(id: 1, v: "a");
@OrderBy(L, "id");
L(id:, v:) :- A(id:), B(id:, v:);
L(id:, v: "none") :- A(id:), ~B(id:);
