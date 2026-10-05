# The price of a1, from an imported predicate.
# Expect: rows Q = [(2,)]
import lib.shop.Product;
Q(price:) :- Product(sku: "a1", price:);
