# Test: The price of c1, from an imported predicate. (from tests/programs/modules/price_of_c1.l)

import lib.shop.Product;
Q(price:) :- Product(sku: "c1", price:);
