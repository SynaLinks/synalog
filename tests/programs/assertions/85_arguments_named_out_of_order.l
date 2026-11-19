# The variables are named as if the columns were (card_bin, top, scheme,
# total), but arguments follow the head: `p` is the total and `t` the top.
# The statement then says total ≤ top, false on BIN 4111 (4 payments, 3 visa).
# Expect: violated Dominant.named_out_of_order 1
# Expect: counterexamples Dominant.named_out_of_order = [(4111, 4, "visa", 3)]

@Assert(Dominant, named_out_of_order: "∀ b p s t, Dominant b p s t → p ≤ t");
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
