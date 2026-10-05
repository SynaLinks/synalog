# Test: Products of letter c without stock. (from tests/programs/modules/unstocked_c.l)

import lib.shop.Product;
import lib.shop.Stock;
Q(sku:) :- Product(sku:), ~Stock(sku:), Substr(sku, 1, 1) == "c";
