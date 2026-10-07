# Test: Search '^[bc]' over an import. (from tests/programs/modules/search_start_bc.l)

import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
