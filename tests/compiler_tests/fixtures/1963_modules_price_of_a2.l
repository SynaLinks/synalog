# Test: The price of a2, from an imported predicate. (from tests/programs/modules/price_of_a2.l)

import lib.shop.Product;
Q(price:) :- Product(sku: "a2", price:);
