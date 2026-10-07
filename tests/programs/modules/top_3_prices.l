# The 3 highest prices, ordered and limited over an import.
# Expect: rows Q = [('b2', 120), ('b1', 30), ('c1', 8)]
import lib.shop.Product;
@OrderBy(Q, "price desc");
@Limit(Q, 3);
Q(sku:, price:) :- Product(sku:, price:);
