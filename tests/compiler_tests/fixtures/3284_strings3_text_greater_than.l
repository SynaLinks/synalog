# Test: Text after "m", in code point order. (from tests/programs/strings3/text_greater_than.l)

V(w: "A");
V(w: "Z");
V(w: "n");
V(w: "z");
V(w: "m");
@OrderBy(Q, "w");
Q(w:) :- V(w:), w > "m";
