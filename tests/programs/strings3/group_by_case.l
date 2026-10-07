# Grouping tells cases apart.
# Expect: rows Q = [("A", 1), ("a", 2)]
V(k: 1, w: "a");
V(k: 2, w: "A");
V(k: 3, w: "a");
@OrderBy(Q, "w");
Q(w:, n? += 1) distinct :- V(w:);
