# Products with no stock row, a negation of an import.
# Expect: rows Q = [('b2',)]
import lib.shop.Product;
import lib.shop.Stock;
Q(sku:) :- Product(sku:), ~Stock(sku:);
