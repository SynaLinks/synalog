# Test: The price of a2 through another alias. (from tests/programs/modules/catalog_price_of_a2.l)

import lib.shop.Product as Catalog;
Q(price:) :- Catalog(sku: "a2", price:);
