# Test: A text column with a null in row 2, read directly. (from tests/programs/typing/text_null_at_1_direct.l)

V(k: 1, v: "a");
V(k: 2, v: null);
V(k: 3, v: "bc");
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
