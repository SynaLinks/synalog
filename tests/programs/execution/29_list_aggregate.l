# Count of distinct values per group.
# Expect: rows Kinds = [("a", 2), ("b", 1)]
R(k: "a", v: 1);
R(k: "a", v: 2);
R(k: "a", v: 2);
R(k: "b", v: 5);
@OrderBy(Kinds, "k");
Kinds(k:, n? Count= v) distinct :- R(k:, v:);
