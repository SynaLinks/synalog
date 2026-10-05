# Test: The stock of a2. (from tests/programs/modules/stock_of_a2.l)

import lib.shop.Stock;
Q(qty:) :- Stock(sku: "a2", qty:);
