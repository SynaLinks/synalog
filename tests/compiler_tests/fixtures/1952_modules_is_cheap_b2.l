# Test: Whether b2 is cheap. (from tests/programs/modules/is_cheap_b2.l)

import lib.shop.Cheap;
Q(ok: 1) :- Cheap(sku: "b2");
