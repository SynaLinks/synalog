# -10 is not ≥ -5.
# Expect: counterexamples Delta.floor = [(2,)]
@Assert(Delta, floor: "∀ d, Delta d ≥ -5");
Delta(day: 1, change: -3);
Delta(day: 2, change: -10);
