# Fraud disputed on a merchant's payments never exceeds its volume.
# Expect: holds Rate.disputed_within_volume

@Assert(Rate, disputed_within_volume: "∀ m v d, Rate m v d → 0 ≤ d ∧ d ≤ v");
Pay(id: 1, merchant: "a", amount: 100, fraud: 1);
Pay(id: 2, merchant: "a", amount: 50, fraud: 0);
Pay(id: 3, merchant: "b", amount: 80, fraud: 1);
Volume(merchant:, volume? += amount) distinct :- Pay(merchant:, amount:);
Disputed(merchant:, disputed? += amount) distinct :- Pay(merchant:, amount:, fraud: 1);
Rate(merchant:, volume:, disputed:) :- Volume(merchant:, volume:), Disputed(merchant:, disputed:);
