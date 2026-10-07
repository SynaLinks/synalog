# Products under 5.
# Expect: rows Q = [('a1',)]
import lib.shop.Product;
Q(sku:) :- Product(sku:, price:), price < 5;
