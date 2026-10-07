# Test: The price of c1 through another alias. (from tests/programs/modules/catalog_price_of_c1.l)

import lib.shop.Product as Catalog;
Q(price:) :- Catalog(sku: "c1", price:);
