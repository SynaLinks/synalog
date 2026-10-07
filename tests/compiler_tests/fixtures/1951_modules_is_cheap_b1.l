# Test: Whether b1 is cheap. (from tests/programs/modules/is_cheap_b1.l)

import lib.shop.Cheap;
Q(ok: 1) :- Cheap(sku: "b1");
