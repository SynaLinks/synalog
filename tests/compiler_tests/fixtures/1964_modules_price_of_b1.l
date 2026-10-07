# Test: The price of b1, from an imported predicate. (from tests/programs/modules/price_of_b1.l)

import lib.shop.Product;
Q(price:) :- Product(sku: "b1", price:);
