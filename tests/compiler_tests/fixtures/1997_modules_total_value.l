# Test: Total stock value, aggregated from an import. (from tests/programs/modules/total_value.l)

import lib.shop.Value;
Q(t? += value) distinct :- Value(value:);
