# Test: A bool column with a null in row 2, read directly. (from tests/programs/typing/bool_null_at_1_direct.l)

V(k: 1, v: true);
V(k: 2, v: null);
V(k: 3, v: false);
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
