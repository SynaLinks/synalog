# The rate column is the disputed share of the volume, row by row.
# Expect: holds Rate.definition

@Assert(Rate, definition: "∀ m v d r, Rate m v d r → r * v = d");
Pay(id: 1, merchant: "a", amount: 100, fraud: 1);
Pay(id: 2, merchant: "a", amount: 100, fraud: 0);
Pay(id: 3, merchant: "b", amount: 80, fraud: 1);
Volume(merchant:, volume? += amount) distinct :- Pay(merchant:, amount:);
Disputed(merchant:, disputed? += amount) distinct :- Pay(merchant:, amount:, fraud: 1);
Rate(merchant:, volume:, disputed:, rate:) :-
  Volume(merchant:, volume:), Disputed(merchant:, disputed:), rate == disputed / volume;
