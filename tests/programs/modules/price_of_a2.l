# The price of a2, from an imported predicate.
# Expect: rows Q = [(5,)]
import lib.shop.Product;
Q(price:) :- Product(sku: "a2", price:);
