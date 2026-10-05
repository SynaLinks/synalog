# Test: The stock of c1. (from tests/programs/modules/stock_of_c1.l)

import lib.shop.Stock;
Q(qty:) :- Stock(sku: "c1", qty:);
