# A key on a predicate with keyword columns.
# Expect: counterexamples R.key = [(1, "a", "b"), (1, "b", "a")]
@Assert(R, key: "∀ o g h, R o g → R o h → g = h");
R(order: 1, group: "a");
R(order: 1, group: "b");
R(order: 2, group: "c");
