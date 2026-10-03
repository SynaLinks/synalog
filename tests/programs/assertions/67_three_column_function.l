# A three-column predicate applied to two arguments is a function.
# Expect: counterexamples Cell.positive = [(1, 2)]
@Assert(Cell, positive: "∀ r c, Cell r c > 0");
Cell(r: 1, c: 1, v: 5);
Cell(r: 1, c: 2, v: -1);
