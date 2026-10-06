# Test: A int column with a null in row 3, read directly. (from tests/programs/typing/int_null_at_2_direct.l)

V(k: 1, v: 4);
V(k: 2, v: 7);
V(k: 3, v: null);
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
