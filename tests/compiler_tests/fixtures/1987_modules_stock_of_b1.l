# Test: The stock of b1. (from tests/programs/modules/stock_of_b1.l)

import lib.shop.Stock;
Q(qty:) :- Stock(sku: "b1", qty:);
