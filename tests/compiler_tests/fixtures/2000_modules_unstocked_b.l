# Test: Products of letter b without stock. (from tests/programs/modules/unstocked_b.l)

import lib.shop.Product;
import lib.shop.Stock;
Q(sku:) :- Product(sku:), ~Stock(sku:), Substr(sku, 1, 1) == "b";
