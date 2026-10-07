# Test: A texts column with a null in row 2, read directly. (from tests/programs/typing/texts_null_at_1_direct.l)

V(k: 1, v: ["a"]);
V(k: 2, v: null);
V(k: 3, v: ["b", "c"]);
@OrderBy(Q, "k");
Q(k:, r: Size(v)) :- V(k:, v:);
