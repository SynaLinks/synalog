# Test: A null first, a text after: the column is a text. (from tests/programs/typing/null_then_text.l)

V(k: 1, v: null);
V(k: 2, v: "x");
@OrderBy(Q, "k");
Q(k:, v:) :- V(k:, v:);
