# Test: Two aliases of one file, joined. (from tests/programs/modules/aliased_join.l)

import lib.shop.Product as P;
import lib.shop.Value as V;
@OrderBy(Q, "name", "value");
Q(name:, value:) :- P(sku:, name:), V(sku:, value:);
