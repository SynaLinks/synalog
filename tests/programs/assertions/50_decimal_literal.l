# A decimal literal in the statement.
# Expect: counterexamples Rate.bounded = [("b",)]
@Assert(Rate, bounded: "∀ k, Rate k ≤ 0.5");
Rate(k: "a", r: 0.25);
Rate(k: "b", r: 0.75);
