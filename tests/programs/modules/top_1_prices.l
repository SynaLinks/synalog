# The 1 highest prices, ordered and limited over an import.
# Expect: rows Q = [('b2', 120)]
import lib.shop.Product;
@OrderBy(Q, "price desc");
@Limit(Q, 1);
Q(sku:, price:) :- Product(sku:, price:);
