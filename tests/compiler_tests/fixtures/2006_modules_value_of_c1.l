# Test: The stock value of c1. (from tests/programs/modules/value_of_c1.l)

import lib.shop.Value;
Q(value:) :- Value(sku: "c1", value:);
