# Two aliases of one file, joined.
# Expect: rows Q = [('lamp', 90), ('mug', 0), ('pad', 200), ('pen', 200)]
import lib.shop.Product as P;
import lib.shop.Value as V;
@OrderBy(Q, "name", "value");
Q(name:, value:) :- P(sku:, name:), V(sku:, value:);
