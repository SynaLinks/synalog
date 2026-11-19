# Joining the acquirers (two for merchant a) before summing counts a's
# fraud twice: disputed 200 on a volume of 150.
# Expect: violated Rate.disputed_within_volume 1
# Expect: counterexamples Rate.disputed_within_volume = [("a", 150, 200)]

@Assert(Rate, disputed_within_volume: "∀ m v d, Rate m v d → 0 ≤ d ∧ d ≤ v");
Pay(id: 1, merchant: "a", amount: 100, fraud: 1);
Pay(id: 2, merchant: "a", amount: 50, fraud: 0);
Pay(id: 3, merchant: "b", amount: 80, fraud: 1);
Acq(merchant: "a", acquirer: "x");
Acq(merchant: "a", acquirer: "y");
Acq(merchant: "b", acquirer: "x");
Volume(merchant:, volume? += amount) distinct :- Pay(merchant:, amount:);
Disputed(merchant:, disputed? += amount) distinct :- Pay(merchant:, amount:, fraud: 1), Acq(merchant:);
Rate(merchant:, volume:, disputed:) :- Volume(merchant:, volume:), Disputed(merchant:, disputed:);
