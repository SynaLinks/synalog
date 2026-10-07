# Test: Products of letter a without stock. (from tests/programs/modules/unstocked_a.l)

import lib.shop.Product;
import lib.shop.Stock;
Q(sku:) :- Product(sku:), ~Stock(sku:), Substr(sku, 1, 1) == "a";
