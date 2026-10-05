# Test: The price of a1, from an imported predicate. (from tests/programs/modules/price_of_a1.l)

import lib.shop.Product;
Q(price:) :- Product(sku: "a1", price:);
