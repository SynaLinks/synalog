# Whether b2 is cheap.
# Expect: rows Q = []
import lib.shop.Cheap;
Q(ok: 1) :- Cheap(sku: "b2");
