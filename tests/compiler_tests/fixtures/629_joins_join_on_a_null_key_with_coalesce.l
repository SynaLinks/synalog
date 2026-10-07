# Test: Matching null keys through a default. (from tests/programs/joins/23_join_on_a_null_key_with_coalesce.l)

A(k: null);
B(k: "none");
J(k:) :- A(k: a), B(k:), Coalesce(a, "none") == k;
