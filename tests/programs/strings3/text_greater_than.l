# Text after "m", in code point order.
# Expect: rows Q = [("n",), ("z",)]
V(w: "A");
V(w: "Z");
V(w: "n");
V(w: "z");
V(w: "m");
@OrderBy(Q, "w");
Q(w:) :- V(w:), w > "m";
