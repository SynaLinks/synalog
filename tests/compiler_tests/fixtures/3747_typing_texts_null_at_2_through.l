# Test: A texts column with a null in row 3, through another predicate. (from tests/programs/typing/texts_null_at_2_through.l)

V(k: 1, v: ["a"]);
V(k: 2, v: ["b", "c"]);
V(k: 3, v: null);
W(k:, v:) :- V(k:, v:);
@OrderBy(Q, "k");
Q(k:, r: Size(v)) :- W(k:, v:);
