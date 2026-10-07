# Test: Whether c1 is cheap. (from tests/programs/modules/is_cheap_c1.l)

import lib.shop.Cheap;
Q(ok: 1) :- Cheap(sku: "c1");
