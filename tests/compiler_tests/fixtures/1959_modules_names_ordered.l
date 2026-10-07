# Test: Names in order, from an import. (from tests/programs/modules/names_ordered.l)

import lib.shop.Product;
@OrderBy(Q, "name");
Q(name:) :- Product(name:);
