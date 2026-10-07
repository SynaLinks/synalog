# Test: A texts column with a null in row 3, read directly. (from tests/programs/typing/texts_null_at_2_direct.l)

V(k: 1, v: ["a"]);
V(k: 2, v: ["b", "c"]);
V(k: 3, v: null);
@OrderBy(Q, "k");
Q(k:, r: Size(v)) :- V(k:, v:);
