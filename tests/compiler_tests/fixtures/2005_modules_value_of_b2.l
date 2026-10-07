# Test: The stock value of b2. (from tests/programs/modules/value_of_b2.l)

import lib.shop.Value;
Q(value:) :- Value(sku: "b2", value:);
