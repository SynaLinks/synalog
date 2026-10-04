# Test: Coalesce makes a null key join. (from tests/programs/nulls/08_coalesce_in_a_join_key.l)

A(k: null, v: "a");
B(k: "none", w: "default");
J(v:, w:) :- A(k:, v:), B(k: Coalesce(k, "none"), w:);
