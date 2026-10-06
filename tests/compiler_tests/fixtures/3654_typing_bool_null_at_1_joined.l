# Test: A bool column with a null in row 2, after a join. (from tests/programs/typing/bool_null_at_1_joined.l)

V(k: 1, v: true);
V(k: 2, v: null);
V(k: 3, v: false);
K(k: 1);
K(k: 2);
K(k: 3);
@OrderBy(Q, "k");
Q(k:, r: v) :- K(k:), V(k:, v:);
