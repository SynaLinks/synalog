# Test: An imported filter. (from tests/programs/modules/imported_cheap.l)

import lib.shop.Cheap;
@OrderBy(Q, "sku");
Q(sku:) :- Cheap(sku:);
