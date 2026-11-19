# A BIN paying with one scheme only (defined by negation) has all its
# payments on that scheme.
# Expect: holds Pure.all_on_one

@Assert(Pure, all_on_one: "∀ b s, Pure b s → BinScheme b s = BinTotal b");
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
Mixed(card_bin:) distinct :- BinScheme(card_bin:, scheme: "mc"), BinScheme(card_bin:, scheme: "visa");
Pure(card_bin:, scheme:) :- BinScheme(card_bin:, scheme:), ~Mixed(card_bin:);
