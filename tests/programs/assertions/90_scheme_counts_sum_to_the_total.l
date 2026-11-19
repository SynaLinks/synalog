# A BIN's per-scheme counts add up to its total.
# Expect: holds BinTotal.sums_up

@Assert(BinTotal, sums_up: "∀ b, BinTotal b = ∑ s, BinScheme b s");
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
