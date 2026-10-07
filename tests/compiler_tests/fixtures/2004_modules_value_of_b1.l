# Test: The stock value of b1. (from tests/programs/modules/value_of_b1.l)

import lib.shop.Value;
Q(value:) :- Value(sku: "b1", value:);
