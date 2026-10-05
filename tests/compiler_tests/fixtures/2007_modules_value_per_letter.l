# Test: Stock value per sku letter. (from tests/programs/modules/value_per_letter.l)

import lib.shop.Value;
@OrderBy(Q, "letter", "t");
Q(letter: Substr(sku, 1, 1), t? += value) distinct :- Value(sku:, value:);
