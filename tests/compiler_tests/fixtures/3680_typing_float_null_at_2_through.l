# Test: A float column with a null in row 3, through another predicate. (from tests/programs/typing/float_null_at_2_through.l)

V(k: 1, v: 2.5);
V(k: 2, v: 0.25);
V(k: 3, v: null);
W(k:, v:) :- V(k:, v:);
@OrderBy(Q, "k");
Q(k:, r: v) :- W(k:, v:);
