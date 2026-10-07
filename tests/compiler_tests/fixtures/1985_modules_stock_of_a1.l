# Test: The stock of a1. (from tests/programs/modules/stock_of_a1.l)

import lib.shop.Stock;
Q(qty:) :- Stock(sku: "a1", qty:);
