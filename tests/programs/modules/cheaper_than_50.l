# Products under 50.
# Expect: rows Q = [('a1',), ('a2',), ('b1',), ('c1',)]
import lib.shop.Product;
@OrderBy(Q, "sku");
Q(sku:) :- Product(sku:, price:), price < 50;
