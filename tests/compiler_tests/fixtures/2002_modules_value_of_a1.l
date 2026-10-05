# Test: The stock value of a1. (from tests/programs/modules/value_of_a1.l)

import lib.shop.Value;
Q(value:) :- Value(sku: "a1", value:);
