# A BIN's dominant scheme, its total and its count are one row: compared
# column by column across two rows of the same BIN.
# Expect: holds Dominant.functional

@Assert(Dominant, functional: "∀ b t1 s1 p1 t2 s2 p2, Dominant b t1 s1 p1 ∧ Dominant b t2 s2 p2 → s1 = s2 ∧ p1 = p2 ∧ t1 = t2");
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
