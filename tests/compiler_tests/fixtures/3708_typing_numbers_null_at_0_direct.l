# Test: A numbers column with a null in row 1, read directly. (from tests/programs/typing/numbers_null_at_0_direct.l)

V(k: 1, v: null);
V(k: 2, v: [1, 2]);
V(k: 3, v: [3]);
@OrderBy(Q, "k");
Q(k:, r: Size(v)) :- V(k:, v:);
