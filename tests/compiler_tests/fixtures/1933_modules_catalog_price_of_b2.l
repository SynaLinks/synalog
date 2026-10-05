# Test: The price of b2 through another alias. (from tests/programs/modules/catalog_price_of_b2.l)

import lib.shop.Product as Catalog;
Q(price:) :- Catalog(sku: "b2", price:);
