# Products whose stock is zero or missing.
# Expect: rows Q = [('b2',), ('c1',)]
import lib.shop.Product;
import lib.shop.Stock;
InStock(sku:) :- Stock(sku:, qty:), qty > 0;
@OrderBy(Q, "sku");
Q(sku:) :- Product(sku:), ~InStock(sku:);
