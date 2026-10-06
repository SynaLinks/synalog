# Test: A text column with a null in row 3, through another predicate. (from tests/programs/typing/text_null_at_2_through.l)

V(k: 1, v: "a");
V(k: 2, v: "bc");
V(k: 3, v: null);
W(k:, v:) :- V(k:, v:);
@OrderBy(Q, "k");
Q(k:, r: v) :- W(k:, v:);
