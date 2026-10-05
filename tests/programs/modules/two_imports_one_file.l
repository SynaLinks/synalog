# Two predicates of one file, joined.
# Expect: rows Q = [('lamp', 3), ('mug', 0), ('pad', 40), ('pen', 100)]
import lib.shop.Product;
import lib.shop.Stock;
@OrderBy(Q, "name", "qty");
Q(name:, qty:) :- Product(sku:, name:), Stock(sku:, qty:);
