# Test: Whether a1 is cheap. (from tests/programs/modules/is_cheap_a1.l)

import lib.shop.Cheap;
Q(ok: 1) :- Cheap(sku: "a1");
