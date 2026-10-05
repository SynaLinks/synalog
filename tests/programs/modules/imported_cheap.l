# An imported filter.
# Expect: rows Q = [('a1',), ('a2',), ('c1',)]
import lib.shop.Cheap;
@OrderBy(Q, "sku");
Q(sku:) :- Cheap(sku:);
