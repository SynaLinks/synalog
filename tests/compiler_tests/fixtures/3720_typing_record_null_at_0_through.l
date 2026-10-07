# Test: A record column with a null in row 1, through another predicate. (from tests/programs/typing/record_null_at_0_through.l)

V(k: 1, v: null);
V(k: 2, v: {x: 1, y: "p"});
V(k: 3, v: {x: 2, y: "q"});
W(k:, v:) :- V(k:, v:);
@OrderBy(Q, "k");
Q(k:, r: v.y) :- W(k:, v:);
