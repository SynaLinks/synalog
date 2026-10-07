# Test: A int column with a null in row 2, read directly. (from tests/programs/typing/int_null_at_1_direct.l)

V(k: 1, v: 4);
V(k: 2, v: null);
V(k: 3, v: 7);
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
