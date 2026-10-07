# Test: The price of b2, from an imported predicate. (from tests/programs/modules/price_of_b2.l)

import lib.shop.Product;
Q(price:) :- Product(sku: "b2", price:);
