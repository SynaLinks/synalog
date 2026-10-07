# ↔ between a comparison and a relation.
# Expect: counterexamples Score.label = [("c",)]
@Assert(Score, label: "∀ n, Score n > 5 ↔ High n");
Score(name: "a", s: 9);
Score(name: "b", s: 1);
Score(name: "c", s: 7);
High(name: "a");
