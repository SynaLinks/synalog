# The 2 highest prices, ordered and limited over an import.
# Expect: rows Q = [('b2', 120), ('b1', 30)]
import lib.shop.Product;
@OrderBy(Q, "price desc");
@Limit(Q, 2);
Q(sku:, price:) :- Product(sku:, price:);
