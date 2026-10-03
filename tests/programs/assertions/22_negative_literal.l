# Every change stays above -10.
# Expect: holds Delta.floor

@Assert(Delta, floor: "∀ d, Delta d ≥ -10");
Delta(day: 1, change: -3);
Delta(day: 2, change: 7);
