# Test: A float column with a null in row 3, read directly. (from tests/programs/typing/float_null_at_2_direct.l)

V(k: 1, v: 2.5);
V(k: 2, v: 0.25);
V(k: 3, v: null);
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
