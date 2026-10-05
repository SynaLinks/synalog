# A derived imported predicate.
# Expect: rows Q = [('a1', 200), ('a2', 200), ('b1', 90), ('c1', 0)]
import lib.shop.Value;
@OrderBy(Q, "sku", "value");
Q(sku:, value:) :- Value(sku:, value:);
