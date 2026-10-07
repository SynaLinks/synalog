# Test: NULLS FIRST / NULLS LAST after the direction. (from tests/programs/directives/14_order_by_nulls_last.l)

@OrderBy(V, "x DESC NULLS LAST");
V(x: 1);
V(x: 2);
V(x: null);
