# Test: A float column with a null in row 1, after a join. (from tests/programs/typing/float_null_at_0_joined.l)

V(k: 1, v: null);
V(k: 2, v: 2.5);
V(k: 3, v: 0.25);
K(k: 1);
K(k: 2);
K(k: 3);
@OrderBy(Q, "k");
Q(k:, r: v) :- K(k:), V(k:, v:);
