# Test: The price of b1 through another alias. (from tests/programs/modules/catalog_price_of_b1.l)

import lib.shop.Product as Catalog;
Q(price:) :- Catalog(sku: "b1", price:);
