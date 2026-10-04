# Test: A left-join-like union: matched rows, then unmatched ones. (from tests/programs/joins/08_union_of_matched_and_unmatched.l)

A(id:) :- id in [1, 2];
B(id: 1, v: "a");
@OrderBy(L, "id");
L(id:, v:) :- A(id:), B(id:, v:);
L(id:, v: "none") :- A(id:), ~B(id:);
