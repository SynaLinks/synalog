# distinct compares whole rows.
# Expect: rows D = [(1, "a"), (1, "b")]
V(x: 1, y: "a");
V(x: 1, y: "a");
V(x: 1, y: "b");
@OrderBy(D, "y");
D(x:, y:) distinct :- V(x:, y:);
