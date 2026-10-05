# Test: Whether a2 is cheap. (from tests/programs/modules/is_cheap_a2.l)

import lib.shop.Cheap;
Q(ok: 1) :- Cheap(sku: "a2");
