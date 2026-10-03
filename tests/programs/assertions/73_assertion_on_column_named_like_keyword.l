# An assertion about a predicate whose columns are SQL keywords.
# Expect: counterexamples R.ordered = [(3, 1)]
@Assert(R, ordered: "∀ o g, R o g → o < g");
R(order: 1, group: 2);
R(order: 3, group: 1);
