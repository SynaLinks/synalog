# Test: A float column with a null in row 2, read directly. (from tests/programs/typing/float_null_at_1_direct.l)

V(k: 1, v: 2.5);
V(k: 2, v: null);
V(k: 3, v: 0.25);
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
