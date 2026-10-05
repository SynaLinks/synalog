# Test: Search '^a' over an import. (from tests/programs/modules/search_start_a.l)

import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
