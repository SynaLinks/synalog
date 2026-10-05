# The price of c1, from an imported predicate.
# Expect: rows Q = [(8,)]
import lib.shop.Product;
Q(price:) :- Product(sku: "c1", price:);
