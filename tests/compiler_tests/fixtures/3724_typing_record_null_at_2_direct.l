# Test: A record column with a null in row 3, read directly. (from tests/programs/typing/record_null_at_2_direct.l)

V(k: 1, v: {x: 1, y: "p"});
V(k: 2, v: {x: 2, y: "q"});
V(k: 3, v: null);
@OrderBy(Q, "k");
Q(k:, r: v.y) :- V(k:, v:);
