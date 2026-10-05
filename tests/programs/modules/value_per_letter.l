# Stock value per sku letter.
# Expect: rows Q = [('a', 400), ('b', 90), ('c', 0)]
import lib.shop.Value;
@OrderBy(Q, "letter", "t");
Q(letter: Substr(sku, 1, 1), t? += value) distinct :- Value(sku:, value:);
