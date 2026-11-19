# Counting only payments above 2 drops payment 4 of BIN 4111: the sum
# no longer matches the total there.
# Expect: violated BinTotal.sums_up 1

@Assert(BinTotal, sums_up: "∀ b, BinTotal b = ∑ s, BigBinScheme b s");
Payment(id: 1, card_bin: 4111, scheme: "visa", amount: 10);
Payment(id: 2, card_bin: 4111, scheme: "visa", amount: 5);
Payment(id: 3, card_bin: 4111, scheme: "mc", amount: 3);
Payment(id: 4, card_bin: 4111, scheme: "visa", amount: 2);
Payment(id: 5, card_bin: 5500, scheme: "mc", amount: 7);
BinScheme(card_bin:, scheme:, n? += 1) distinct :- Payment(card_bin:, scheme:);
BinTotal(card_bin:, total? += 1) distinct :- Payment(card_bin:);
# Columns: card_bin, total, scheme, top.
Dominant(card_bin:, total:, scheme:, top:) :-
  BinTotal(card_bin:, total:), BinScheme(card_bin:, scheme:, n: top), top * 2 > total;
BigBinScheme(card_bin:, scheme:, n? += 1) distinct :- Payment(card_bin:, scheme:, amount:), amount > 2;
