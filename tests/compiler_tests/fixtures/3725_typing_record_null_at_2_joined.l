# Test: A record column with a null in row 3, after a join. (from tests/programs/typing/record_null_at_2_joined.l)

V(k: 1, v: {x: 1, y: "p"});
V(k: 2, v: {x: 2, y: "q"});
V(k: 3, v: null);
K(k: 1);
K(k: 2);
K(k: 3);
@OrderBy(Q, "k");
Q(k:, r: v.y) :- K(k:), V(k:, v:);
