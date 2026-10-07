# Test: Search 'e$' over an import. (from tests/programs/modules/search_e_end.l)

import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:, name:) :- Product(sku:, name:);
