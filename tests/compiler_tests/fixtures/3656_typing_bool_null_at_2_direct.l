# Test: A bool column with a null in row 3, read directly. (from tests/programs/typing/bool_null_at_2_direct.l)

V(k: 1, v: true);
V(k: 2, v: false);
V(k: 3, v: null);
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
