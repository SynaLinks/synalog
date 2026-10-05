# Test: Products under 50. (from tests/programs/modules/cheaper_than_50.l)

import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:) :- Product(sku:, price:), price < 50;
