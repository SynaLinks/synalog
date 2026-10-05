# Test: Search '1$' over an import. (from tests/programs/modules/search_1_end.l)

import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
