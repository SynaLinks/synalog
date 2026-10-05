# Test: Search '[0-9]' over an import. (from tests/programs/modules/search_0_9.l)

import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
