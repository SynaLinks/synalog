# Membership of text in a list tells cases apart.
# Expect: rows Q = [("b",)]
V(w: "b");
V(w: "B");
Q(w:) :- V(w:), w in ["a", "b"];
