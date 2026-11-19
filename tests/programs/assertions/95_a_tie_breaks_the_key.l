# Half or more, not more than half: a BIN split one visa, one mc has two
# leading schemes, both directions of the pair break the key.
# Expect: violated Leading.one_scheme 2

@Assert(Leading, one_scheme: "∀ b t1 s1 p1 t2 s2 p2, Leading b t1 s1 p1 ∧ Leading b t2 s2 p2 → s1 = s2");
Payment(id: 1, card_bin: 6011, scheme: "visa", amount: 10);
Payment(id: 2, card_bin: 6011, scheme: "mc", amount: 5);
Payment(id: 3, card_bin: 5500, scheme: "mc", amount: 7);
BinScheme(card_bin:, scheme:, n? += 1) distinct :- Payment(card_bin:, scheme:);
BinTotal(card_bin:, total? += 1) distinct :- Payment(card_bin:);
Leading(card_bin:, total:, scheme:, top:) :-
  BinTotal(card_bin:, total:), BinScheme(card_bin:, scheme:, n: top), top * 2 >= total;
