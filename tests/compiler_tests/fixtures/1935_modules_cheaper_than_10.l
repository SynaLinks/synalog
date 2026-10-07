# Test: Products under 10. (from tests/programs/modules/cheaper_than_10.l)

import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:) :- Product(sku:, price:), price < 10;
