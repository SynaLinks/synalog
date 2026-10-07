# Test: Search '^d' over an import. (from tests/programs/modules/search_start_d.l)

import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
