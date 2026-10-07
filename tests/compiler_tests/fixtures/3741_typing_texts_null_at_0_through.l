# Test: A texts column with a null in row 1, through another predicate. (from tests/programs/typing/texts_null_at_0_through.l)

V(k: 1, v: null);
V(k: 2, v: ["a"]);
V(k: 3, v: ["b", "c"]);
W(k:, v:) :- V(k:, v:);
@OrderBy(Q, "k");
Q(k:, r: Size(v)) :- W(k:, v:);
