# Whether c1 is cheap.
# Expect: rows Q = [(1,)]
import lib.shop.Cheap;
Q(ok: 1) :- Cheap(sku: "c1");
