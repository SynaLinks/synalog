# Test: A derived imported predicate. (from tests/programs/modules/imported_derived.l)

import lib.shop.Value;
@OrderBy(Q, "sku", "value");
Q(sku:, value:) :- Value(sku:, value:);
