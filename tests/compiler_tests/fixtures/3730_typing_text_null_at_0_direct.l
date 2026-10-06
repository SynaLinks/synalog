# Test: A text column with a null in row 1, read directly. (from tests/programs/typing/text_null_at_0_direct.l)

V(k: 1, v: null);
V(k: 2, v: "a");
V(k: 3, v: "bc");
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
