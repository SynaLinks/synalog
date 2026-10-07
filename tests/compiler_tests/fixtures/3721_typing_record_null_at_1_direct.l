# Test: A record column with a null in row 2, read directly. (from tests/programs/typing/record_null_at_1_direct.l)

V(k: 1, v: {x: 1, y: "p"});
V(k: 2, v: null);
V(k: 3, v: {x: 2, y: "q"});
@OrderBy(Q, "k");
Q(k:, r: v.y) :- V(k:, v:);
