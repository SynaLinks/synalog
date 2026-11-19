# BIN 6011 pays only with amex, a scheme the list does not know.
# Expect: violated Dominant.known 1
# Expect: counterexamples Dominant.known = [(6011, 1, "amex", 1)]

@Assert(Dominant, known: "∀ b t s p, Dominant b t s p → SchemeName s");
Payment(id: 1, card_bin: 4111, scheme: "visa", amount: 10);
Payment(id: 2, card_bin: 4111, scheme: "visa", amount: 5);
Payment(id: 3, card_bin: 4111, scheme: "mc", amount: 3);
Payment(id: 4, card_bin: 4111, scheme: "visa", amount: 2);
Payment(id: 5, card_bin: 5500, scheme: "mc", amount: 7);
Payment(id: 6, card_bin: 6011, scheme: "amex", amount: 4);
BinScheme(card_bin:, scheme:, n? += 1) distinct :- Payment(card_bin:, scheme:);
BinTotal(card_bin:, total? += 1) distinct :- Payment(card_bin:);
# Columns: card_bin, total, scheme, top.
Dominant(card_bin:, total:, scheme:, top:) :-
  BinTotal(card_bin:, total:), BinScheme(card_bin:, scheme:, n: top), top * 2 > total;
SchemeName(scheme: "visa");
SchemeName(scheme: "mc");
