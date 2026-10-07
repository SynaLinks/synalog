# Test: The stock value of a2. (from tests/programs/modules/value_of_a2.l)

import lib.shop.Value;
Q(value:) :- Value(sku: "a2", value:);
