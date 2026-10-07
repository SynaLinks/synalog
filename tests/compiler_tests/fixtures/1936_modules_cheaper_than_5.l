# Test: Products under 5. (from tests/programs/modules/cheaper_than_5.l)

import lib.shop.Product;
Q(sku:) :- Product(sku:, price:), price < 5;
