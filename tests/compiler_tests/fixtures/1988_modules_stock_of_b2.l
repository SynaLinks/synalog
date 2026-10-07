# Test: The stock of b2. (from tests/programs/modules/stock_of_b2.l)

import lib.shop.Stock;
Q(qty:) :- Stock(sku: "b2", qty:);
