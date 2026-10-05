# Test: A conditional testing for null. (from tests/programs/conditionals/09_conditional_on_null_value.l)

V(k: 1, x: 5);
V(k: 2, x: null);
@OrderBy(C, "k");
C(k:, w: (if x is null then "unset" else "set")) :- V(k:, x:);
