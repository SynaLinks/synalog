# Test: A texts column with a null in row 3, after a join. (from tests/programs/typing/texts_null_at_2_joined.l)

V(k: 1, v: ["a"]);
V(k: 2, v: ["b", "c"]);
V(k: 3, v: null);
K(k: 1);
K(k: 2);
K(k: 3);
@OrderBy(Q, "k");
Q(k:, r: Size(v)) :- K(k:), V(k:, v:);
