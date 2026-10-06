# Test: A text column with a null in row 3, after a join. (from tests/programs/typing/text_null_at_2_joined.l)

V(k: 1, v: "a");
V(k: 2, v: "bc");
V(k: 3, v: null);
K(k: 1);
K(k: 2);
K(k: 3);
@OrderBy(Q, "k");
Q(k:, r: v) :- K(k:), V(k:, v:);
