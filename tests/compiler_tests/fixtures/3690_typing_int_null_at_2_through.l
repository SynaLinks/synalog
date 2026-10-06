# Test: A int column with a null in row 3, through another predicate. (from tests/programs/typing/int_null_at_2_through.l)

V(k: 1, v: 4);
V(k: 2, v: 7);
V(k: 3, v: null);
W(k:, v:) :- V(k:, v:);
@OrderBy(Q, "k");
Q(k:, r: v) :- W(k:, v:);
