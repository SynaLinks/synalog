# Test: Products whose stock is zero or missing. (from tests/programs/modules/out_of_stock.l)

import lib.shop.Product;
import lib.shop.Stock;
InStock(sku:) :- Stock(sku:, qty:), qty > 0;
@OrderBy(Q, "sku");
Q(sku:) :- Product(sku:), ~InStock(sku:);
