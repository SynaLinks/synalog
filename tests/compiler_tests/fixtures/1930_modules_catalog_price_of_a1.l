# Test: The price of a1 through another alias. (from tests/programs/modules/catalog_price_of_a1.l)

import lib.shop.Product as Catalog;
Q(price:) :- Catalog(sku: "a1", price:);
