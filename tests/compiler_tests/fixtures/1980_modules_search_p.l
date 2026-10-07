# Test: Search 'p' over an import. (from tests/programs/modules/search_p.l)

import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
