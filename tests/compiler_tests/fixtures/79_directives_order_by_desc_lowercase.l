# Test: "x desc" in lowercase. (from tests/programs/directives/12_order_by_desc_lowercase.l)

@OrderBy(V, "x desc");
V(x:) :- x in [1, 2];
